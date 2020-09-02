package utils;

/**
 * @Auther: qiaolinchen
 * @Date: 2020/9/2 10:53
 * @Description:
 */
public class DataFormatConverter {
    public static String convert2Json(String str){
        String newStr = str.replace("=",":").replace("&",",").replaceAll(":,",":\"\",");
        return "{" + newStr + "}";
    }

    public static void main(String[] args) {
        String testStr = "pageSize=10&pageNum=1&orderByColumn=createTime&isAsc=desc&parentId=&loginName=&phonenumber=&status=&params%5BbeginTime%5D=&params%5BendTime%5D=";
        System.out.println(convert2Json(testStr));
    }
}
