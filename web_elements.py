#test environment 
browser='Chrome'
register='arloqaregister'
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
search_item_element='//*[@class="product-tile-wrapper"]'