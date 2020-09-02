Feature: 接口日志列表

  Background:
    * url vMockURL
    * cookies { JSESSIONID: '#(JSESSIONID)', rememberMe: '#(rememberMe)' }


  @api
  Scenario: 登录系统后，当点击左侧接口日志导航项时，获取系统参数列表
    Given path 'system/log/list'
    * form fields read("classpath:vmock/APIs/system/log/list.json")
    When method post
    Then status 200
    * match $.code == 0