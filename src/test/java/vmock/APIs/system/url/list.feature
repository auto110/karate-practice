Feature: 接口一览列表

  Background:
    * url vMockURL
    * cookies { JSESSIONID: '#(JSESSIONID)', rememberMe: '#(rememberMe)' }


  @api
  Scenario: 登录系统后，当点击左侧接口一览导航项时，获取系统参数列表
    Given path 'system/url/list'
    * form fields read("classpath:vmock/APIs/system/url/list.json")
    When method post
    Then status 200
    * match $.code == 0