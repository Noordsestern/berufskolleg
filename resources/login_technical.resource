*** Settings ***
Library     Browser


*** Keywords ***
Fehlermeldung Verifizieren
    [Arguments]    ${expected_fehlermeldung}
    ${fehlermeldung}    Get Text    id=top_message
    Should Be Equal    ${fehlermeldung}    ${expected_fehlermeldung}

Benutzername Eingeben
    [Arguments]    ${username}
    Fill Text    id=username    ${username}

Passwort Eingeben
    [Arguments]    ${passwort}
    Fill Text    id=password    ${passwort}

MFA Code Eingeben
    [Arguments]    ${totpcode}
    Fill Text    id=totpcode    ${totpcode}

Login Button Klicken
    Click    id=log-in

Browser Schließen
    Close Browser
