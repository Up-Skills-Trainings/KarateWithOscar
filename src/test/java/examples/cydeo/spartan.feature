Feature: Spartans API Functionality with Karate

  Background:
    Given def spartanUrl = 'http://3.84.34.15:8000/'
    # def is used for creating variables, " or ' mark does not matter for Karate

  Scenario: Get one spartan and verify 200 body headers
    Given url spartanUrl
    And path "api/spartans/1"
    And method get
    Then status 200
    And match response.name == "Meade"

    Given def firstSpartan =
    """
    {
    "id": 1,
    "name": "Meade",
    "gender": "Male",
    "phone": 3584128232
    }
    """
    And match response == firstSpartan

    And def expectedSpartan = read("classpath:examples/testData/expectedSpartan.json")
    Then match response == expectedSpartan
