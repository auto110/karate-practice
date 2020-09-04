Feature: karate.exec(command)
  - convenient way to execute an OS specific command and return the console output e.g. karate.exec('some.exe -h') (or karate.exec(['some.exe', '-h'])) useful for calling non-Java code (that can even return data) or for starting user-interfaces to be automated

  Background:
     #

  Scenario: 执行操作系统命令