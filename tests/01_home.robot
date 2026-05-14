*** Settings ***
Library    Browser
Suite Setup    Open Browser To Site
Suite Teardown    Close Browser

*** Variables ***
${BASE}    http://localhost:8000

*** Keywords ***
Open Browser To Site
    New Browser    headless=${TRUE}
    New Context    viewport={'width': 1280, 'height': 800}
    New Page    ${BASE}/index.html

*** Test Cases ***
Home Renders Title And Nav
    ${title}=    Get Title
    Should Be Equal    ${title}    devtestportfolio – Home
    Get Text    h1    ==    devtestportfolio
    Get Attribute    a[aria-current="page"]    aria-current    ==    page

Toggle Bio Expands Hidden Content
    ${expanded}=    Get Attribute    [id="toggle-bio"]    aria-expanded
    Should Be Equal    ${expanded}    false
    Click    [id="toggle-bio"]
    ${expanded}=    Get Attribute    [id="toggle-bio"]    aria-expanded
    Should Be Equal    ${expanded}    true
    Wait For Elements State    [id="bio"]    visible