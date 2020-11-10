#---------------------------------Libraries-----------------------------------#
from selenium import webdriver
from time import sleep
from selenium.webdriver.common.keys import Keys

#---------------------Using Chrome driver to open facebook--------------------#
browser = webdriver.Chrome(executable_path="chromedriver.exe")

#---------------------- Open facebook in browser------------------------------#
browser.get("https://www.facebook.com/fmasjsu")

#-------------------------Global Variables------------------------------------#
global about_page
global events_page
upcoming_event = "No Event"
day ={}
month = {}
#-----------------------------------------------------------------------------#
#                       Set up value for avatar                               #
#-----------------------------------------------------------------------------#

avatar = browser.find_element_by_xpath("//img[@class='_6tb5 img']").get_attribute("src")
# print(avatar)
sleep(5)


#-----------------------------------------------------------------------------#
#               Set up value for about_page and events_pages                  #
#-----------------------------------------------------------------------------#
pages = browser.find_elements_by_xpath("//span[@class='_2yav']")
for i in pages:
    if(i.text.lower() == "about"):
        about_page = i
    elif(i.text.lower() == "events"):
        events_page = i
#--------------------------Go to About page-----------------------------------#

about_page.click()
sleep(5)
print(about_page.find_elements_by_xpath("//div[@class='text_exposed_root text_exposed']").text)

#--------------------------Go to Event page-----------------------------------#
# events_page.click()
# sleep(5)

#-----------------------------------------------------------------------------#
#                       Checking for upcoming events                          #
#-----------------------------------------------------------------------------#

# if("not" not in events_page.find_element_by_xpath("//div[@class='_2pi1 _52jv']").text):
#     upcoming_event = events_page.find_element_by_xpath("//div[@class='_2pi1 _52jv']").text

#-----------------------------------------------------------------------------#
#                                Past  events                                 #
#-----------------------------------------------------------------------------#

sleep(5)

browser.close()
