*** Settings ***
Documentation    This file handles test related to valid credential 
...    and story with OR-101

Resource    ../Resource/Base/CommonFunctionality.resource

Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/MainPage.resource

Test Setup     Launch Browser
Test Teardown     End Browser

Test Template     Verify Valid Credential Template 

Library    DataDriver    file=../testdata/Verify_Valid_Credentials_Template.csv

*** Test Cases ***
Verify Valid Credential Test_${testcaseid}

*** Keywords ***
Verify Valid Credential Template  
    [Arguments]    ${username}    ${password}    ${expectedvalue} 
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    MainPage Should Contain    ${expectedvalue}
    


