# Usage (使用说明)
## Preparing
1. database access (数据库访问) <br>

    1.1 preparing database (准备数据库)
        *   create a database and initialize the data: docs/user.sql
        
2. startup/setup the vmock system

## 执行
### ParallelAutoTest (并发执行)
go to the directory where the pom.xml file lives in and then run:
```shell script
mvn clean test
```

Java代码指定执行环境
```java
System.setProperty("karate.env", "test");
```

### 测试集执行
切换测试执行环境
1. test环境下执行所有用例
```shell script
$ mvn clean test -DargLine="-Dkarate.env=test" -Dtest=ParallelAutoTest.java
```

2. localhost环境下执行所有用例
```shell script
$ mvn clean test -DargLine="-Dkarate.env=localhost" -Dtest=ParallelAutoTest.java
```
其中，通过-DargLine设置Dkarate.env指定的执行环境；-Dtest指定用例执行的测试集（VMockRunner.java是Java文件的相对路径名称）

## Test report (查看测试报告)
1. go to path: target/cucumber-html-reports
2. open the overview-features.html page


# Tools
1.  https://github.com/intuit/ReplayZero
    - generate functional API tests, karate scenarios by default

2.  https://github.com/amalsgit/Karate-Gatling-Grafana
    - This is a sample project showcasing how a simple API test can be written in Karate for functional automation which can then be re-used to do performance testing by passing tests into Gatling.
