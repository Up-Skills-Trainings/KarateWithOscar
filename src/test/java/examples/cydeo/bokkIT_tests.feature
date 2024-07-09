Feature: BookIT API functionality

  Background: Necessary variables for following tests
    * def baseUrl = 'https://api.qa3.bookit.cydeo.com'
    * def Auth = call read('classpath:examples/cydeo/bookITAuth.feature')
    * def accessToken = Auth.token
  Scenario: Get user info form API and verify
    Given url baseUrl
    And path 'api/users/me'
    And header Authorization = 'Bearer ',accessToken
    When method GET
    Then status 200
    And match response.firstName == 'Oscar'
  @wip
  Scenario: Get campus information and verify
    Given url baseUrl
    And path 'api/campuses'
    And header Authorization = 'Bearer ',accessToken
    When method GET
    Then status 200
    And match response[0].location == 'VA'
    And match response[0].clusters[0].rooms[2].id == 115
    And match response[0].clusters[0].rooms[2].name == '#string'