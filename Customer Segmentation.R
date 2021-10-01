rm(list=ls())

install.packages("xlsx")
install.packages("writexl")
install.packages("factoextra")
library(dplyr)
library(tibble)
library(funModeling)
library(writexl)
library(xlsx)
library(corrplot)
library(tidyr)
library(stats)
library(lubridate)
library(caret)
library(factoextra)
library(cluster)
library(readr)
library(rio)


#ruta hacia la carpeta de trabajo

setwd("~/Desktop/Gonyi/Analitica de Negocios /Materias Posgrado/Proyecto ")
base.dir<- '~/Desktop/Gonyi/Analitica de Negocios /Materias Posgrado/Proyecto '
datos.dir <- file.path(base.dir, "datos")   # para almacenar datos
reportes.dir <- file.path(base.dir, "reportes") # almacernar reportes
graficos.dir <- file.path(base.dir, "graficos")   # almacenar gráficos
modelos.dir <- file.path(base.dir, "modelos")  # almacenar modelos

datos_partners_ort_2021 <- import("datos_partners_ort_2021 .csv")
sesiones <- import("sesiones_ORT_2021.csv")

summary(datos_partners_ort_2021)
str(datos_partners_ort_2021)

#cargamos paquete de funciones
source("mis_funciones.r")

#Exploración y análisis descriptivo
dim(datos_partners_ort_2021)
head(datos_partners_ort_2021)
summary(datos_partners_ort_2021)
str(datos_partners_ort_2021)


#Analizaremos solo la categoria de clientes Market (groceries)
#Filtramos por business name Markets y creamos una nueva base
market.data.<-datos_partners_ort_2021 %>% filter(business_name=='Market')
market.data.1<-merge(market.data., sesiones, by = "restaurant_id")

str(market.data.1)

#transformamos las variables de texto a factores 
market.data.1$business_name <- as.factor(market.data.1$business_name)
market.data.1$is_logistic <- as.factor(market.data.1$is_logistic)
market.data.1$accepts_vouchers <- as.factor(market.data.1$accepts_vouchers)
market.data.1$shipping_amount<-as.factor(market.data.1$shipping_amount)
market.data.1$delivery_time<-as.factor(market.data.1$delivery_time)
market.data.1$has_discount<- as.factor(market.data.1$has_discount)
market.data.1$has_mov <- as.factor(market.data.1$has_mov)
market.data.1$has_online_payment <- as.factor(market.data.1$has_online_payment)
market.data.1$is_gold_vip <- as.factor(market.data.1$is_gold_vip)
market.data.1$has_custom_photo_menu <- as.factor(market.data.1$has_custom_photo_menu)
market.data.1$accepts_pre_order <- as.factor(market.data.1$accepts_pre_order)
market.data.1$capacity_check <- as.factor(market.data.1$capacity_check)


#pasamos first_order_date de character a fecha 
market.data.1$first_order_date<-as.Date(market.data.1$first_order_date, tryFormats = c("%Y-%m-%d", "%Y/%m/%d"),
                                        optional = FALSE)

#Pasamos las variables characters a continuas: actual_delivery_time y response_time
market.data.1$actual_delivery_time <- sub(",", ".", market.data.1$actual_delivery_time)
market.data.1$actual_delivery_time <- as.numeric(market.data.1$actual_delivery_time)

market.data.1$response_time <- sub(",", ".", market.data.1$response_time)
market.data.1$response_time <- as.numeric(market.data.1$response_time)

glimpse(market.data.1)

#Pasamos las variables character a enteros
#Identificamos columnas character
char_columns <- sapply(market.data.1, is.character)            
# Replicamos la data
data_chars_as_num <- market.data.1                              
# Recodificamos characters como numericas
data_chars_as_num[ , char_columns] <- as.data.frame(apply(data_chars_as_num[ , char_columns], 2, as.numeric))
# Vemos clases de todas las columnas
sapply(data_chars_as_num, class)                       
market.data.1<-data_chars_as_num
str(market.data.1)


