@ignore
Feature: v-mock 模拟接口的测试

  Background:
    * url vMockURL

  @api
  @ignore
  Scenario: 登录校验接口定义
    Given path 'login'
    * form fields read("classpath:vmock/APIs/login.json")
    When method POST
    Then status 200


  Scenario: 当输入正确的用户名和密码时，验证登录成功返回数据的正确性
    * def username = 'vmock'
    * def password = 'vmock123'

    * call read("classpath:vmock/APIs/login.feature@api")

    * match $ contains {"code":0,"msg":"操作成功"}