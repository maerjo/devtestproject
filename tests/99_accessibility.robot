*** Settings ***
Library    Browser
Suite Setup    Open Browser To Site
Suite Teardown    Close Browser

*** Variables ***
${BASE}    http://localhost:8000

*** Keywords ***
Open Browser To Site
    New Browser    headless=${TRUE}
    New Context
    New Page    ${BASE}/index.html

*** Test Cases ***
Has Core Landmarks And Names
    # Banner, navigation with label, main, and contentinfo should exist
    Get Element Count    [role="banner"]    >    0
    Get Element Count    [role="navigation"][aria-label]    >    0
    Get Element Count    [role="main"]    >    0
    Get Element Count    [role="contentinfo"]    >    0

Interactive Controls Are Named
    # Button must have accessible name
    ${expanded}=    Get Attribute    [id="toggle-bio"]    aria-expanded
    Should Not Be Empty    ${expanded}
    Get Text    [id="toggle-bio"]    !=    ${EMPTY}