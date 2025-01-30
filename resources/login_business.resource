*** Settings ***
Library     Browser
Resource    login_functional.resource


*** Variables ***
${BASE_URL}     https://seleniumbase.io/realworld


*** Keywords ***
Loginseite Öffnen
    New Context     tracing=${OUTPUT_DIR}/loginseite.zip
    New Page    ${BASE_URL}

Signup-Seite Öffnen
    New Page    ${BASE_URL}${/}signup

Fehlermeldung Für Ungültigen Benutzer Verifizieren
    Fehlermeldung Verifizieren    Invalid Username!

Ungültigen Benutzer Einloggen
    Benutzer Anmelden    Markus    12345    123456

Login Daten Ermitteln
    Signup-Seite Öffnen
    ${username}    Username Auslesen
    ${passwort}    Passwort Auslesen
    ${totpcode}    MFA Code Auslesen
    ${login_daten}    Create Dictionary    username=${username}    passwort=${passwort}    totpcode=${totpcode}
    RETURN    ${login_daten}

Username Auslesen
    RETURN    demo_user

Passwort Auslesen
    RETURN    secret_pass

MFA Code Auslesen
    ${totpcode}    Get Text    id=totp
    RETURN    ${totpcode}
