Feature: Update pet information

  Background: Setup the base path
    Given url baseUrl

  Scenario: Update pet information
    When path 'pet'
    * def putPetRequest = read('classpath:payloads/request/putPetInformationRequest.json')
    And headers {Accept:'application/json'}
    And request putPetRequest
    And method PUT
    Then status 200
    Then match response == '#notnull'
    * def putPetRequest = read('classpath:payloads/response/putPetInformationResponse.json')

  Scenario: No payload
    When path 'pet'
    And headers {Accept:'application/json'}
    And method PUT
    Then status 415
