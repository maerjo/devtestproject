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
    New Page    ${BASE}/projects.html

*** Test Cases ***
Projects Page Has Correct Title And Nav
    Get Title    ==    devtestportfolio – Projects
    Get Text    h1    ==    devtestportfolio
    Get Attribute    a[aria-current="page"]    aria-current    ==    page

Projects Page Shows Partikompass Card
    Get Element Count    .project-card    >    0
    Get Text    a.project-card .project-title    ==    Partikompass 2026
    ${href}=    Get Attribute    a.project-card    href
    Should Contain    ${href}    partikompassen.html

Projects Page Nav Navigates Home
    Click    nav a[href="index.html"]
    Get Text    h1    ==    devtestportfolio