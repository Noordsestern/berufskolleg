*** Settings ***
Resource            login_business.resource

Test Setup          New Browser    headless=${BROWSER_HEADLESS}
Test Teardown       Close Browser

Test Tags           login    webui    smoke


*** Variables ***
${BROWSER_HEADLESS}     ${True}


*** Test Cases ***
Login Mit Falschen Daten Soll Fehlschlagen
    [Tags]    negativ-test
    Loginseite ist geöffnet
    Ungültigen Benutzer Einloggen
    Fehlermeldung Für Ungültigen Benutzer Verifizieren

Erfolgreichen Login Testen
    ${login_daten}    Login Daten Ermitteln
    Loginseite Öffnen
    Benutzer Anmelden    ${login_daten}[username]    ${login_daten}[passwort]    totpcode=${login_daten}[totpcode]
    Take Screenshot

*** Keywords ***
Loginseite ist geöffnet
  Loginseite Öffnen