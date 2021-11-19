*** Settings ***
Documentation    This suite file handles add emergency contact is functioning properly or not

Resource    ../Resource/Base/CommonFunctionality.resource
Resource    ../Resource/Pages/LoginPage.resource

Test Setup    Launch Browser
Test Teardown    End Browser

Test Template    Verify Add Emergency Contact Template

Library    DataDriver    file=../testdata/OrangeHrmData.xlsx    sheet_name=VerifyAddEmergencyContact 
Library     DatabaseLibrary   
 
*** Test Cases ***
Verify Add Emergency Contact ${contactname}

*** Keywords ***
Verify Add Emergency Contact Template
    [Arguments]    ${username}    ${password}    ${contactname}    ${relationship}    ${phone}    ${mobile}    ${worktelephone}    ${expectedvalue1}    ${expectedvalue2}    
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Click Element    id=menu_pim_viewMyDetails
    Click Element    link=Emergency Contacts    
    Click Element    id=btnAddContact    
    Input Text    id=emgcontacts_name    ${contactname}        
    Input Text    id=emgcontacts_relationship    ${relationship}
    Input Text    id=emgcontacts_homePhone    ${phone}
    Input Text    id=emgcontacts_mobilePhone    ${mobile}
    Input Text    id=emgcontacts_workPhone    ${worktelephone}
    Click Element    id=btnSaveEContact    
    Table Should Contain    id=emgcontact_list    ${expectedvalue1}   
    Table Should Contain    id=emgcontact_list    ${expectedvalue2} 
    # Check If Exists In Database    select * from tbl_emergency_contact where contact='${contactname}'    
    

