Feature: Spartans API Functionality with Karate

  Background:
    Given def spartanUrl = 'http://3.84.109.78:8000'
    # def is used for creating variables, " or ' mark does not matter for Karate
@smoke
  Scenario: Get one spartan and verify 200 body headers
    Given url spartanUrl
    And path "api/spartans/108"
    And method get
    Then status 200
    And match response.name == "Glenna"

    Given def firstSpartan =
    """
    {
    "id": 108,
    "name": "Glenna",
    "gender": "Male",
    "phone": 1236547892
}
    """
    And match response == firstSpartan

    And def expectedSpartan = read("classpath:examples/testData/expectedSpartan.json")
    Then match response == expectedSpartan
@ignore
  Scenario:
    * url spartanUrl
    * path "api/spartans/search"
    * header Accept = "application/json"
    * param nameContains = "j"
    * param gender = "Female"
    * method get
    # verification
    * status 200
    * def secondSpartan =
  """
      {
            "id": 27,
            "name": "Jeanelle",
            "gender": "Female",
            "phone": 6662999903
        }
  """
    * match response.content[1] == secondSpartan
    * match each response.content[*].gender == 'Female'
    * match each response.content[*].phone == '#number'
    * match each response.content[*].id == '#notnull'
    * def sizeOfArray = response.content.length
    * match  sizeOfArray == 13

# Next week: Authorization, calling a feature file from another feature file, Calling a Java Class file in a feature, Data Driven testing