#recodificamos la variable cahts en chats
market.data.1$chats<-market.data.1$cahts
market.data.1<-market.data.1%>%select(-cahts)



#Descriptiva general de los datos
df_status(market.data.1)
profiling_num(market.data.1)
describe(market.data.1)

#exportamos graficas para variables cualitativas
frecuencias<-freq(market.data.1,path_out= graficos.dir,plot = T)



########## LIMPIEZA DE LA DATA ##############

#excluiremos las variables que no consideramos relevantes y otras por ser casi en su totalidad NA
#business_name,vendor_late,year_first_order,month_first_order
str(market.data.1)
market.data.2<-market.data.1%>%select(-3,-9,-21,-22)


# Busquemos aquellos partners con datos completos
data_complete <- market.data.2[complete.cases(market.data.2), ] 
str(data_complete)

#Correlacion de variables numericas
corr_mat<-data_complete%>%select(1:26)%>% select_if(is.numeric)%>%cor()
corr_mat
par(mfrow=c(1,1))
corrplot(corr_mat, method= "pie",type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
# a grandes rasgos, vemos que hay variables muy correlacionadas que pueden afectar la creación de los clusters


#sacamos de la base qty_picts ya que esta muy correlacionada con qty_products 
str(market.data.2)
market.data.2<-market.data.2%>%select(-20)





############ TRATAMIENTO DE LOS NA ##################

# filtrado de columnas con todos los datos perdidos
is.na.in.dataset<-is.na.data.frame(market.data.2)
summary(is.na.in.dataset)

###imputación de Null en Variables Cualitativas
#para todos los casos, imputaremos los valores faltantes al valor de la mayoria de la variable
levels(market.data.2$has_discount)[2] <-"False"
levels(market.data.2$has_online_payment)[2] <-"True"
levels(market.data.2$is_gold_vip)[2] <-"False"
levels(market.data.2$has_custom_photo_menu)[2] <-"False"
levels(market.data.2$accepts_vouchers )[2] <-"True"
levels(market.data.2$has_mov)[2] <-"True"
levels(market.data.2$delivery_time)[5] <-"Entre 30' y 45'"


#accepts_order
#cambiamos en la variable accepts_voucher los casos mal imputados como True
market.data.2$accepts_vouchers<-ifelse(market.data.2$voucher_order == 0 ,"False","True")


#voucher_order
summary(market.data.2$voucher_order)
#asumimos que los NA no aceptan voucher y tienen 0 voucher_order
#asignamos los NA de voucher_order a  0 
market.data.2$voucher_order[is.na(market.data.2$voucher_order)]=0
#asignamos los NA de accepts_order a FALSE
market.data.2$accepts_vouchers[is.na(market.data.2$accepts_vouchers)] = "False"

#Shipping amount
levels(market.data.2$shipping_amount)[1]<-"False"
levels(market.data.2$shipping_amount)[2]<-"True"


###Imputación de NA en Variables Cuantitativas
is.na.in.dataset<-is.na.data.frame(market.data.2)
summary(is.na.in.dataset)

#chats
#los NA de los chats seran reemplazados por 0
market.data.2$chats[is.na(market.data.2$chats)] = 0

#los NA de las encuestas seran reemplazados por 0
#cant_pasivos
#asumimos que los que NA en esta variable son 0
market.data.2$cant_pasivos[is.na(market.data.2$cant_pasivos)] = 0

#cant_detractores
#asumimos que los que NA en esta variable son 0
market.data.2$cant_detractores[is.na(market.data.2$cant_detractores)] = 0

#cant_promotores
#asumimos que los que NA en esta variable son 0
market.data.2$cant_promotores[is.na(market.data.2$cant_promotores)] = 0

#por la alta correlatividad entre las variables de encuestas decidimos crear una que sea
#NPS= cant_promotores - cant_detractores, y eliminar de la base cant_pasivos por estar muy correlacionada
market.data.2$NPS<-market.data.2$cant_promotores-market.data.2$cant_detractores

#etiquetamos los niveles
market.data.2$NPS[(market.data.2$NPS > 0)]<-"Positivo"
market.data.2$NPS[(market.data.2$NPS == 0)]<-"Neutral"
market.data.2$NPS[(market.data.2$NPS < 0)]<-"Negativo"


#Volvemos a pasar a factor las cuali
cuali<-c(2,3,8:14,17,18,26)
market.data.2[,cuali]<-lapply(market.data.2[,cuali],factor)



#sacamos del análisis las variables de NPS 
str(market.data.2)
market.data.2<-market.data.2%>%select(-4,-5,-6)


### Reemplazo por Ratios ###

#rechazos
#reemplazamos los NA por la mediana por cantidad de ordenes realizadas.
summary(market.data.2$rechazos)
summary(market.data.2$ordenes)
market.data.2$rechazos[is.na(market.data.2$rechazos)]<-(market.data.2$ordenes * (4/960.5))


#reemplazos por mediana en aquellos variables afectados por outliers

#triggers
#asignamos los NA de triggers a su mediana (median=3)
summary(market.data.2$triggers)
market.data.2$triggers[is.na(market.data.2$triggers)] = 3

##qty_products estimamos este valor para los NA, se aplica la mediana también 
summary(market.data.2$qty_products)
market.data.2$qty_products[is.na(market.data.2$qty_products)] = 105


#response time
#aplicamos mediana porque vemos que esta afectada por dos outliers
summary(market.data.2$response_time)
market.data.2$response_time[is.na(market.data.2$response_time)] = 1.922

#le ponemos la mediana a los partners que tengan response time 0
market.data.2$response_time[(market.data.2$response_time == 0)]<-(median(market.data.2$response_time))

#first_order_date
#aplicamos mediana a los 5 NA de first_order_date
summary(market.data.2$first_order_date)
market.data.2$first_order_date[is.na(market.data.2$first_order_date)] = "2020-08-19"


#verificamos que no hayan mas NA
is.na.in.dataset<-is.na.data.frame(market.data.2)
summary(is.na.in.dataset)


#guardamos el dataset en formato nativo de r
saveRDS(market.data.2, file.path(datos.dir, 'Base_completa.csv'))


############  TRATAMIENTO DE OUTLIERS Y RATIOS  ######################
#los importamos para volver a trabajar
market.data.3 <- readRDS(file.path(datos.dir, 'Base_completa.csv'))



#actual_delivery_time
#modificamos valores de 0 en actual_delivery_time y aplicamos media porque tiene distribución normal
summary(market.data.3$actual_delivery_time)
market.data.3$actual_delivery_time[(market.data.3$actual_delivery_time == 0)]<-(mean(market.data.3$actual_delivery_time))


#las variables númericas las llevamos a un ratio por orden 
#ratio de triggers por orden
market.data.3$triggers<-(market.data.3$triggers/market.data.3$ordenes)*100
#ratio de chats por orden
market.data.3$chats<-(market.data.3$chats/market.data.3$ordenes)*100
#ratio de rechazos por orden
market.data.3$rechazos<-(market.data.3$rechazos/market.data.3$ordenes)*100
#ratio de sesiones por orden
market.data.3$sesiones<-(market.data.3$sesiones/market.data.3$ordenes)*100
#ratio de vouchers por orden
market.data.3$voucher_order<-(market.data.3$voucher_order/market.data.3$ordenes)*100


#modificamos fecha de aquellos posteriores al 31-01-2021 para que entren en el periodo de estudio
market.data.3$first_order_date[(market.data.3$first_order_date=="2021-02-02")] = "2021-01-31"
market.data.3$first_order_date[(market.data.3$first_order_date=="2021-02-03")] = "2021-01-31"
market.data.3$first_order_date[(market.data.3$first_order_date=="2021-02-01")] = "2021-01-31"

#creamos la variable antiguedad de partners en dias
x2<-rep(c("2021-01-31"),times=1864)  
class(x2)
market.data.3$fecha <- x2
market.data.3$fecha<-as.Date(market.data.3$fecha, tryFormats = c("%Y-%m-%d", "%Y/%m/%d"),
                             optional = FALSE)

#cambiamos en first_order_date la antiguedad de aquellos que sean del 31-01-2021 a un dia previo
market.data.3$first_order_date[(market.data.3$first_order_date == "2021-01-31")]<-"2021-01-30"

#creamos los dias de antiguedad del partner
market.data.3$dias_antiguedad <- (interval((market.data.3$first_order_date), (market.data.3$fecha)) %/% days(1))
market.data.3$meses_ant <- market.data.3$dias_antiguedad/30 

#dias de antiguedad, representación gráfica
hist(market.data.3$dias_antiguedad,col=5,xlab="dias",breaks = 100, main="Días de antiguedad del Partner")


#llevamos a 6 el máximo de meses de antiguedad, ya que es la ventana de estudio en el caso propuesto 
#partimos del supuesto que los datos históricos como el recuento acumulado de ordenes comienza el 01-08-2020
market.data.3$meses_ant[(market.data.3$meses_ant>6)] = 6


#llevamos las ordenes con información histórica a un promedio mensual
#ordenes
market.data.3$ordenes<-(market.data.3$ordenes/market.data.3$meses_ant)

#sacamos del analisis la variable fecha y meses de antiguedad
str(market.data.3)
market.data.3<-market.data.3%>%select(-24,-26)
str(market.data.3)

#verificamos que no hayan mas NA
is.na.in.dataset<-is.na.data.frame(market.data.3)
summary(is.na.in.dataset)

#2 partners que no han emitido ordenes, los sacamos del análisis
market.data.3<- market.data.3%>% drop_na()  

#chequeamos correlacion de variables numericas
corr_matriz1<-market.data.3%>%select(1:24)%>% select_if(is.numeric)%>%cor()

par(mfrow=c(1,1))
corrplot(corr_matriz1, method= "pie",type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
corr_matriz1

#no parecen haber problemas de correlación de variables para la segmentación

#guardamos el dataset en formato nativo de r
saveRDS(market.data.3, file.path(datos.dir, 'Base_ratios.csv'))


###############  Analisis grafico  ###############
#los importamos para volver a trabajar
market.data.4 <- readRDS(file.path(datos.dir, 'Base_ratios.csv'))


str(market.data.4)
#graficos de caja en panel 
par(mfrow=c(3,3))
boxplot(market.data.4$actual_delivery_time,col="red",main="Actual_delivery_time",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$ordenes,col="green",main="órdenes por mes",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$response_time,col="grey",main="Response_time",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$qty_products,col="grey",main="Qty_products por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$rechazos,col="blue",main="Rechazos por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$triggers,col="red",main="Triggers por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$chats,col="green",main="Chats por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$dias_antiguedad ,col="red",main="Dias_antiguedad",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$sesiones,col="red",main="Sesiones por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$voucher_order,col="red",main="Voucher por orden",outline=FALSE,notch=TRUE,horizontal = TRUE)
boxplot(market.data.4$dias_antiguedad,col="red",main="Dias_de_antiguedad",outline=FALSE,notch=TRUE,horizontal = TRUE)


#histogramas de variables para numericas
market.data.4%>%select(1:24)%>% select_if(is.numeric)%>%hist()


#graficos de barra
barplot(table(market.data.4$is_logistic),main='is_logistic',col = "red",cex.names = 0.7)
barplot(table(market.data.4$has_mov),main='has_mov',col = "red",cex.names = 0.7)
barplot(table(market.data.4$has_online_payment),main='has_online_payment',col = "grey",cex.names = 0.7)
barplot(table(market.data.4$is_gold_vip),main='is_gold_vip',col = "red",cex.names = 0.7)
barplot(table(market.data.4$accepts_pre_order),main='accepts_pre_order',col = "red",cex.names = 0.7)
barplot(table(market.data.4$capacity_check),main='capacity_check',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$accepts_vouchers),main='accepts_vouchers',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$has_discount),main='Has_discount',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$has_custom_photo_menu),main='Has_custom_photo_menu',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$NPS),main='NPS',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$shipping_amount),main='Shipping_amount',col = "blue",cex.names = 0.7)
barplot(table(market.data.4$delivery_time),main='Delivery_time',col = "red",cex.names = 0.7)


