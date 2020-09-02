@ignore
Feature: 浏览器端登录

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }

  Scenario: 登录v-mock系统
    Given driver 'http://localhost:9191/login'
    * input('input[name=username]','vmock')
    * input('input[name=password]','vmock123')
    When submit().click("#btnSubmit")
    Then match html('#side-menu') contains 'V-Mock'

#