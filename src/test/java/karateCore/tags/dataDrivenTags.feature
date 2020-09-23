Feature: tag examples


  Scenario Outline: examples partitioned by tag
    * def vals = karate.tagValues
    * print "vals: ", vals
    * match vals.region[0] == expected

    @region=US
    Examples:
      | expected |
      | US       |

    @region=GB
    Examples:
      | expected |
      | GB       |

  Scenario: 调用数据驱动用例中指定场景
    * call read("classpath:karateCore/tags/dataDrivenTags.feature@region=GB")
    * call read("classpath:karateCore/tags/dataDrivenTags.feature@region=US")