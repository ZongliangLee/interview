#test environment 
browser='Chrome'
register='web_register'
test_password='Test123'
url='https://www.check24.de/'

enter_ascii='\\13'
wait_for_popup='1s'

#User information
user_info_menu='//*[contains(text(), "Mein Konto")]'
register_page_link='//*[contains(text(), "Starten Sie hier")]'
login_page_link='//*[contains(text(), "Anmelden")]'

#login/register page object
username_xpath='//*[@id="email"]'
password_xpath='//*[@id="password"]'
password_confirm_xpath='//*[@id="passwordrepetition"]'
login_button='//button[@name="login"]'
register_button='//button[@name="register"]'
ads_pop_up_cancel_button='//*[@id="c24-dialog-points-modal"]/div/header/button'
welcome_phrase='Hallo'

#homepage object
search_textfield='//*[@id="c24-search-header"]'
search_vacation_icon='//*[@href="https://urlaub.check24.de/"]'


#vacation page
destination_text_field='//input[@name="destination"]'
airport_text_field='//input[@name="airport-element"]'
sumit_vacation_button='//button[@name="searchButton"]'

duration_droplist='//*[@class="c24-travel-duration-overlay c24-travel-js-open-duration-layer"]'
duration_option_2='//*[contains(text(), " exakte Reisedaten ")]'

passenger_droplist='//*[@id="c24-travel-traveller-roomcount-detail-btn"]'
passenger_option_2='//*[contains(text(), "2 Wochen")]'
passenger_sumit='//*[@id="c24-travel-js-get-traveller-btn"]'

departure_date_text_field='//*[@class="c24-travel-tablet-input-overlay c24-travel-filled"]'
departure_date_text_input_field='//*[@id="c24-travel-departure-date-element"]'

return_date_text_field='//*[@class="c24-travel-tablet-input-overlay c24-travel-empty"]'
return_date_text_input_field='//*[@id="c24-travel-return-date-element"]'

search_item_element='//*[@class="region js-region content-regionGroupId-71 "]'