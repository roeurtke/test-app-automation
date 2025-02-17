*** Settings ***
Library    SeleniumLibrary
Library    RobotEyes
Resource    ../resources/login.resource

*** Variables ***
${images_dir}    ${expected_result_folder}/visual_images/compared

*** Test Cases ***
001 Scenario: Login "MSS Clinic Web Center" application without error
    [Tags]    001
    Given I connected to application with user: "socheatha" and password: "12345678"
    Then the home page of "MSS Clinic Web Center" will display
    Open Eyes    SeleniumLibrary
    Capture Full Screen    name=${browser}_home_page
    Compare Images
    Close All Browsers
