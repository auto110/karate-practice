Feature: 获取华为接口调用的必填参数token

  Background:
    * url 'https://iam.cn-east-2.myhuaweicloud.com'

  Scenario: 获取华为接口调用的必填参数token
    Given path 'v3/auth/tokens'
    * def params = read("classpath:utils/ocr/getToken_huawei.json")
    * print "入参值", params
    * request params
    When method post
    Then status 201
    * def huaweiToken = responseHeaders["X-Subject-Token"][0]
    * print "获取华为API的token：", huaweiToken