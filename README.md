Tarvitaan apufunktio Set-Window.ps1 (https://gist.github.com/pyk/51951adbd359d008df01bba9fd7a5445#file-set-window-ps1)
Lataa se, ja laita samaan hakemistoon kuin potemkin.ps1

Tarkista skriptin asetukset, ts. ainakin $ffexe='C:\Program Files (x86)\Mozilla Firefox ESR\firefox.exe' pitää osoittaa koneella sijaitsevaan Firefoxiin.
Muuttujassa $urls on osoitteet, jotka avataan omiin ikkunoihinsa.

Käynnistä powershell, älä käytä admin-tilaa.

Todennäköisesti powershell-skriptien ajaminen ei ole oletusarvoisesti sallittua, tarkista:
Get-ExecutionPolicy -Scope CurrentUser

Jos se on restricted, niin sitten tee näin:

Set-ExecutionPolicy -Scope CurrentUser

kirjoita Unrestricted ja paina enter

Itse skripti ajetaan näin:
.\potemkin.ps1

Toistaiseksi skripti ei osaa syytää ikkunoita useammalle näytölle, mutta tämä voi toki olla mahdollista toteuttaa.
