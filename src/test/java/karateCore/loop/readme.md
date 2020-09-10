## loop_params.json为数据库获取
例子中数据来源karate代码示例：
```shell script
* def code = "auto_illness"
* def sql = "select id from ai_illinfo where code = '"  + code +"'"
* def rows = db.readRows(sql)
``` 
### 调用feature文件时迭代执行用例
Tips: 如果入参文件为JSON数组时，数组中每一个元素会作为请求入参去执行一次测试用例，示例如下
```shell script
  * call read("classpath:APIs/ai/d/illname.feature@api") rows
```