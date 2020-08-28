Feature: 华为OCR通用文字识别解决方案

  Background:
    * url 'https://ocr.cn-north-4.myhuaweicloud.com'
    # 获取huaweiToken
    * callonce read('classpath:utils/ocr/getToken_huawei.feature')

  @API
  @ignore
  Scenario: ORC通用文字识别接口调用, 进行图片文字识别
    Given path 'v1.0/ocr/general-text'
    * configure headers = {X-Auth-Token: "#(huaweiToken)"}
#      * def base64ImageStr = '/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAWADwDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDrPEnjKXRb/TtPs7aK6utSuXtUMspRbeQFAu4BckHeG+h4JBBp/ijxAmga9pFvHYLNPrUqWjzNIQERXAHy9/8AXP3HvmuZ8Q2H/CSfGe0s7W7urf7Fp/8ApU9pJ5UsP3yNrH18yMHGeGPvinY6JLD8YbGyTUbrVXsrJmvpb6QyFAysCo3Y+UiROBuwXPXBrJydnY1UE48r7amt468WPp+r6HZ2HiGKwt543uJboWouQsRUCNhkNuyRIMqe/PHNdH4NjuBpokbxHBrFpJFGbUQ2cduIUG4Y2r64xggY2EetVvEvia5tYtR04eGNUvvNgZbeWC38+3mDJgb9pBUbsgr1wAe9R/Dzw3qHhfQ0srz/AFsshuZQu0ohZQuzOcll2Ak4C/MQM4zQnrdEuyp/13LniDxRbaBLb2DwXN3ezOBb2ll++meEAFnZSOOjjuTjgj5itvQfEdv4h0F9XszuiJfbCV/eRlRyrhS3JIyMDOGXj18w1OK/8R+LNYutCkTSpfDlpJaozyH94A8is3mEBYyVZ+WOcjOerL23wumtpPAlobTTpbXa5SUsB+/fjdKG43Dt7bSvO0U1NuWpUoJRuiGfxX4g1bxNe6T4VtbCaKwk8u7ur4Mqxvg/KAG3H5kcbgO44AG5ujsrC4vbOOfV45be/OVmS1vpRESpKhlAYYDABgMZGcHnNeGW1rY2Ggaj4f1mLUTrZuW+z2Ucj4jlCqI2VACjlyxBJP3F+Xkjd7n4Vg1W18MWEGtzebqKR4mYtuPU7QT3IXAJ5yQTk9SoS5nqU24awdvwLq6XYpqT6klpCl86eW9wqAO6/Lwx7/dXr0xxUVnDp02oXV9BZQpeBzBLceUokfAHBYckcL19B6UUVqjLo2Xgp4+duCT259v8+lRLaxBVHlxApK0qFYwNrEnJHXkhiCe+T60UUE9bnP3/AMPPCmpX015daQjTzNudklkjBPrhWAye/HJ5rejsbeCPZaoLYBNi+SAoXgAHb90kBVAyDgDHSiikklsVzS7jriJpbZl2RSuDvRX4Usp3Lk4OOQOcHHUU+FZApaVvnbBKAgqhwAQpwCRkE5PPP4Aoo62Jtsf/2bVwij//2b+1FFZ4mThT5o7mtCEZSSZ//9k='
    * request { "image":"#(base64ImageStr)", "detect_direction":false }
    When method post
    Then status 200
    * def authcode = $.result.words_block_list[0].words
    * print "华为API识别验证码图片文字为", authcode

      # 如果存在非连续空格则移除空格
    * def trimBlank = function(authcode) {return authcode.replaceAll(" ","")}
    * def authcode = call trimBlank authcode
    * def trimDot = function(authcode) {return authcode.replaceAll(".","")}
    * def verifyCode = trimBlank(authcode)
    * print "降噪处理后authcode的值:",verifyCode