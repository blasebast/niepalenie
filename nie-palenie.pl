#!/usr/bin/perl
use POSIX;
$cena = 11.9;
$cena = sprintf("%.2f",$cena);
$ilosc = 20;
$dziennie = 19;
$paczka = 20;

$koszt_d = ($dziennie/$paczka)*$cena;
$dopiwa = 14;
$piw = 3;
$cena_grosze = $cena * 100;
$doba =24;
$godzina = 60;
$minuta = 60;
$poczatek_palenia = 879897600;
$rzucone = 1314061260;
$dlugosc_palenia = $rzucone - $poczatek_palenia;
$dlugosc_palenia = ((($dlugosc_palenia/60)/60)/24);
$dni_palenia = $dlugosc_palenia;
$ilosc_wypalonych = $dni_palenia * 15;
$wzy = int($ilosc_wypalonych);
$sekund_doba = $doba * $godzina * $minuta;
$file = "c:/www/nie-palenie.htm";

$na_godzine= (($cena*($dziennie/$paczka))/$sekund_doba)*3600;
$tygodniowo = sprintf("%.2f",($cena*($dziennie/$paczka))*7);
$iter_count = 0;
while ( true )
{
$iter_count++;

open (OUT, ">$file");

$linia1 = '<BODY BGCOLOR="black"><FONT COLOR=#BABBBB><font size="2"><TITLE>nie-palenie</title>';

$image_transparency = "<style>img {opacity: 0.19;filter: alpha(opacity=30);}img:hover {opacity: 1.0;filter: alpha(opacity=100);</style>";
print OUT $image_transparency;
print OUT $linia1;
print OUT '<img src="endomondo.png" alt="endo" style="float:right;margin:0 150px 0 0;" />';
print OUT '<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">';
print OUT '<link rel="shortcut icon" href="http://seba-pc/favicon.ico">';
print OUT '<link rel="shortcut icon" href="favicon.ico"/>';
print OUT '<div id="background">';
print OUT '<body background="background.jpg">';
print OUT '</div>';
print OUT '<div style="background-image:url("c:/www/background.jpg")>';
print "$iter_count\n";

$time = time();
$counter = $time - $rzucone;
$oszczednosc = $counter * ($koszt_d/$sekund_doba);
$oszczednosc = $oszczednosc +  $koszt_d/$sekund_doba; 

$value = sprintf ("%.2f", $oszczednosc);
$wypalilbys = int($dziennie * (($counter/3600)/24));
$na_godzine = sprintf("%.2f", $na_godzine);
$kasa = "<b><u>Zaoszczędziłeś:</u></b><br>
- <b>$value </b>zł przy cenie $cena zł za paczkę,<br>
- do teraz wypaliłbyś: <b>$wypalilbys</b> papierosy(ow),<br>
- na godzine oszczędzasz <b>$na_godzine</b>zł,<br>
- tygodniowo oszczędzasz <b>$tygodniowo</b>zł.";

$counter++; 
$godzin = int($counter/3600); $dni = sprintf("%.2f", ($godzin/24)); $tygodni = int($dni/7);
$d = $dni; $t = $tygodni; $g = $godzin; $lat = floor($dni/365.5);

$stat =  "<b><u>Nie palisz:</u></b><br>
- <b>$counter</b> sekund,<br>
- <b>$g </b> godzin(y),<br>
- <b> $d </b> dni,<br>
- <b>$t</b> tygodni(e)<br>
- nie palisz od <b><font color=red>$lat lat!</font></b><br>
- łącznie wypaliłeś: ~<b>$wzy</b><br><br>";
print OUT '<font face="consolas">';
print OUT $stat;
print OUT $kasa;
print OUT '<br><br><b>Rzuciłeś Tue, 23 Aug 2011 01:01:00 GMT (1314061260)</b>';
print OUT '</font>';

$linia2 = '</FONT></BODY>';
print OUT $linia2;

close(OUT);
sleep 1;
}


