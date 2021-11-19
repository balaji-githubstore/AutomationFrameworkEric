*** Settings ***
Documentation    This file handles all the elements present in the 
...    login page. 

Resource    ../Base/CommonFunctionality.resource  

*** Variables ***
${USERNAME LOCATOR}    id=txtUsername
${PASSWORD LOCATOR}    id=txtPassword
${LOGIN LOCATOR}    id=btnLogin
${FORGOTPASSWORD LOCATOR}    partial link=Forgot
${ERROR LOCATOR}    id=spanMessage 

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    [Documentation]    Types the given text into the username text field.\n
    ...    Examples 
    ...    | Enter Username | Admin |   
    ...    | Enter Username | John | 
    Input Text    ${USERNAME LOCATOR}     ${username} 
    
Enter Password
    [Arguments]    ${password}  
    [Documentation]    Types the given text into the password text field.\n
    ...    Examples 
    ...    | Enter Password | Admin |   
    ...    | Enter Password | John | 
    Input Password    ${PASSWORD LOCATOR}    ${password}
    
Click Login
    [Documentation]    Click on login.\n
    ...    Examples 
    ...    | Click Login |
    Click Element    ${LOGIN LOCATOR}
    
Click Forgot Password
    [Documentation]    Click on Forgot your Password.\n
    ...    Examples 
    ...    | Click Forgot Password |
    Click Element    ${FORGOTPASSWORD LOCATOR}
    
Validate Login Error Message
    [Arguments]    ${expectederrormessage}
    [Documentation]    Validates the error message.\n
    ...    Examples 
    ...    | Validate Login Error Message | Invalid credentials |   
    ...    | Validate Login Error Message | Username cannot be empty |
    ...    | Validate Login Error Message | Password cannot be empty | 

    Element Text Should Be    ${ERROR LOCATOR}    ${expectederrormessage}  
    

