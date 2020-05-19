Feature: v-mock 模拟接口的测试
  Background: 
    * url 'http://172.16.0.115:9191'

    Scenario: 测试用例
      Given path '/vmock/hello'
      When method get
      Then status 200
      * match $.hello == "你好"