#Análisis específico de la variable rechazos
#etiquetamos los niveles
market.data.4$rechazos_op[(market.data.4$rechazos > 2.5)]<-"Malos_Op"
market.data.4$rechazos_op[((market.data.4$rechazos >= 1) & (market.data.4$rechazos <= 2.5) )]<-"Regulares_Op"
market.data.4$rechazos_op[(market.data.4$rechazos < 1)]<-"Buenos_Op"

market.data.4$rechazos_op <- as.factor(market.data.4$rechazos_op)
summary(market.data.4$rechazos_op)

#creamos una base para analisis gráfico pero con aquellos partners que tengan una antiguedad mayor a 45 días
rechazos_analisis<-(market.data.4[market.data.4$rechazos_op =="Malos_Op",])
rechazos_analisisI<-(rechazos_analisis[rechazos_analisis$dias_antiguedad >=45,])

rechazos_restI <- market.data.4%>%subset(market.data.4$rechazos_op !="Malos_Op")
rechazos_rest<-(rechazos_restI[rechazos_restI$dias_antiguedad >=45,])

#exportamos resumenes de rechazos_analisis y resto de la base para extraer conclusiones
sink(file.path(reportes.dir, 'summaryrechazos_analisisI.txt'))
summary(rechazos_analisisI)
sink()
sink(file.path(reportes.dir, 'rechazos_rest.txt'))
summary(rechazos_rest)
sink()

