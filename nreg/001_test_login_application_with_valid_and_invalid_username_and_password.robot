*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/login.resource

*** Test Cases ***

001 Scenario: Login "MSS Clinic Web Center" application without error
    [Tags]    001
    Given I connected to application with user: "socheatha" and password: "12345678"
    Then the home page of "MSS Clinic Web Center" will display
    Close All Browsers