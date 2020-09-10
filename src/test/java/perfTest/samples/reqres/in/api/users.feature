Feature: Demo test
  - https://reqres.in/

  Background: 
    * url reqresURL
  
  @Demo
  Scenario: Sample Api to be tested
    Given path '/users'
    * param page = 2
    When method get
    Then status 200
    * match $.page == '#present'