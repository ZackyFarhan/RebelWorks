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
    Login_Demo
    Sorting
    Remove_From_Cart
    Add_To_Cart
    Your_Information
    Close

*** Keywords ***
Launch_Browser
    Open Browser                     ${URL}         ${BROWSER}
    Maximize Browser Window
    
Login_Demo
    Wait Until Element Is Visible    ${USERNAME} 
    Input Text                       ${USERNAME}       ${INPUTUSERNAME} 
    Input Text                       ${PASSWORD}       ${INPUTPASSWORD} 
    Click Element                    ${LOGIN}
    Wait Until Element Is Visible    ${SORTING}

Sorting
    Wait Until Element Is Visible    ${SORTING}
    Click Element                    ${SORTING}
    Select From List By Index        ${SORTING}   1
    Sleep                            1
    Wait Until Element Is Visible    ${SORTING}
    Click Element                    ${SORTING}
    Select From List By Index        ${SORTING}   2
    Sleep                            1
    Wait Until Element Is Visible    ${SORTING}
    Click Element                    ${SORTING}
    Select From List By Index        ${SORTING}   3
    Sleep                            1
    Wait Until Element Is Visible    ${SORTING}
    Click Element                    ${SORTING}
    Select From List By Index        ${SORTING}   0
    Sleep                            1
 
Remove_From_Cart
    Click Element                    ${ADD}
    Sleep                            1
    Click Element                    ${REMOVE}
    Sleep                            1

 Add_To_Cart
    Click Element                    ${ADD}
    Click Element                    ${CART}
    Wait Until Element Is Visible    ${CHECKOUT}
    Sleep                            1
    Click Element                    ${CHECKOUT}

Your_Information
    Wait Until Element Is Visible    ${FIRSTNAME}
    Input Text                       ${FIRSTNAME}       Zacky
    Input Text                       ${LASTNAME}        Farhan
    Input Text                       ${POSTCALCODE}     12312
    Sleep                            1
    Click Element                    ${CONTINUE}
    Wait Until Element Is Visible    ${FINISH}
    Sleep                            1
    Click Element                    ${FINISH}

Close
    Sleep                            3
    Close Browser