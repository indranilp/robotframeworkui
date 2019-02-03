*** Settings ***
Resource  ../Resources/Variables.robot


*** Keywords ***
#for creating key words
log my message
    log to console  hello world
    log to console  welcome

initialize application
    log my message
    open browser  ${url}  chrome

argument passing example
    [Arguments]  ${parameter}
    log to console  ${parameter}
