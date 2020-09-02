Feature: mock接口请求(接口路径以vmock为前缀)

  Background:
    * url vMockURL

  Scenario: mock接口请求默认示例
    Given path 'vmock/example'
    When method get
    Then status 200

  Scenario: 添加获取用户接口示例
    Given path 'vmock/getUser'
    When method get
    Then status 200
    * print "返回值：", response