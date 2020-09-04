@ignore
Feature: 浏览器端登录

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }

  @login
  Scenario: 登录v-mock系统
    Given driver vMockURL + '/login'
    * input('input[name=username]','vmock')
    * input('input[name=password]','vmock123')
    When submit().click("#btnSubmit")
    Then match html('#side-menu') contains 'V-Mock'

    * assert 3 == script("1 + 2")

    * driver.url =  vMockURL + '/#/system/url'
#    * switchPage('http://localhost:9191/#/system/url')
    * waitForUrl('http://localhost:9191/#/system/url')

    * driver.url =  vMockURL + '/#/system/log'
    * waitForUrl('http://localhost:9191/#/system/log')

    * waitForText('body', 'APPEARED')