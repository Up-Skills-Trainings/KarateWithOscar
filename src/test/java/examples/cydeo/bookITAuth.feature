Feature: Auth Functionality

Scenario: Get token for a user
  When url 'https://api.qa3.bookit.cydeo.com'
  And path 'sign'
  And param email = 'nsonger0@cmu.edu'
  And param password = 'nilsonger'
  When method GET
  Then status 200
  * def token = response.accessToken
  Then print token