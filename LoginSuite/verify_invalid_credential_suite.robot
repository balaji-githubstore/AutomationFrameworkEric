*** Settings ***
Documentation    This file handles test related to invalid credential 
...    and story with OR-101

Resource    ../Resource/Base/CommonFunctionality.resource
Resource    ../Resource/Pages/LoginPage.resource

Test Setup     Launch Browser
Test Teardown     End Browser

Test Template    Verify Invalid Credential Template

*** Test Cases ***
TC1    john    john123    Invalid credentials 
TC2    king    king123    Invalid credentials 
TC3    rock    rock123    Invalid credentials 
TC4    ${EMPTY}    check123    Username cannot be empty
# TC5    check123    ${EMPTY}    Password cannot be empty
    
*** Keywords ***
Verify Invalid Credential Template
    [Arguments]       ${username}    ${password}    ${expectedvalue}  
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Validate Login Error Message    ${expectedvalue} 
    
    


