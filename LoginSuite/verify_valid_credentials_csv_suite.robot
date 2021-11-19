*** Settings ***
Documentation    This file handles test related to valid credential 
...    and story with OR-101

Resource    ../Resource/Base/CommonFunctionality.resource
Test Setup     Launch Browser
Test Teardown     End Browser

Test Template     Verify Valid Credential Template 

Library    DataDriver    file=../testdata/OrangeHrmData.xlsx    sheet_name=VerifyValidCredential    

*** Test Cases ***
Verify Valid Credential Test_${testcaseid}

*** Keywords ***
Verify Valid Credential Template  
    [Arguments]    ${username}    ${password}    ${expectedvalue} 
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    MainPage Should Contain    ${expectedvalue} 
    


