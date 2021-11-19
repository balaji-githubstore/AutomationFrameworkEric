*** Settings ***
Documentation    This file handle all the menu 

Resource    ../Base/CommonFunctionality.resource

*** Variables ***

*** Keywords ***
MainPage Should Contain
    [Arguments]    ${expectedtext}
    Page Should Contain    ${expectedtext}    