#volvemos a exportar graficas para variables cualitativas en toda la base
frecuenciasII<-freq(market.data.4,path_out= graficos.dir,plot = T)


#### Analisis multivariado #####
str(market.data.4)
#visualizamos asociaciones entre variables
market.data.4%>%select(1:6)%>% select_if(is.numeric)%>%pairs()
market.data.4%>%select(7:12)%>% select_if(is.numeric)%>%pairs()
market.data.4%>%select(13:25)%>% select_if(is.numeric)%>%pairs()


#Frecuencias para variables cualitativas
freq(market.data.4,plot=TRUE)


######### Segmentación ##########
#sacamos aquellas variables que no tenga sentido segmentar a nivel funcional
#más aquellas no relevantes en la conformación de los clusters debido a que cuentan
#con una frecuencia en una de las etiquetas que asciende al 90%:
#restaurant_id
#is_logistic
#accepts_vouchers
#actual_delivery_time por tener distribución uniforme, no tiene estructura para clusterizar
#has_discount
#has_online_payment
#is_gold_vip
#has_custom_photo_menu
#first_order_date
#NPS
#días de antiguedad

########## Base para clusterizar #############
str(market.data.4)
base1_clus<-market.data.4 %>% select(-1,-2,-3,-4,-7,-9,-10,-11,-16,-23,-24,-25)
summary(base1_clus)  
str(base1_clus)


