Feature: karate.env - gets the value (read-only) of the environment property 'karate.env'
  Background:
     #

  Scenario: 获取环境变量属性karate.env的值
    * print "karate.env的值：", karate.env