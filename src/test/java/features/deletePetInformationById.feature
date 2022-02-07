@parallel=false
Feature: Delete pet information by ID

  Background: Setup the base path
    Given url baseUrl

  Scenario: Add pet by ID
    When path 'pet'
    * def postPetRequest = read('classpath:payloads/request/postPetInformationRequest.json')
    And headers {Accept:'application/json'}
    And request postPetRequest
    And method POST
    Then status 200
    Then match response == '#notnull'

  Scenario: Verify delete http method for pet not found
    When path 'pet/5556'
    And headers {Accept:'application/json'}
    And method DELETE
    Then status 404

  Scenario: Delete pet by ID
    When path 'pet/3'
    And headers {Accept:'application/json'}
    And method DELETE
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(3000)
    Then status 200
    Then match response == '#notnull'
    * def putPetRequest = read('classpath:payloads/response/deletePetInformationResponse.json')
