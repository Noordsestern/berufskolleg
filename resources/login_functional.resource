*** Settings ***
Resource    login_technical.resource


*** Keywords ***
Benutzer Anmelden
    [Arguments]    ${username}    ${passwort}    ${totpcode}
    Benutzername Eingeben    ${username}
    Passwort Eingeben    ${passwort}
    MFA Code Eingeben    ${totpcode}
    Login Button Klicken
