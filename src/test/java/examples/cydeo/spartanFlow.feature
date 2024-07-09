# POST a new spartan, verify that it exists, then delete the spartan from API
  Feature: Test spartan life cycle flow
    Background:
      * def spartanUrl = "http://3.84.109.78:8000"
    @smoke
    Scenario: POST a new spartan
      * def SpartanGen = Java.type("examples.utils.SpartanGenerator")
      * def newSpartan = SpartanGen.createSpartan()
      * print newSpartan
      Given url spartanUrl
      And path "api/spartans"
      And header Accept = "application/json"
      And header Content-Type = "application/json"
      And request newSpartan
      And method POST
      # below is verification
      Then status 201
      And response.success == "A Spartan is Born!"
      And response.data.name == newSpartan.name
      And def idToDelete = response.data.id
      * print idToDelete
      #below is a new request in same scenario
      Given url spartanUrl
      And path "api/spartans"
      And path idToDelete
      When method get
      And status 200
      Then response.name == newSpartan.name
      # below is a new request to Delete the spartan
      Given url spartanUrl
      And path "api/spartans"
      And path idToDelete
      When method delete
      Then status 204
      # check error statement
      Given url spartanUrl
      And path "api/spartans"
      And path idToDelete
      When method get
      Then status 404
      And response.error == "Not Found"


      #HW: you can check HR API (ORDS), try to run similar scenarios like in regular class