################## Estandarizamos  ###################
#Estandarizamos las variables numericas para que tengan la misma medida
str(base1_clus)
market_escalado<-base1_clus%>%select(-1:-3,-6,-7)
str(market_escalado)
base_no_scale<-base1_clus%>%select(-4,-5,-8:-13)
str(base_no_scale)
market_escalado1<-scale(market_escalado)
market_escalado1<-as.data.frame(market_escalado1)
base_escalada<-bind_cols(base_no_scale,market_escalado1)
str(base_escalada)



#hacemos la matriz de distancias Daisy para las variables mixtas
Matriz_scale<-daisy(base_escalada, metric="Gower")
str(Matriz_scale)
Matriz_scale1<-as.matrix(Matriz_scale)

#Test de Hopkins  para saber si nuestra data es clusterizable
#Si se acerca a 1, significa que tiene estructura
#Si se acerca a 0,5 significa que no tiene estructura
set.seed(0)
get_clust_tendency(Matriz_scale1, 10, graph = FALSE)
#vemos que hay estructura porque esta muy cerca del 1


##### Número óptimo de Clusters #####
#número óptimo con silhouette
#indicador silueta con terminos cercanos a 1, indican que se forman buenos clusters
#el k optimo es el que maximiza el indicador silueta promedio de todas las observaciones
set.seed(0)
cluster.optimo<-fviz_nbclust(Matriz_scale1,cluster::pam,method="silhouette", k.max=6)
cluster.optimo


