Feature: Get pet information by ID

  Background: Setup the base path
    Given url baseUrl

  Scenario: Get pet by valid ID
    When path 'pet/1'
    And headers {Accept:'application/json'}
    And method GET
    Then status 200
    Then match response == '#notnull'
    * def getPetById = read('classpath:payloads/response/getPetInformationResponse.json')
    Then match response == getPetById['success']

  Scenario: Verify get http method for pet not found
    When path 'pet/9999'
    And headers {Accept:'application/json'}
    And method GET
    Then status 404
    Then match response == '#notnull'
    * def petNotFound = read('classpath:payloads/response/getPetInformationResponse.json')
    Then match response == petNotFound['error_petNotFound']
