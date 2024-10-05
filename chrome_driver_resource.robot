*** Settings ***
Library    SeleniumLibrary
Library    WebDriverManager

*** Keywords ***
Create Chrome Driver
    [Documentation]    Initializes the Chrome WebDriver.
    Create Web Driver    Chrome

Accept Cookies
    [Arguments]    ${driver}
    Wait Until Element Is Visible    id=cc-cookie-accept
    Click Button    id=cc-cookie-accept