#wss
#método del codo para ver óptimo de clusters
set.seed(0)
fviz_nbclust(x = Matriz_scale1, FUNcluster = pam, method = "wss", k.max = 6,
             diss = dist(Matriz_scale1, method = "manhattan"))


#vemos que el óptimo número de clusters varía entre 4 y 5 

##################  MODELOS  ######################
###################################################
#modelo Kmeans

#capping para tratamiento de outliers en kmeans
# capping masivo (mínimo y máximo) para ponerle un "techo" a los outliers extremos previo a estandarizar
cap <- function(x){
  
  require(scales)
  if( is.numeric(x) | is.integer(x) ){
    lim.inf <- min(quantile(x, 0.01, na.rm = T), quantile(x, 0.25, na.rm = T) - IQR(x, na.rm = T)*3,5 )
    lim.sup <- max(quantile(x, 0.99, na.rm = T), quantile(x, 0.75, na.rm = T) + IQR(x, na.rm = T)*3,5)
    x <- squish(x, range = c(lim.inf, lim.sup)) 
  }
}

#aplicamos un techo a las variables numéricas previo a la estandarización
market_cap <- market.data.4 %>% select_if(is.numeric) %>% sapply(cap) %>% as.data.frame()

#vemos diferencias
summary(market_cap$response_time)
summary(market.data.4$response_time)

summary(market_cap$triggers)
summary(market.data.4$triggers)

summary(market_cap$NPS)
summary(market.data.4$NPS)

summary(market_cap$ordenes)
summary(market.data.4$ordenes)

summary(market_cap$qty_products)
summary(market.data.4$qty_products)

summary(market_cap$chats)
summary(market.data.4$chats)

summary(market_cap$rechazos)
summary(market.data.4$rechazos)

#nombramos a las variables con techo
names(market_cap) <- paste(names(market_cap ), 'cap', sep = '_')
names(market_cap )
#merge de variables númericas transformadas con la base 
market.data_cap<- bind_cols(market.data.4, market_cap)
dim(market.data_cap)


#1er Modelo
#kMeans solo con variables númericas
str(market.data_cap)
#sacamos las variables cuali de la base + las que no tengan capping
base_km<-market.data_cap%>%select(-1:-26,-36)
str(base_km)

summary(base_km)
cor(base_km)


#estandarizamos la base
base_km_scale<-scale(base_km)

#chequeamos que con scale tenemos media 0 en las variables
summary(scale(base_km))

#chequeamos que el desvio estandar sea 1.
sd(scale(base_km$ordenes_cap))


#número óptimo de clusters
fviz_nbclust(x = base_km_scale, FUNcluster = kmeans, method = "wss", k.max = 10,
             diss = dist(base_km_scale))


#silhouette
fviz_nbclust(x = base_km_scale, FUNcluster = kmeans, method = "silhouette", k.max = 10,
             diss = dist(base_km_scale))

#vemos que la silueta promedio apenas supera el 20%. Optamos por buscar otro modelo para 
#obtener mejores resultados

