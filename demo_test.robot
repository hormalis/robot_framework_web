*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    chrome_driver_resource.robot

*** Variables ***
${URL}                       https://www.dimehead.de/
${ORDER_NOW_XPATH}          xpath=//*[@id="content"]/div/div[1]/div/div/div/div/div/div/div/div/div/a  # Order Now button
${ADD_TO_CART_XPATH}        xpath=//*[@id="atomion-summary-wrapper"]/div[2]/form/button  # Add to Shopping Cart button
${VIEW_CART_XPATH}          xpath=//*[@id="primary"]/div[1]/div/a  # View Shopping Cart link
${ADD_XPATH}                xpath=//*[@id="page-11"]/div/div/div[4]/div/div/div[2]/table/tbody/tr/td[2]/div/div[3]/div/button[2]
${PAYPAL_CHECKOUT_XPATH}    xpath=//*[@id="buttons-container"]/div/div/div
//*[@id="page-11"]/div/div/div[4]/div/div/div[3]/div[3]/div[2]/a

*** Test Cases ***
Purchase Test
    ${driver} =    Create Chrome Driver
    Go To    ${URL}

    # Accept cookies
    Accept Cookies    ${driver}

    # Click the Order Now button
    Wait Until Element Is Visible    ${ORDER_NOW_XPATH}
    Click Element    ${ORDER_NOW_XPATH}

    # Click the Add to Shopping Cart button
    Wait Until Element Is Visible    ${ADD_TO_CART_XPATH}
    Click Element    ${ADD_TO_CART_XPATH}

    # Click the View Shopping Cart link
    Wait Until Element Is Visible    ${VIEW_CART_XPATH}
    Click Element    ${VIEW_CART_XPATH}

    # Click to add one more
    Wait Until Element Is Visible    ${ADD_XPATH}
    Click Element    ${ADD_XPATH}

    # Paypal check out
    Wait Until Element Is Visible    ${PAYPAL_CHECKOUT_XPATH}
    Click Element    ${PAYPAL_CHECKOUT_XPATH}
    # Optional pause for verification
    Sleep   10

    Close Browser