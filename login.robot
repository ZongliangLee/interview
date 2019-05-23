*** Settings ***
Library  Selenium2Library
Variables  web_elements.py

Suite Setup  Create Random Account
Test Setup  Initiate
Test Teardown  Close Browser

*** Variables ***
${search_target}  iphone
${negative_search_target}  wkqljdewiu

*** Test Cases ***
Registering new customer
    [tags]  test
    Go To Register Page
    Register A New Account  ${test_email}  ${test_password}
    
Login With Username And Password
    [tags]  test
    Go To Login Page
    Login  ${test_email}  ${test_password}
    
Search
    [tags]  test
    Go To Login Page
    Login  ${test_email}  ${test_password}
    Go To  ${url}
    Search  ${search_target}
    ${result_number}=  Get Element Count  ${search_item_element}
    Run Keyword If  ${result_number} < ${1}  Fail  No result for searching ${search_target}
    
Negative Search
    [tags]  test
    Go To Login Page
    Login  ${test_email}  ${test_password}
    Go To  ${url}
    Search  ${negative_search_target}
    ${result_number}=  Get Element Count  ${search_item_element}
    Run Keyword If  ${result_number} < ${1}  Fail  No result for searching ${negative_search_target}
    
*** Keywords ***
Initiate
    ${desired_capabilities}=  Create Dictionary  pageLoadingStrategy=eager
    Open Browser  ${url}  ${browser}  desired_capabilities=${desired_capabilities}
    Maximize Browser Window
    
Go To Login Page
    Wait And Click Xpath Element  ${user_info_menu}
    Wait And Click Xpath Element  ${login_page_link}
    Wait Until Element Is Visible  ${username_xpath}

Go To Register Page
    Wait And Click Xpath Element  ${user_info_menu}
    Wait And Click Xpath Element  ${register_page_link}
    Wait Until Element Is Visible  ${username_xpath}

Search
    [Arguments]  ${search_items}
    Click Element  ${search_textfield}
    Input Text  ${search_textfield}  ${search_items}
    Press Key  ${search_textfield}  ${enter_ascii}

Wait And Click Xpath Element
    [Arguments]  ${element}
    Wait Until Element Is Visible  xpath=${element}
    Click Element  xpath=${element}

Create Random Account
    ${uid} =	Evaluate	str(int(time.time() * 1000))	modules=time
    Set Suite Variable  ${test_email}  ${register}+${uid}@gmail.com
    Set Suite Variable  ${test_password}
    
Register A New Account
    [Arguments]  ${USER_NAME}  ${PASSWORD}
    Click Element  ${username_xpath}
    Input Text  ${username_xpath}  ${USER_NAME}
    Click Element  ${password_xpath}
    Input Text  ${password_xpath}  ${PASSWORD}
    Click Element  ${password_confirm_xpath}
    Input Text  ${password_confirm_xpath}  ${PASSWORD}
    Click Element  ${register_button}
    Run Keyword And Ignore Error  Wait And Click Xpath Element  ${ads_pop_up_cancel_button}
    Page Should Contain  ${welcome_phrase}
    Page Should Contain  Sie sind angemeldet als
    Page Should Contain  ${test_email}
    
Login
    [Arguments]  ${USER_NAME}  ${PASSWORD}
    Click Element  ${username_xpath}
    Input Text  ${username_xpath}  ${USER_NAME}
    Click Element  ${password_xpath}
    Input Text  ${password_xpath}  ${PASSWORD}
    Click Element  ${login_button}
    Run Keyword And Ignore Error  Wait And Click Xpath Element  ${ads_pop_up_cancel_button}
    Page Should Contain  ${welcome_phrase}
    Page Should Contain  Sie sind angemeldet als
    Page Should Contain  ${test_email}