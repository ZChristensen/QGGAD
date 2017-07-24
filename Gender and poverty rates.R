#Comparing P20 gender data to what is in http://sedlac.econo.unlp.edu.ar/eng/statistics-by-gender.php
#Gender test
bycountry_tabs <- read_csv("~/Poverty data/July 2017 P20 updates/bycountry_tabs_2013_2.csv")
bycountry_tabs$P20.female.share=(bycountry_tabs$p20.female/(bycountry_tabs$p20.female+bycountry_tabs$p20.male))
bycountry_tabs$p20.gender.ineq=bycountry_tabs$P20.female.share-0.5
bycountry_tabs$p20.female.hc=(bycountry_tabs$p20.female/(bycountry_tabs$p20.female+bycountry_tabs$p80.female))
bycountry_tabs$p20.male.hc=(bycountry_tabs$p20.male/(bycountry_tabs$p20.male+bycountry_tabs$p80.male))
bycountry_tabs$p20.gender.ineq.hc=bycountry_tabs$p20.female.hc-bycountry_tabs$p20.male.hc

bycountry_tabs$ext.female.share=(bycountry_tabs$ext.female/(bycountry_tabs$ext.female+bycountry_tabs$ext.male))
bycountry_tabs$ext.gender.ineq=bycountry_tabs$ext.female.share-0.5
bycountry_tabs$ext.female.hc=(bycountry_tabs$ext.female/(bycountry_tabs$ext.female+bycountry_tabs$p80.female))
bycountry_tabs$ext.male.hc=(bycountry_tabs$ext.male/(bycountry_tabs$ext.male+bycountry_tabs$p80.male))
bycountry_tabs$ext.gender.ineq.hc=bycountry_tabs$ext.female.hc-bycountry_tabs$ext.male.hc
SEDLAC=subset(bycountry_tabs,iso3 %in%
                c("URY","CRI","SLV","PER","PAN","HND","GTM","MEX","COL","CHE","ECU","BOL","DOM"))
keep = c("iso3", "p20.gender.ineq.hc", "p20.gender.ineq", "P20.female.share", "p20.female.hc", "p20.male.hc"
         , "ext.gender.ineq.hc", "ext.gender.ineq", "ext.female.share", "ext.female.hc", "ext.male.hc")
SEDLAC = data.frame(SEDLAC)[,keep]
bycountry_tabs_gender=data.frame(bycountry_tabs)[,keep]

data.table(subset(GDPgrowth,year>=2006))[,.(
  mean.10.year.gdpgrowth = mean(NY.GDP.MKTP.KD.ZG, na.rm=TRUE)/100
), by=.(iso3c) ]