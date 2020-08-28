function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  //默认环境配置
  var config = {
    env: env,
    vMockURL: 'http://172.16.0.115:9191'
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

  //设置请求超时时间
  karate.configure('connectTimeout', 10000);
  return config;
}