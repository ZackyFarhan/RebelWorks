*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                 https://www.saucedemo.com/
${BROWSER}             chrome
${USERNAME}            //*[@id="user-name"]
${PASSWORD}            //*[@id="password"]
${INPUTUSERNAME}       standard_user
${INPUTPASSWORD}       secret_sauce
${LOGIN}               //*[@id="login-button"]
${SORTING}             //*[@id="header_container"]/div[2]/div[2]/span/select
${ADD}                 //*[@id="add-to-cart-sauce-labs-backpack"]
${REMOVE}              //*[@id="remove-sauce-labs-backpack"]
${CART}                //*[@id="shopping_cart_container"]/a
${CHECKOUT}            //*[@id="checkout"]
${FIRSTNAME}           //*[@id="first-name"]
${LASTNAME}            //*[@id="last-name"]
${POSTCALCODE}         //*[@id="postal-code"]
${CONTINUE}            //*[@id="continue"]
${FINISH}              //*[@id="finish"]
${BACKHOME}            //*[@id="back-to-products"]
${BURGER}              //*[@id="react-burger-menu-btn"]

*** Test Cases ***
Rebel Works
    Launch_Browser
    Wrong_Username
    Wrong_Password
    Login_Demo
    Checkout_Without_Products
    Back_Home
    Checkout_Without_Information
    Your_Information_To_Cart
    Close

*** Keywords ***
Launch_Browser
    Open Browser                     ${URL}         ${BROWSER}
    Maximize Browser Window
    
Wrong_Username
    Wait Until Element Is Visible    ${USERNAME} 
    Input Text                       ${USERNAME}       Wrong Username 
    Input Text                       ${PASSWORD}       ${INPUTPASSWORD} 
    Click Element                    ${LOGIN}
    Sleep                            1

Wrong_Password
    Wait Until Element Is Visible    ${USERNAME} 
    Input Text                       ${USERNAME}       ${INPUTUSERNAME} 
    Input Text                       ${PASSWORD}       Wrong Password
    Click Element                    ${LOGIN}
    Sleep                            1

Login_Demo
    Wait Until Element Is Visible    ${USERNAME} 
    Input Text                       ${USERNAME}       ${INPUTUSERNAME} 
    Input Text                       ${PASSWORD}       ${INPUTPASSWORD} 
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${SORTING}

Checkout_Without_Products
    Click Element                    ${CART}
    Wait Until Element Is Visible    ${CHECKOUT}
    Sleep                            1
    Click Element                    ${CHECKOUT}
    Wait Until Element Is Visible    ${FIRSTNAME}
    Input Text                       ${FIRSTNAME}       Zacky
    Input Text                       ${LASTNAME}        Farhan
    Input Text                       ${POSTCALCODE}     12312
    Sleep                            1
    Click Element                    ${CONTINUE}
    Wait Until Element Is Visible    ${FINISH}
    Sleep                            1
    Click Element                    ${FINISH}

Back_Home
    Sleep                            1
    Wait Until Element Is Visible    ${BACKHOME}
    Click Element                    ${BACKHOME}
    Sleep                            1

Checkout_Without_Information
    Click Element                    ${ADD}
    Click Element                    ${CART}
    Wait Until Element Is Visible    ${CHECKOUT}
    Sleep                            1
    Click Element                    ${CHECKOUT}
    Wait Until Element Is Visible    ${FIRSTNAME}
    Sleep                            1
    Click Element                    ${CONTINUE}
    Sleep                            1

Your_Information_To_Cart
    Wait Until Element Is Visible    ${FIRSTNAME}
    Input Text                       ${FIRSTNAME}       Zacky
    Input Text                       ${LASTNAME}        Farhan
    Input Text                       ${POSTCALCODE}     12312
    Sleep                            1
    Click Element                    ${CONTINUE}
    Wait Until Element Is Visible    ${CART}
    Click Element                    ${CART}

Close
    Sleep                            3
    Close Browser