package utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.*;

/**
 * @author pengzhengfa
 */
public class HttpUtil {
    
    private static HttpClient httpClient = new DefaultHttpClient();
    private static HttpPost httppost;
    private static HttpResponse response;
    private static HttpEntity entity;
    private static String postResult = null;
    
    /**
     * getCases接口测试
     */
    public static void requestPost(String requestUrl, Map<String, String> param) {
        httppost = new HttpPost(requestUrl);
        //创建Post请求参数
        List<NameValuePair> list = new ArrayList<NameValuePair>();
            for(Map.Entry<String, String> entry : param.entrySet()){
                String requestKey = entry.getKey();
                String requestValue = entry.getValue();
                BasicNameValuePair basicNameValuePair = new BasicNameValuePair(requestKey, requestValue);
                list.add(basicNameValuePair);
        }
        try {
            httppost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
            response = httpClient.execute(httppost);
            entity = response.getEntity();
            postResult = EntityUtils.toString(entity, "UTF-8");
            System.out.println("查看接口返回的数据：" + postResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        httppost.releaseConnection();
    }
    public static void main(String[] args) {
        HashMap<String, String> map = new HashMap<>();
        map.put("caseIds", "['b5e137c7-dbbf-4d36-a9ab-3854878f3d83']");
        map.put("originType", "miniprogram");
        map.put("usertoken", "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJiaW9zYW4iLCJzdWIiOiJ0b2tlbiIsImF1ZCI6ImJpb3Nhbi1zYWFzIiwianRpIjoiODA0NzY1ZGYzMWY3NGFlZjhkOWIxZGZjMGM5YjM5MDcifQ.C2NINu6Thl8HtqAlSSIP1RBfg6AgiY7aQ1bygV3iaVQYTryBd83AiLTmUM2aXCGEdSKf8Kuw_HACgUmFl27Ww3IfFE6IIqdQNi-QMkflPvKlQUFBIOsipuvuEnMRolzHtVU32tNo2dPgeE1S91c0HaLAcAUlUXWdJrVjTpxXHjxTJ-NoI9jh507r7cBHd0cg78T4lCv-vQvLxHS6uaexBacFE6oeHLW7ADljiG8S6nmkRHoRYK30sZQbJQLABex8Ky5uDGk6tXqrXvnY8_B75M4IwlJLvxQjT70GVwbx5UcaKlfJZ7GseOAxPZnNiti7x35rIwmVAM_myDxVcvaiNw");
        HttpUtil.requestPost("http://xcx.sys.saas.biosan.cn/treat/applet/getCases",map);
    }
}
