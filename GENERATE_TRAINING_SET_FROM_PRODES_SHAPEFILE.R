setwd('C:/Users/aljof/Desktop/arquivos/puc/TCC/bd')

desmatamento_2007<-shapefile('desmatament_ate_2007.shp')
desmatamento<-shapefile('desmatamento_af.shp')

desmatamento<-bind(desmatamento_2007,desmatamento)

r<-raster("serie_ndvi.tif")[[1]]
desmatamento@data<-cbind(desmatamento@data,data.frame(classe=rep(1,nrow(desmatamento@data))))

desmatamento_raster<-rasterize(desmatamento,r,'classe')
desmatamento_raster[is.na(desmatamento_raster)]<-0
writeRaster(desmatamento_raster,'desmatamento_raster.tif',overwrite=T)

segmentos<-shapefile('segmentacao_SNIC.shp')

set.seed(50)
amostras<-sample(nrow(segmentos),size=32000)

#Função MODA
getmode <- function(v) {
  uniqv <- unique(v)
  
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

df<-data.frame(classe_amostra=rep(NA,nrow(segmentos)))
dados<-cbind(segmentos@data,df)
segmentos@data<-dados

fid<-data.frame(fid=1:nrow(segmentos))
dados<-cbind(segmentos@data,fid)
segmentos@data<-dados

for (amostra in amostras){
  poligono<-segmentos[segmentos$fid==amostra,]
  valores<-extract(desmatamento_raster,poligono)[[1]]
  moda<-getmode(valores)
  segmentos$classe_amostra[amostra]<-moda
}

tabela_total<-read.csv('tabela_total.csv',h=T,sep=',')
dados2<-cbind(segmentos@data,tabela_total)
segmentos@data<-dados2

shapefile(segmentos,'segmentos_com_amostras.shp',overwrite=T)
write.csv(segmentos@data,"tabela_com_amostras.csv",row.names=F)
#######################

df_class<-read.csv('C:/Users/aljof/Downloads/df_final.csv',h=T) ####LENDO TABELA BAIXADA DO GOOGLE COLAB
segmentos@data<-df_class
shapefile(segmentos,'segmentos_final.shp',overwrite=T)
