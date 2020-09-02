Feature: 用户管理列表

  Background:
    * url vMockURL
    * cookies { JSESSIONID: '#(JSESSIONID)', rememberMe: '#(rememberMe)' }


  @api
  Scenario: 登录系统后，当点击左侧用户管理导航项时，获取系统参数列表
    Given path 'system/user/list'
    * form fields read("classpath:vmock/APIs/system/user/list.json")
    When method post
    Then status 200
    * match $.code == 0