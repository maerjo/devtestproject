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
    Get Count    [role="banner"]    >    0
    Get Count    [role="navigation"][aria-label]    >    0
    Get Count    [role="main"]    >    0
    Get Count    [role="contentinfo"]    >    0

Interactive Controls Are Named
    # Button must have accessible name
    Get Attribute    #toggle-bio    aria-expanded    !=    ${EMPTY}
    Get Text    #toggle-bio    !=    ${EMPTY}