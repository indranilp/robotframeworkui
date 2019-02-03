*** Settings ***
# This is setting section
#import section libraries(keywords but written by user in python),resources(keywords,testdata)'''
#This section is also used for test set up and tear down'''
Documentation    Suite description
Library  Selenium2Library
Library  BuiltIn
Resource  ../Resources/Variables.robot
Resource   ../Resources/CommonKeywords.robot
Resource   ../Locators/LoginPageObjects.robot
Library    ../Library/MyLibrary.py
Test Setup  initialize application
Test Teardown  close browser

*** Test Cases ***
#for writing test cases
Test valid login
    [Documentation]  This test case will check
    ...              valid login
    [Tags]    Smoke
    ${return_val}=  sum_two_number  4  5
    input text  ${email_xpath}    ${username}
    input text  ${password_xpath}  ${password}
    click button  ${submit_button_xpath}
    #sleep  5s
    wait until element is visible  ${username_heading_xpath}
    select window  url=https://www.phptravels.net/account/
    argument passing example  hello


Test invalid login
    [Documentation]  This test case will check
    ...              invalid login
    [Tags]    Smoke
    input text  ${email_xpath}    ${username}
    input text  ${password_xpath}  xyz
    click button  ${submit_button_xpath}
    wait until element is visible  ${error_msg_xpath}
    element should contain   ${error_msg_xpath}  Invalid Email or Password
    argument passing example  bye

