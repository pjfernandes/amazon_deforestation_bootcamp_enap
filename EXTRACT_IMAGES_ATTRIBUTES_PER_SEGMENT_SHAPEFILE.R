####INÍCIO
library(raster)


setwd('C:/Users/aljof/Desktop/arquivos/puc/TCC/bd') #ESPECIFICAR DIRETÓRIO DE TRABALHO COM OS DADOS BAIXADOS DO GOOGLE DRIVE

segmentos<-shapefile('segmentacao_SNIC.shp')

####EXTRAINDO OS VALORES DA SÉRIE DE NDVI
serie_ndvi<-brick('serie_ndvi.tif')
valores_serie_ndvi<-extract(serie_ndvi,segmentos)
##MÉDIA
matriz_ndvi_media<-matrix(nrow=length(valores_serie_ndvi),ncol=nlayers(serie_ndvi))

for (i in 1:length(valores_serie_ndvi)) {
  poligono<-valores_serie_ndvi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    media<-mean(poligono[,col],na.rm=T)
    resultado<-c(resultado,media)
  }
  
  matriz_ndvi_media[i,]<-resultado   
}

df_ndvi_MEDIA<-as.data.frame(matriz_ndvi_media)
names(df_ndvi_MEDIA)<-c("MEDIA_NDVI_2015","MEDIA_NDVI_2016","MEDIA_NDVI_2017","MEDIA_NDVI_2018","MEDIA_NDVI_2019","MEDIA_NDVI_2020","MEDIA_NDVI_2021")

##MEDIANA
matriz_ndvi_mediana<-matrix(nrow=length(valores_serie_ndvi),ncol=nlayers(serie_ndvi))

for (i in 1:length(valores_serie_ndvi)) {
  poligono<-valores_serie_ndvi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    mediana<-median(poligono[,col],na.rm=T)
    resultado<-c(resultado,mediana)
  }
  
  matriz_ndvi_mediana[i,]<-resultado   
}

df_ndvi_MEDIANA<-as.data.frame(matriz_ndvi_mediana)
names(df_ndvi_MEDIANA)<-c("MEDIANA_NDVI_2015","MEDIANA_NDVI_2016","MEDIANA_NDVI_2017","MEDIANA_NDVI_2018","MEDIANA_NDVI_2019","MEDIANA_NDVI_2020","MEDIANA_NDVI_2021")

##DESVIO PADRÃO
matriz_ndvi_sd<-matrix(nrow=length(valores_serie_ndvi),ncol=nlayers(serie_ndvi))

for (i in 1:length(valores_serie_ndvi)) {
  poligono<-valores_serie_ndvi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    sd<-sd(poligono[,col],na.rm=T)
    resultado<-c(resultado,sd)
  }
  
  matriz_ndvi_sd[i,]<-resultado   
}

df_ndvi_SD<-as.data.frame(matriz_ndvi_sd)
names(df_ndvi_SD)<-c("SD_NDVI_2015","SD_NDVI_2016","SD_NDVI_2017","SD_NDVI_2018","SD_NDVI_2019","SD_NDVI_2020","SD_NDVI_2021")

df_ndvi<-cbind(df_ndvi_MEDIA,df_ndvi_MEDIANA,df_ndvi_SD)
names(df_ndvi)<-c("MEDIA_NDVI_2015","MEDIA_NDVI_2016","MEDIA_NDVI_2017","MEDIA_NDVI_2018","MEDIA_NDVI_2019","MEDIA_NDVI_2020","MEDIA_NDVI_2021",
                  "MEDIANA_NDVI_2015","MEDIANA_NDVI_2016","MEDIANA_NDVI_2017","MEDIANA_NDVI_2018","MEDIANA_NDVI_2019","MEDIANA_NDVI_2020","MEDIANA_NDVI_2021",
                  "SD_NDVI_2015","SD_NDVI_2016","SD_NDVI_2017","SD_NDVI_2018","SD_NDVI_2019","SD_NDVI_2020","SD_NDVI_2021")

write.csv(df_ndvi,'df_ndvi.csv',row.names = F)

####EXTRAINDO OS VALORES DA SÉRIE DE NDWI
serie_ndwi<-brick('serie_ndwi.tif')
valores_serie_ndwi<-extract(serie_ndwi,segmentos)
##MÉDIA
matriz_ndwi_media<-matrix(nrow=length(valores_serie_ndwi),ncol=nlayers(serie_ndwi))

for (i in 1:length(valores_serie_ndwi)) {
  poligono<-valores_serie_ndwi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    media<-mean(poligono[,col],na.rm=T)
    resultado<-c(resultado,media)
  }
  
  matriz_ndwi_media[i,]<-resultado   
}

