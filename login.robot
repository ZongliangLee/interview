*** Settings ***
Library  Selenium2Library
Variables  web_elements.py

Suite Setup  Create Random Account
Test Setup  Initiate
Test Teardown  Close Browser

*** Test Cases ***
Registering new customer
    [tags]  register  test
    Go To Register Page
    Register A New Account  ${test_email}  ${test_password}
    
Login With Username And Password
    [tags]  login  test
    Go To Login Page
    Login  ${test_email}  ${test_password}
    
Search
    [tags]  search  test
    Go To Login Page
    Login  ${test_email}  ${test_password}
    Go To  ${url}
    Go To Search Vacation Page
    Travel Search  ${destination}  ${airport}  ${departure_date}  ${return_date}
    ${result_number}=  Get Element Count  ${search_item_element}
    Run Keyword If  ${result_number} < ${1}  Fail  No result for searching ${destination} ${airport} ${departure_date} ${return_date}
    
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

Go To Search Vacation Page
    Click Element  ${search_vacation_icon}
    Wait Until Element Is Visible  ${destination_text_field}

Travel Search 
    [Arguments]  ${dest}  ${airport}  ${departure_date}  ${return_date}
    Click And Input  ${destination_text_field}  ${dest}
    Click And Input  ${airport_text_field}  ${airport}
    Click Element  ${duration_droplist}
    Click Element  ${duration_option_2}
    Click Element  ${passenger_droplist}
    Click Element  ${passenger_sumit}
    Click Element  ${departure_date_text_field}
    Input Text  ${departure_date_text_input_field}  ${departure_date}
    Click Element  ${return_date_text_field}
    Input Text  ${return_date_text_input_field}  ${return_date}
    Click Element  ${sumit_vacation_button}

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

Click And Input
    [Arguments]  ${target}  ${input_text}
    Click Element  ${target}
    Input Text  ${target}  ${input_text}
    Sleep  1
    Press Key  ${target}  ${enter_ascii}
    
Wait And Click Xpath Element
    [Arguments]  ${element}
    Wait Until Element Is Visible  xpath=${element}
    Click Element  xpath=${element}