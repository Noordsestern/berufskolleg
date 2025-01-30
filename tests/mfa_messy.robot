*** Settings ***
Library    Browser



*** Test Cases ***
Erfolgreichen Login Testen
    New Browser    headless=no
    New Page    https://seleniumbase.io/realworld/signup
    ${totpcode}    Get Text    id=totp

    New Page    https://seleniumbase.io/realworld
    Fill Text    id=username    demo_user
    Fill Text    id=password    secret_pass
    Fill Text    id=totpcode    ${totpcode}
    Click    id=log-in

    Get Title    ==    Welcome / Demo App
    Take Screenshot
