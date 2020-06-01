# Ohjeita työllisyysgurun käyttöönottoon kunnassa

Ajamalla R-koodin saat kuntasi käyttöön Tilastokeskuksen, THL:n Sotkanetin ja Kelaston uusimmista tiedoista koostetun työllisyysraportin html-muodossa. Voit lisäksi liittää raporttiin Kelastosta TMT-kuntaosuudet tiedoston. Työllisyysraportti on luotu ja kirjoitettu Hämeenlinnan työllisyysyksikön tarpeisiin. Lisäksi mukana on Hämeenlinnan seudun työllisyysohjelman tilastoraporttipohja (Ketterimmät.Rmd).

[![N|Solid](https://github.com/Kuntaliitto/Tyollisyys_hml/blob/master/layout1.png?raw=true)](https://github.com/Kuntaliitto/Tyollisyys_hml/blob/master/layout1.png?raw=true)

[![N|Solid](https://github.com/Kuntaliitto/Tyollisyys_hml/blob/master/layout2.png?raw=true)](https://github.com/Kuntaliitto/Tyollisyys_hml/blob/master/layout2.png?raw=true)

Tietovaraston osoite Kuntaliiton Githubissa:
https://github.com/Kuntaliitto/Tyollisyys_hml

Lisätietoja koodista ja raportista: ismo.hannula@hameenlinna.fi

Työllisyysgurun koodit vaativat seuraavat asennukset tietokoneelle ja R-kielen yleistuntemuksen:

Avoimen RStudio-version asennus tietokoneelle (tarvitaan RMD-tiedostoihin)
https://rstudio.com/products/rstudio/ 

Asenna vielä Rtools R-kielen lisäpakettien hallintaan
https://cran.r-project.org/bin/windows/Rtools/ 

Varmista, että seuraavat kirjastot ovat asennettuna R-kieleesi:

  - data.table
  - DT
  - flexdashboard
  - ggplot2
  - plotly
  - plyr
  - pxweb
  - rAmCharts
  - rCharts
  - RColorBrewer
  - reshape
  - rmarkdown
  - stringr
  - sotkanet

Tee seuraava kansiorakenne tietokoneellesi ja lataa (hae) Githubista työllisyysgurun koodi koneellesi osoitteesta https://github.com/Kuntaliitto/Tyollisyys_hml 

Kansiorakenne koneellasi määrittelemässäsi hakemistossa

|-- Tyollisyys

     |-- Ketterimmät.Rmd (Github-tiedosto)
     
     |-- README.md (Github-tiedosto)
     
     |-- Työllisyysdata.R (Github-tiedosto)
     
     |-- Työllisyysguru.Rmd (Github-tiedosto)
     
     |-- Työllisyysraporttien päivitys.R (Github-tiedosto)
     
|-- Raportit

|-- Data

     |-- rajapinta
     
     


Muokkaa Työllisyysdata.R tiedostoon oman kuntasi kuntakoodi (Tilastokeskuksen mukaan). Esimerkissä Hämeenlinnan kuntakoodi on KU109. Määritele lisäksi seutukuntasi tarkisteltavat kunnat mukaan (esimerkissä 'KU082','KU109','KU165' tarkoittavat Hattulaa, Hämeenlinnaa ja Janakalaa) tai vastaavasti maakunta. Lisäksi määritellään seutukunnan Tilastokeskuskoodi SK051 koodi on Hämeenlinnan seutukunta.

Ajamalla R-kielessä tiedoston Työllisyysraporttien päivitys.R käynnistyy Työllisyysguru.Rmd ja Ketterimmät.Rmd tiedostot, jotka muodostavat ja tallentavat raportit kansioon Raportit.



Lisenssi
----
[BSD 3-Clause New license 2020][lisenssi] Ismo Hannula - Hämeenlinna


   [lisenssi]: <https://opensource.org/licenses/BSD-3-Clause>