df_ndwi_MEDIA<-as.data.frame(matriz_ndwi_media)
names(df_ndwi_MEDIA)<-c("MEDIA_ndwi_2015","MEDIA_ndwi_2016","MEDIA_ndwi_2017","MEDIA_ndwi_2018","MEDIA_ndwi_2019","MEDIA_ndwi_2020","MEDIA_ndwi_2021")

##MEDIANA
matriz_ndwi_mediana<-matrix(nrow=length(valores_serie_ndwi),ncol=nlayers(serie_ndwi))

for (i in 1:length(valores_serie_ndwi)) {
  poligono<-valores_serie_ndwi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    mediana<-median(poligono[,col],na.rm=T)
    resultado<-c(resultado,mediana)
  }
  
  matriz_ndwi_mediana[i,]<-resultado   
}

df_ndwi_MEDIANA<-as.data.frame(matriz_ndwi_mediana)
names(df_ndwi_MEDIANA)<-c("MEDIANA_ndwi_2015","MEDIANA_ndwi_2016","MEDIANA_ndwi_2017","MEDIANA_ndwi_2018","MEDIANA_ndwi_2019","MEDIANA_ndwi_2020","MEDIANA_ndwi_2021")

##DESVIO PADRÃO
matriz_ndwi_sd<-matrix(nrow=length(valores_serie_ndwi),ncol=nlayers(serie_ndwi))

for (i in 1:length(valores_serie_ndwi)) {
  poligono<-valores_serie_ndwi[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    sd<-sd(poligono[,col],na.rm=T)
    resultado<-c(resultado,sd)
  }
  
  matriz_ndwi_sd[i,]<-resultado   
}

df_ndwi_SD<-as.data.frame(matriz_ndwi_sd)
names(df_ndwi_SD)<-c("SD_ndwi_2015","SD_ndwi_2016","SD_ndwi_2017","SD_ndwi_2018","SD_ndwi_2019","SD_ndwi_2020","SD_ndwi_2021")

df_ndwi<-cbind(df_ndwi_MEDIA,df_ndwi_MEDIANA,df_ndwi_SD)
names(df_ndwi)<-c("MEDIA_ndwi_2015","MEDIA_ndwi_2016","MEDIA_ndwi_2017","MEDIA_ndwi_2018","MEDIA_ndwi_2019","MEDIA_ndwi_2020","MEDIA_ndwi_2021",
                  "MEDIANA_ndwi_2015","MEDIANA_ndwi_2016","MEDIANA_ndwi_2017","MEDIANA_ndwi_2018","MEDIANA_ndwi_2019","MEDIANA_ndwi_2020","MEDIANA_ndwi_2021",
                  "SD_ndwi_2015","SD_ndwi_2016","SD_ndwi_2017","SD_ndwi_2018","SD_ndwi_2019","SD_ndwi_2020","SD_ndwi_2021")

write.csv(df_ndwi,'df_ndwi.csv',row.names = F)

####EXTRAINDO OS VALORES DA SÉRIE DE SWIR
serie_swir<-brick('serie_swir.tif')
valores_serie_swir<-extract(serie_swir,segmentos)
##MÉDIA
matriz_swir_media<-matrix(nrow=length(valores_serie_swir),ncol=nlayers(serie_swir))

for (i in 1:length(valores_serie_swir)) {
  poligono<-valores_serie_swir[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    media<-mean(poligono[,col],na.rm=T)
    resultado<-c(resultado,media)
  }
  
  matriz_swir_media[i,]<-resultado   
}

df_swir_MEDIA<-as.data.frame(matriz_swir_media)
names(df_swir_MEDIA)<-c("MEDIA_swir_2015","MEDIA_swir_2016","MEDIA_swir_2017","MEDIA_swir_2018","MEDIA_swir_2019","MEDIA_swir_2020","MEDIA_swir_2021")

##MEDIANA
matriz_swir_mediana<-matrix(nrow=length(valores_serie_swir),ncol=nlayers(serie_swir))

for (i in 1:length(valores_serie_swir)) {
  poligono<-valores_serie_swir[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    mediana<-median(poligono[,col],na.rm=T)
    resultado<-c(resultado,mediana)
  }
  
  matriz_swir_mediana[i,]<-resultado   
}

df_swir_MEDIANA<-as.data.frame(matriz_swir_mediana)
names(df_swir_MEDIANA)<-c("MEDIANA_swir_2015","MEDIANA_swir_2016","MEDIANA_swir_2017","MEDIANA_swir_2018","MEDIANA_swir_2019","MEDIANA_swir_2020","MEDIANA_swir_2021")

##DESVIO PADRÃO
matriz_swir_sd<-matrix(nrow=length(valores_serie_swir),ncol=nlayers(serie_swir))

for (i in 1:length(valores_serie_swir)) {
  poligono<-valores_serie_swir[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    sd<-sd(poligono[,col],na.rm=T)
    resultado<-c(resultado,sd)
  }
  
  matriz_swir_sd[i,]<-resultado   
}

