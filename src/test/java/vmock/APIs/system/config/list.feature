Feature: 系统参数列表
  Background:
    * url vMockURL
    * cookies { JSESSIONID: '#(JSESSIONID)', rememberMe: '#(rememberMe)' }


    Scenario: 登录系统后，当点击左侧系统参数导航项时，获取系统参数列表
      Given path 'system/config/list'
      * form fields read("classpath:vmock/APIs/system/config/list.json")
      When method post
      Then status 200
      * match $.code == 0