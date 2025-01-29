#Config

#Selaimen polku
$ffexe='C:\Program Files (x86)\Mozilla Firefox ESR\firefox.exe'
#Avataan uusi ikkuna
$pars='-new-window'
#Lista osoitteista
$urls='https://rwc-finland.fmi.fi/','https://www.spaceweather.gov/communities/space-weather-enthusiasts-dashboard','https://www.ilmatieteenlaitos.fi/revontulet-ja-avaruussaa'

#listan pituus
$screens=$urls.length
$N=$screens

#Ladataan apufunktio
. .\Set-Window.ps1

#Selvitetään (ens) ruudun koko
$screen=(Get-WmiObject -Class Win32_VideoController).VideoModeDescription;

$x=$screen[1].split('x')[0]
$y=$screen[1].split('x')[1]
$screen_width=[int]$x
$screen_height=[int]$y

# Lasketaan lähin neliöjuuri ylöspäin listan pituudesta
$k = [math]::Ceiling([math]::Sqrt($N))

# Määritetään rivit ja sarakkeet
$rows = $k
$cols = [math]::Ceiling($N / $rows)

# Varmistetaan, että rivit ja sarakkeet riittävät
while ($rows * $cols -lt $N) {
    $rows++
    $cols = [math]::Ceiling($N / $rows)
}

#alaruudun koko
$width=$screen_width/$cols
$height=$screen_height/$rows


$count=0

#käydään aliruudut läpi
for($row=0;$row -lt $rows;$row++) {
for($col=0;$col -lt $cols;$col++) {

#ruudun sijainti
$xloc=$col*$width
$yloc=$row*$height

#jos url löytyy
if($count -lt $urls.length){

#käynnistetään firefox ja odotetaan 1s
Start-Process -FilePath $ffexe -ArgumentList $pars,$urls[$count]
Start-Sleep -Seconds 1

#asetetaan ikkunan koko ja sijainti
Set-Window -ProcessName firefox -X $xloc -Y $yloc -Width $width -Height $height -Passthru}
$count=$count+1
}}