function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    //如果env未设置，默认使用localhost环境
    env = 'localhost';
  }

  //默认环境配置
  var config = {
    env: env,
    vMockURL: 'http://localhost:9191'
  }

  if(env == 'localhost')
  {
    config.vMockURL = 'http://localhost:9191'
    config.dbConfig = karate.read('classpath:DBConfig_test.json')
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.vMockURL = 'http://172.16.0.115:9191'
    config.dbConfig = karate.read('classpath:DBConfig_test.json')
  } else if (env == 'e2e') {
    // customize
    config.vMockURL = 'http://172.16.0.115:9191'
    config.dbConfig = karate.read('classpath:DBConfig_pre.json')
  }

  var loginSession = karate.callSingle("classpath:vmock/APIs/login.feature", config)
  config.JSESSIONID = loginSession.JSESSIONID
  config.rememberMe = loginSession.rememberMe

  //设置请求超时时间
  karate.configure('connectTimeout', 10000);
  return config;
}