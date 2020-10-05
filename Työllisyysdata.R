

#Rajapinnoilta haetut datat viedään alikansioon ../Data/rajapinta
#Tietojen hakuun pxweb:n rajapinnalta
library(pxweb)
#Tietojen hakuun sotkanetistä
library(sotkanet)

#HUOM rajapintahakuja on rajoitettu monien muuttujien osalta, jotta hakujen koko pysyy pienenä
#Käytä alla olevaa interaktiivista hakua taulujen tutkimiseen ja omien rajausten tekemiseksi

#pxweb:n rajapinnalta voi tulostaa tarvittavat koodit muidenkin aineistojen hakuun interaktiivisella haulla
#d <- pxweb_interactive("pxnet2.stat.fi")
#R:n data.frame asettaa string-sarakkeiden tyypiksi factor, estetään tämä oletus
options(stringsAsFactors = FALSE)
#Määritellään stat.fi rajapintaa varten kunnan, maakunnan ja seutukunnan aluetunnuksia
#maakunnankunnat <- c('KU061','KU082','KU086','KU103','KU109','KU165','KU169','KU433','KU694','KU834','KU981')
seudunkunnat <- c('KU082','KU109','KU165')
omakunta <- "KU109"
seutukunta <- "SK051"
#Yhdessä haussa käytetään pelkkiä kuntanumeroita
seudunkunnat2 <- c('082','109','165')

#Haetaan dataa rajapinnalta
#Haut tuottavat useita varoituksia NA-arvoista, jos haussa on mukana alle 5:n soluja
#HUOM Tilastokeskuksen rajapinnoilla ja datoissa tehdään aina välillä muutoksia, jotka voivat rikkoa koodin
#Työpaikat
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/vrm/tyokay/statfin_tyokay_pxt_115h.px",
            query = list("Työpaikan alue"=seudunkunnat,
                         "Toimiala"=c("*"),
                         "Sukupuoli"=c("*"),
                         "Vuosi"=c("*"),
                         "Tiedot"=c("tyolliset3")))
data_työpaikat <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_työpaikat, "../Data/rajapinta/data_työpaikat.csv", sep=";", dec=",", row.names=FALSE)

#Väestö
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/vrm/vaerak/statfin_vaerak_pxt_11re.px",
            query = list("Alue"=seudunkunnat,
                         "Ikä"=c("*"),
                         "Sukupuoli"=c("SSS","1","2"),
                         "Vuosi"=c("*"),
                         "Tiedot"=c("vaesto")))
data_väestö <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_väestö, "../Data/rajapinta/data_väestö.csv", sep=";", dec=",", row.names=FALSE)

#Perustiedot
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1001.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("*")))
data_perustiedot <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_perustiedot, "../Data/rajapinta/data_perustiedot.csv", sep=";", dec=",", row.names=FALSE)

#Työttömyyden kesto ka
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1207.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Sukupuoli"=c("*"),
                         "Ikäryhmitys"=c("SSS","15-24","25-49","50-"),
                         "Työllisyyskoodin kesto"=c("SSS"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("*")))
data_kesto <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_kesto, "../Data/rajapinta/data_kesto.csv", sep=";", dec=",", row.names=FALSE)

#Työttömyyden kesto ikäryhmittäin Hämeenlinnassa
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1207.px",
            query = list("Alue"=c(omakunta),
                         "Sukupuoli"=c("*"),
                         "Ikäryhmitys"=c("SSS","15-24","25-49","50-"),
                         "Työllisyyskoodin kesto"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("*")))
data_kesto2 <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_kesto2, "../Data/rajapinta/data_kesto2.csv", sep=";", dec=",", row.names=FALSE)

#Palveluissa palveluittain ja ikäluokittain
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_4250.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Sukupuoli"=c("*"),
                         "Ikäryhmät"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("*")))
data_palveluissa <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_palveluissa, "../Data/rajapinta/data_palveluissa.csv", sep=";", dec=",", row.names=FALSE)

#Aktivointiaste


#Työnhakijat ja avoimet työpaikat ammateittain
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1270.px",
            query = list("Alue"=c(omakunta),
                         "Ammattiryhmä"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA","AVPAIKATLOPUSSA")))
data_ammattialat <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_ammattialat, "../Data/rajapinta/data_ammattialat.csv", sep=";", dec=",", row.names=FALSE)

#Työnhakijat ikäluokittain ja ryhmittäin Hämeenlinnassa
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1205.px",
            query = list("Alue"=c(omakunta),
                         "Sukupuoli"=c("*"),
                         "Ikäryhmät"=c("*"),
                         "Työllisyyskoodi"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA")))
data_työnhakijat <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_työnhakijat, "../Data/rajapinta/data_työnhakijat.csv", sep=";", dec=",", row.names=FALSE)

