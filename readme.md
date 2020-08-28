# Usage (使用说明)

## database access (数据库访问)
### preparing database (准备数据库)
create a database and initialize the data: docs/user.sql

### run test case （执行测试用例）
file path: utils/DBUtils.feature 


## ParallelAutoTest (并发执行方式)
go to the directory where the pom.xml file lives in and then run:
```shell script
mvn clean test
```

## test report (查看测试报告)
1. go to path: target/cucumber-html-reports
2. open the overview-features.html page