#clusterizamos con k=4
set.seed(0)
km<-kmeans(base_km_scale,4,nstart=25)
km

#cantidad de casos por cluster
table(km$cluster)



##################################################
##################################################
#2do modelo --  Kmedoids
#pam algorithm
#con k=4
#retomamos matriz_scale con las variables cualitativas
set.seed(0)
pam_clusters1 <- pam(x =Matriz_scale, k = 4,diss = TRUE)
pam_clusters1

#custer plot (demora en su ejecución)
#fviz_cluster(pam_clusters1, geom = "point", ellipse.type = "norm")


#cantidad de casos por cluster
table(pam_clusters1$cluster)

#información de cada cluster
pam_clusters1$clusinfo


#medoids
pam_clusters1$medoids

#clustering
pam_clusters1$clustering

#silhouette
fviz_silhouette(pam_clusters1)
pam_clusters1$silinfo

pam_clusters1$objective
pam_clusters1$isolation


#impactamos los clusters al dataset original 
market.data.5<-cbind(market.data.4,Cluster=pam_clusters1$cluster)


#vemos los cluster en las variables
table(pam_clusters1$clustering,market.data.4$accepts_pre_order)
table(pam_clusters1$clustering,market.data.4$is_logistic)
table(pam_clusters1$clustering,market.data.4$accepts_vouchers)
table(pam_clusters1$clustering,market.data.4$has_discount)
table(pam_clusters1$clustering,market.data.4$has_mov)
table(pam_clusters1$clustering,market.data.4$has_custom_photo_menu)
table(pam_clusters1$clustering,market.data.4$capacity_check)


############  INTERPRETACION  ###############

#interpretacion de meroides
meroides<-(market.data.5[c(70,883,120,884),])
view(meroides)
summary(meroides)


Cluster1<-(market.data.5[market.data.5$Cluster==1,])
Cluster2<-(market.data.5[market.data.5$Cluster==2,])
Cluster3<-(market.data.5[market.data.5$Cluster==3,])
Cluster4<-(market.data.5[market.data.5$Cluster==4,])

#Exportamos base para analizar
sink(file.path(datos.dir, 'market.data.5.csv'))
market.data.5
sink()

#describe
describe(Cluster1$dias_antiguedad)
describe(Cluster2$dias_antiguedad)
describe(Cluster3$dias_antiguedad)
describe(Cluster4$dias_antiguedad)
#Cálculos y operaciones 
sum(market.data.5$ordenes)
sum(Cluster1$ordenes)
sum(Cluster2$ordenes)
sum(Cluster3$ordenes)
sum(Cluster4$ordenes)

summary(Cluster1$rechazos_op)
summary(Cluster2$rechazos_op)
summary(Cluster3$rechazos_op)
summary(Cluster4$rechazos_op)

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(rechazos_op)), position = "fill")


#####Grupo Objetivo - Rechazos > 1%
#Antiguedad de 40 a 150 días máximo
#ordenes no más de 300
rechazos_cluster<-(market.data.5[market.data.5$rechazos_op !="Buenos_Op",])
rechazos_clusterI<-(rechazos_cluster[(rechazos_cluster$dias_antiguedad >= 40) & (rechazos_cluster$dias_antiguedad <= 150),])
rechazos_clusterII<-(rechazos_clusterI[rechazos_clusterI$ordenes <= 300,])

#interpretación gráfica en variables numéricas
str(market.data.5)
par(mfrow=c(3,3))
boxplot(rechazos_clusterII$rechazos~rechazos_clusterII$Cluster,col="green",outline=FALSE)
boxplot(rechazos_clusterII$triggers ~rechazos_clusterII$Cluster,col="purple",outline=FALSE)
boxplot(rechazos_clusterII$voucher_order~rechazos_clusterII$Cluster,col="blue",outline=FALSE)

summary(rechazos_clusterII)

