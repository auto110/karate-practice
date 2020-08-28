package utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: qiaolinchen
 * @Date: 2020/7/6 13:38
 * @Description: http://zetcode.com/db/jdbctemplate/
 */
public class DBUtils {
    private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);
    private final JdbcTemplate jdbcTemplate;
    private DriverManagerDataSource dataSource;

    public DBUtils(Map<String, Object> configMap){
        String jdbcUrl = (String) configMap.get("jdbcUrl");
        String username = (String) configMap.get("username");
        String password = (String) configMap.get("password");
        String driver = (String)configMap.get("driverClassName");
        logger.info("jdbcURL的值: {}, username的值: {},password的值: {},driverClassName的值: {}",jdbcUrl,username,password,driver);

        dataSource = new DriverManagerDataSource(jdbcUrl,username,password);
        dataSource.setDriverClassName(driver);

        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public Object readValue(String query) {
        // Mapping Query Results to Java Object
        // The queryForObject() method executes an SQL query and returns a result object. The result type is specified in the arguments.
        return jdbcTemplate.queryForObject(query, Object.class);
    }

    public Map<String, Object> readRow(String query) {
        return jdbcTemplate.queryForMap(query);
    }

    public List<Map<String, Object>> readRows(String query) {
        //queryForList() method returns list of Map whereas Map contains the row data mapped with key as the column name and value from the database row matching the criteria.
        return jdbcTemplate.queryForList(query);
    }

    public static void main(String[] args) {
        Map<String,Object> configMap = new HashMap<>();
        configMap.put("jdbcUrl","jdbc:mysql://localhost:3306/karateAuto?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true&zeroDateTimeBehavior=convertToNull&useUnicode=true&allowMultiQueries=true&serverTimezone=UTC&useSSL=false");
        configMap.put("username","root");
        configMap.put("password","123456");
        configMap.put("driverClassName","com.mysql.cj.jdbc.Driver");
        DBUtils dbUtils = new DBUtils(configMap);
        Object name = dbUtils.readValue("select name from user where accountID = '100001'");
        System.out.println("姓名：" + name.toString());
    }
}