df_swir_SD<-as.data.frame(matriz_swir_sd)
names(df_swir_SD)<-c("SD_swir_2015","SD_swir_2016","SD_swir_2017","SD_swir_2018","SD_swir_2019","SD_swir_2020","SD_swir_2021")

df_swir<-cbind(df_swir_MEDIA,df_swir_MEDIANA,df_swir_SD)
names(df_swir)<-c("MEDIA_swir_2015","MEDIA_swir_2016","MEDIA_swir_2017","MEDIA_swir_2018","MEDIA_swir_2019","MEDIA_swir_2020","MEDIA_swir_2021",
                  "MEDIANA_swir_2015","MEDIANA_swir_2016","MEDIANA_swir_2017","MEDIANA_swir_2018","MEDIANA_swir_2019","MEDIANA_swir_2020","MEDIANA_swir_2021",
                  "SD_swir_2015","SD_swir_2016","SD_swir_2017","SD_swir_2018","SD_swir_2019","SD_swir_2020","SD_swir_2021")

write.csv(df_swir,'df_swir.csv',row.names = F)   

####EXTRAINDO OS VALORES DA SÉRIE SENTINEL
serie_sentinel<-brick('serie_sentinel.tif') 

valores_serie_sentinel<-extract(serie_sentinel,segmentos)
##MÉDIA
matriz_sentinel_media<-matrix(nrow=length(valores_serie_sentinel),ncol=nlayers(serie_sentinel))

for (i in 1:length(valores_serie_sentinel)) {
  poligono<-valores_serie_sentinel[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    media<-mean(poligono[,col],na.rm=T)
    resultado<-c(resultado,media)
  }
  
  matriz_sentinel_media[i,]<-resultado   
}

df_sentinel_MEDIA<-as.data.frame(matriz_sentinel_media)
names(df_sentinel_MEDIA)<-c("MEDIA_sentinel_2016","MEDIA_sentinel_2017","MEDIA_sentinel_2018","MEDIA_sentinel_2019","MEDIA_sentinel_2020","MEDIA_sentinel_2021")

##MEDIANA
matriz_sentinel_mediana<-matrix(nrow=length(valores_serie_sentinel),ncol=nlayers(serie_sentinel))

for (i in 1:length(valores_serie_sentinel)) {
  poligono<-valores_serie_sentinel[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    mediana<-median(poligono[,col],na.rm=T)
    resultado<-c(resultado,mediana)
  }
  
  matriz_sentinel_mediana[i,]<-resultado   
}

df_sentinel_MEDIANA<-as.data.frame(matriz_sentinel_mediana)
names(df_sentinel_MEDIANA)<-c("MEDIANA_sentinel_2016","MEDIANA_sentinel_2017","MEDIANA_sentinel_2018","MEDIANA_sentinel_2019","MEDIANA_sentinel_2020","MEDIANA_sentinel_2021")

##DESVIO PADRÃO
matriz_sentinel_sd<-matrix(nrow=length(valores_serie_sentinel),ncol=nlayers(serie_sentinel))

for (i in 1:length(valores_serie_sentinel)) {
  poligono<-valores_serie_sentinel[[i]]
  resultado<-numeric()
  
  for (col in 1:ncol(poligono)){
    sd<-sd(poligono[,col],na.rm=T)
    resultado<-c(resultado,sd)
  }
  
  matriz_sentinel_sd[i,]<-resultado   
}

df_sentinel_SD<-as.data.frame(matriz_sentinel_sd)
names(df_sentinel_SD)<-c("SD_sentinel_2016","SD_sentinel_2017","SD_sentinel_2018","SD_sentinel_2019","SD_sentinel_2020","SD_sentinel_2021")

df_sentinel<-cbind(df_sentinel_MEDIA,df_sentinel_MEDIANA,df_sentinel_SD)
names(df_sentinel)<-c("MEDIA_sentinel_2016","MEDIA_sentinel_2017","MEDIA_sentinel_2018","MEDIA_sentinel_2019","MEDIA_sentinel_2020","MEDIA_sentinel_2021",
                      "MEDIANA_sentinel_2016","MEDIANA_sentinel_2017","MEDIANA_sentinel_2018","MEDIANA_sentinel_2019","MEDIANA_sentinel_2020","MEDIANA_sentinel_2021",
                      "SD_sentinel_2016","SD_sentinel_2017","SD_sentinel_2018","SD_sentinel_2019","SD_sentinel_2020","SD_sentinel_2021")
#

df_sentinel<-read.csv('df_sentinel.csv')
df_ndvi<-read.csv('df_ndvi.csv')
df_ndwi<-read.csv('df_ndwi.csv')
write.csv(df_sentinel,'df_sentinel.csv',row.names = F)
####FIM

tabela_total<-cbind(df_ndvi,df_ndwi,df_swir,df_sentinel)
write.csv(tabela_total,'tabela_total.csv',row.names = F)
