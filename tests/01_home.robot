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
    Get Title Should Be    devtestportfolio – Home
    Get Text    h1    ==    devtestportfolio
    Get Attribute    a[aria-current="page"]    aria-current    ==    page

Toggle Bio Expands And Collapses
    Click    #toggle-bio
    Get Attribute    #toggle-bio    aria-expanded    ==    true
    Get Property    document.querySelector('#bio').hidden    ==    False
    Click    #toggle-bio
    Get Attribute    #toggle-bio    aria-expanded    ==    false
    Get Property    document.querySelector('#bio').hidden    ==    True

Add Item To Quick List
    Fill Text    #item-input    Test item
    Click    #add-btn
    Get Text    #quick-list li >> nth=0    ==    Test item