Rechazos_Clus1<-(rechazos_clusterII[rechazos_clusterII$Cluster==1,])
Rechazos_Clus2<-(rechazos_clusterII[rechazos_clusterII$Cluster==2,])
Rechazos_Clus3<-(rechazos_clusterII[rechazos_clusterII$Cluster==3,])
Rechazos_Clus4<-(rechazos_clusterII[rechazos_clusterII$Cluster==4,])


#Comparamos público objetivo en 3 clusters
describe(Rechazos_Clus1)
describe(Rechazos_Clus2)
describe(Rechazos_Clus4)


#Grupo Objetivo - Buenos operativos 
Buenos_op<-(market.data.5[market.data.5$rechazos_op =="Buenos_Op",])
Buenos_opI<-(Buenos_op[Buenos_op$dias_antiguedad >=45,])
Buenos_opI<-(Buenos_op[(Buenos_op$dias_antiguedad >= 40) & (Buenos_op$dias_antiguedad <= 150),])
Buenos_opII<-(Buenos_opI[Buenos_opI$ordenes <= 300,])



Buenos_op_Clus1<-(Buenos_opII[Buenos_opII$Cluster==1,])
Buenos_op_Clus2<-(Buenos_opII[Buenos_opII$Cluster==2,])
Buenos_op_Clus3<-(Buenos_opII[Buenos_opII$Cluster==3,])
Buenos_op_Clus4<-(Buenos_opII[Buenos_opII$Cluster==4,])


#Comparamos público objetivo en 3 clusters
describe(Buenos_op_Clus1)
describe(Buenos_op_Clus2)
describe(Buenos_op_Clus4)


describe(Rechazos_Clus4)
median(Rechazos_Clus4$voucher_order)
median(Buenos_op_Clus4$ordenes)
########################################################

#summary de los clusters
#interpretación con summary
sink(file.path(reportes.dir, 'summaryCluster1.txt'))
summary(Cluster1)
sink()
sink(file.path(reportes.dir, 'summaryCluster2.txt'))
summary(Cluster2)
sink()
sink(file.path(reportes.dir, 'summaryCluster3.txt'))
summary(Cluster3)
sink()
sink(file.path(reportes.dir, 'summaryCluster4.txt'))
summary(Cluster4)
sink()
# tablas de frecuencia para las variables cualitativas
freq(Cluster1, plot = F)
freq(Cluster2, plot = F)
freq(Cluster3, plot = F)
freq(Cluster4, plot = F)
#interpretación gráfica en variables numéricas
str(market.data.5)
par(mfrow=c(3,3))
boxplot(market.data.5$ordenes~market.data.5$Cluster,col="red",outline=FALSE)
boxplot(market.data.5$response_time~market.data.5$Cluster,col="blue",outline=FALSE)
boxplot(market.data.5$qty_products~market.data.5$Cluster,col="pink",outline=FALSE)
boxplot(market.data.5$rechazos~market.data.5$Cluster,col="green",outline=FALSE)
boxplot(market.data.5$triggers ~market.data.5$Cluster,col="purple",outline=FALSE)
boxplot(market.data.5$chats ~market.data.5$Cluster,col="red",outline=FALSE)
boxplot(market.data.5$sesiones~market.data.5$Cluster,col="grey",outline=FALSE)
boxplot(market.data.5$voucher_order~market.data.5$Cluster,col="blue",outline=FALSE)


#interpretación gráfica en variables categóricas
str(market.data.5)
par(mfcol = c(4, 4))
ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(is_logistic)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(accepts_vouchers)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(shipping_amount)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(has_discount)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(has_mov)), position = "fill") 

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(has_online_payment )), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(is_gold_vip)), position = "fill") 

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(has_custom_photo_menu)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(accepts_pre_order)), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(capacity_check )), position = "fill")

ggplot(data = market.data.5) +
  geom_bar(aes(x = factor(Cluster), fill = factor(NPS)), position = "fill")



##################################################################################
##################################################################################
##################################################################################
##################################################################################
##################################################################################