#Työnhakijat työllisyyskoodeittain
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1205.px",
            query = list("Alue"=c(omakunta),
                         "Sukupuoli"=c("SSS"),
                         "Ikäryhmät"=c("SSS"),
                         "Työllisyyskoodi"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA")))
data_työnhakijat2 <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_työnhakijat2, "../Data/rajapinta/data_työnhakijat2.csv", sep=";", dec=",", row.names=FALSE)

#Työnhakijat koulutustason mukaan Hämeenlinnassa
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1221.px",
            query = list("Alue"=c(omakunta),
                         "Sukupuoli"=c("SSS"),
                         "Ikäryhmitys"=c("*"),
                         "Työmarkkina-asema"=c("2"),
                         "Koulutusaste"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA")))
data_koulutustaso <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_koulutustaso, "../Data/rajapinta/data_koulutustaso.csv", sep=";", dec=",", row.names=FALSE)

#Nuorisotyöttömät
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1263.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA","NUORET","TYOTOSUUS")))
data_nuoriso <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_nuoriso, "../Data/rajapinta/data_nuoriso.csv", sep=";", dec=",", row.names=FALSE)

#Työttömyyden virta
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1355.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Sukupuoli"=c("SSS"),
                         "Ikäryhmät"=c("SSS"),
                         "Valmistuminen"=c("SSS"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("1KKOSUUS","3KKOSUUS","6KKOSUUS","12KKOSUUS")))
data_virta <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_virta, "../Data/rajapinta/data_virta.csv", sep=";", dec=",", row.names=FALSE)

#Ulkomaalaiset
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1261.px",
            query = list("Alue"=c(seutukunta,seudunkunnat,"SSS"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA","ULKOMAALAINEN","TYOTOSUUS")))
data_ulkomaalaiset <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_ulkomaalaiset, "../Data/rajapinta/data_ulkomaalaiset.csv", sep=";", dec=",", row.names=FALSE)

#Rakennetyöttömät ja pitkäaikaistyöttömät
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_6211.px",
            query = list("Alue"=c(seutukunta,seudunkunnat),
                         "Sukupuoli"=c("*"),
                         "Koulutusaste"=c("*"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("*")))
data_rakenne <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_rakenne, "../Data/rajapinta/data_rakenne.csv", sep=";", dec=",", row.names=FALSE)

#Työttömät ikäryhmittäin
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tym/tyonv/kk/statfin_tyonv_pxt_1205.px",
            query = list("Alue"=c(seutukunta,seudunkunnat),
                         "Sukupuoli"=c("*"),
                         "Ikäryhmät"=c("*"),
                         "Työllisyyskoodi"=c("02"),
                         "Kuukausi"=c("*"),
                         "Tiedot"=c("HAKIJALOPUSSA")))
data_ikäryhmät <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_ikäryhmät, "../Data/rajapinta/data_ikäryhmät.csv", sep=";", dec=",", row.names=FALSE)

#Verotulot
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/tul/tvt/statfin_tvt_pxt_11i8.px",
            query = list("Vuosi"=c("*"),
                         "Kunta"=seudunkunnat2,
                         "Tiedot"=c("Lkm_sum","lkuve_mean")))
data_verotulot <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_verotulot, "../Data/rajapinta/data_verotulot.csv", sep=";", dec=",", row.names=FALSE)

#Väestön koulutusrakenne
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/kou/vkour/statfin_vkour_pxt_12bs.px",
            query = list("Vuosi"=c("*"),
                         "Alue"=seudunkunnat,
                         "Ikä"=c("*"),
                         "Sukupuoli"=c("SSS"),
                         "Tiedot"=c("osuus15")))
data_koulutus <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_koulutus, "../Data/rajapinta/data_koulutus.csv", sep=";", dec=",", row.names=FALSE)

#Aloittaneet ja lopettaneet yritykset ja yrityskanta
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/yri/aly/statfin_aly_pxt_11yq.px",
            query = list("Vuosineljännes"=c("*"),
                         "Kunta"=seudunkunnat,
                         "Toimiala"=c("SSS"),
                         "Tiedot"=c("*")))
data_yritykset <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_yritykset, "../Data/rajapinta/data_yritykset.csv", sep=";", dec=",", row.names=FALSE)

#Yritysten toimipaikat, henkilöstö ja liikevaihto
px_data <- 
  pxweb_get(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/yri/alyr/statfin_alyr_pxt_11dc.px",
            query = list("Vuosi"=c("*"),
                         "Kunta"=seudunkunnat,
                         "Tiedot"=c("*")))
data_liikevaihto <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")
write.table(data_liikevaihto, "../Data/rajapinta/data_liikevaihto.csv", sep=";", dec=",", row.names=FALSE)

#d <- pxweb_interactive("pxnet2.stat.fi")