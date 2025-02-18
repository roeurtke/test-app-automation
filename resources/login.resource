*** Settings ***
Library    SeleniumLibrary
Library    BrowserProfile.py
Resource    global_variable.resource

*** Keywords ***
Open Firefox On ${page}
    [Documentation]    
    ...    Open page in Firefox browser
    ...    1 parameter:
    ...    ${page}: file name in the slug
    ${firefox_profile}=    Create Ff Profile    ${output}
    Open Browser    ${root_url}/${page}   ff    ff_profile_dir=${firefox_profile}

Open Chrom On ${page}
    [Documentation]    
    ...    Open page in chrome browser
    ...    1 parameter:
    ...    ${page}: file name in the slug
    ${chrome_options}=    create chrome options    output_path=${output}
    open browser  ${root_url}/${page}  chrome  options=${chrome_options}    remote_url=${remote_runner}

Open Browser On ${page}
    [Documentation]    
    ...    Open page in default browser (global_variable.resource)
    ...    1 parameter:
    ...    ${page}: file name and query string in the slug
    IF    '${browser}' == 'ff'
        Open Firefox On ${page}
    ELSE IF    '${browser}' == 'chrome'
        Open Chrom On ${page}
    ELSE
        open browser    ${root_url}/${page}    ${browser}    remote_url=${remote_runner}
    END

I connected to application with user: "${username}" and password: "${password}"
    [Documentation]    Loging application with user ${username}/${password}.
    Set Selenium Timeout    15s
    Open Browser On login?registration_code=00001
    Maximize Browser Window
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${username}
    Wait Until Element Is Visible    name=password
    Input Password    name=password    ${password}
    Click Button    xpath=//button[contains(.,'Login')]
    
the home page of "MSS Clinic Web Center" will display
    [Documentation]    Display the home of after login success.
    Wait Until Element Is Visible    id=navbarSupportedContent
    ${section}=    Create List    GENERAL INFORMATION    PARA CLINIC    CLINIC CHART    PATIENT LAST 6 MONTHS
    FOR    ${sections}    IN    @{section}
        Page Should Contain Element    //*[translate(text(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = "${sections}"]
    END

the error message: "${error}" is displayed under the "USERNAME" textbox
    [Documentation]    Verify error message of login with invalid username or password.
    Wait Until Element Is Visible    xpath=//span[@class='invalid-feedback']
    Page Should Contain    ${error}