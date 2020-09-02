Feature: 浏览器端登录

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }

  Scenario: 登录github网站
    Given driver 'https://github.com/login'
    * input('#login_field', 'dummy')
    * input('#password', 'world')
    When submit().click("input[name=commit]")
    Then match html('#js-flash-container') contains 'Incorrect username or password.'