@ignore
Feature: 数据库操作

  Background:
    # 根据不同的数据库入参，可以切换数据库（dbConfig变量可以定义到全局.js文件中，根据不同的测试环境动态切换）
  #    * def dbConfig = read("classpath:utils/javautils/DButils.json")
    * def dbUtils = Java.type('utils.DBUtils')
    * def db = new dbUtils(dbConfig)


  @readValue
  Scenario: 从数据库中读取单值示例
    * def accountID = 100001
#    * def foo = { getAccountSQL: '#("select name from user where accountID = " + accountID)'}
    * def sql = "select name from user where accountID = '" + accountID + "'"
    * def name = db.readValue(sql)
    * print "账号ID为" + accountID + "的姓名为" + name

    * def accountID = '100001'
    * def sql = 'select operation_time from user where accountID= ' + "'" + accountID + "'"
    * print "获取最后操作时间的sql语句：", sql
    * def operatetime = db.readValue(sql)
    * def formatDateString =
          """
          function(s) {
            var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
            var sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            var dd = sdf.parse(s)
            return sdf.format(dd);
          }
          """
    * def operatetime = formatDateString(operatetime)
    * print "获取到最后更新时间为：", operatetime


  @readRow
  Scenario: 从数据库中读取单行示例
    * def accountID = 100001
    # * def foo = { getAccountSQL: '#("select name from user where accountID = " + accountID)'}
    * def sql = "select * from user where accountID = '" + accountID + "'"
    # 从数据库获取到的数据是Java Map类型，并被karate自动转换为json格式
    * def specificRecord = db.readRow(sql)
    * print "账号ID为" + accountID + "的数据记录" , specificRecord
    * print "账号ID为" + accountID + "的姓名为:" + specificRecord.name


  @readRows
  Scenario: 从数据库中读取多行值示例
    #  从表user中读取所有数据情况
    * def userJSONList = db.readRows('SELECT * FROM user')
    * print "从数据库查询多行结果返回值：", userJSONList