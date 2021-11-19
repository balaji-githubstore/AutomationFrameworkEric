*** Settings ***
Documentation    This resource file take care of browser configuration and 
...    inital setup, resuable keywords.

Library    OperatingSystem    
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser
    Append To Environment Variable    Path    ${EXECDIR}${/}driver
    Open Browser   browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Screenshot Directory    ${EXECDIR}${/}Screenshot
    Go To    url=${URL}
    
End Browser With Screenshot
    Capture Page Screenshot    
    Close Browser

End Browser
    Close Browser
    


