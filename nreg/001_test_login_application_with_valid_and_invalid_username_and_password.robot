*** Settings ***
Library    SeleniumLibrary
Library    RobotEyes
Resource    ../resources/login.resource

*** Variables ***
${images_dir}    ${expected_result_folder}/visual_images/compared

*** Test Cases ***
001 Login MSS Clinic Web Center application without error
    [Tags]    001
    Given I connected to application with user: "socheatha" and password: "12345678"
    Then the home page of "MSS Clinic Web Center" will display
    Open Eyes    SeleniumLibrary
    Capture Full Screen    name=${browser}_home_page    tolerance=0.01
    Compare Images
    Close All Browsers

002 Login MSS Clinic Web Center application with invalid user or password
    [Tags]    002
    [Documentation]    Verify the error when login with invalid user or password.
    ${values}=    Create Dictionary    test=12345678    socheatha=123456    test1=123456
    FOR    ${key}    IN    @{values}
        Given I connected to application with user: "${key}" and password: "${values}[${key}]"
        Then the error message: "These credentials do not match our records." is displayed under the "USERNAME" textbox
        Open Eyes    SeleniumLibrary
        Capture Full Screen    name=${browser}_error_invalid_username_${key}_password_${values}[${key}]
        Compare Images
        Close All Browsers
    END