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
Projects Page Has Heading And Nav
    Get Title    ==    devtestportfolio – Projects
    Get Text    h1    ==    Projects
    Click    nav a[href="index.html"]
    Get Text    h1    ==    devtestportfolio