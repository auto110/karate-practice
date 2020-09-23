package utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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

    public static void runSqlFile(Map<String, Object> dbConfigMap, String sqlFile_relativePath){
        String jdbcUrl = (String) dbConfigMap.get("jdbcUrl");
        String username = (String) dbConfigMap.get("username");
        String password = (String) dbConfigMap.get("password");
        String driver = (String)dbConfigMap.get("driverClassName");
        logger.info("jdbcURL的值: {}, username的值: {},password的值: {},driverClassName的值: {}",jdbcUrl,username,password,driver);

        try {
            Class.forName(driver);
            Connection mConnection = DriverManager.getConnection(jdbcUrl,username,password);
            ScriptRunner runner = new ScriptRunner(mConnection, false, false);
            runner.runScript(new BufferedReader(new FileReader(sqlFile_relativePath)));
        } catch (ClassNotFoundException e) {
            System.err.println("Unable to get mysql driver: " + e);
        } catch (FileNotFoundException e){
            System.err.println("Unable to find file: " + e);
        } catch (IOException e){
            System.err.println("IOException: " + e);
        }
        catch (SQLException e) {
            System.err.println("Unable to connect to server: " + e);
        }
    }

    public static void main(String[] args) {
        Map<String,Object> dbConfigMap = new HashMap<>();
        dbConfigMap.put("jdbcUrl","jdbc:mysql://localhost:3306/karateAuto?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true&zeroDateTimeBehavior=convertToNull&useUnicode=true&allowMultiQueries=true&serverTimezone=UTC&useSSL=false");
        dbConfigMap.put("username","root");
        dbConfigMap.put("password","123456");
        dbConfigMap.put("driverClassName","com.mysql.cj.jdbc.Driver");

        String sqlFile_relativePath = "docs/user.sql";
        logger.info("=====================开始执行sql脚本文件,初始化数据库" + sqlFile_relativePath + "======================");
        //执行数据库脚本
        try {
            DBUtils.runSqlFile(dbConfigMap,"docs/user.sql");
        }catch (Exception e){
            System.out.println("数据库脚本执行过程出现异常，请检查！");
        }
        logger.info("=====================" + sqlFile_relativePath + "文件执行完成======================");

        System.out.println();
        logger.info("=====================开始执行单条sql语句======================");
        DBUtils dbUtils = new DBUtils(dbConfigMap);
        Object name = dbUtils.readValue("select name from user where accountID = '100001'");
        System.out.println("姓名：" + name.toString());
        logger.info("=====================单条sql语句执行完成======================");
    }
}
