# Customer-Segmentation-

	                                                                           
 



 

DIPLOMA EN ESPECIALIZACIÓN ANALÍTICA DE NEGOCIOS
CASO 1 – PEDIDOSYA 










Gonzalo Antía 




RESUMEN EJECUTIVO 
Frente al crecimiento de la empresa al incorporar nuevos partners y ante la situación de emergencia sanitaria en el país/región, esto ha provocado un crecimiento importante en la demanda de pedidos en la vertical markets de la plataforma. Este contexto genera la necesidad de potenciar estrategias segmentadas sobre los diferentes partners que tiene la organización.
Para citar un ejemplo, los datos de ventas en la vertical en junio del 2019, frente al mismo mes en el año 2020, muestran un crecimiento exponencial de un 350% en la demanda de pedidos 
En perspectiva, al cierre del periodo de estudio (31 Ene’21), notamos que el 80% de los partners de esta vertical comenzaron a operar con el inicio de la pandemia.  
Esto implica un cambio inesperado en la empresa y  un crecimiento exponencial que trae consigo desafíos operativos y comerciales. 
Para generar las estrategias primero se debe entender bien como esta compuesta la cartera de clientes en la vertical groceries, y comprender cuales son los segmentos de usuarios y que tipo de acciones se deben realizar para potenciar el valor de cada partner según las características que tengan. 

A grandes rasgos se analiza:   
- que tipologías de características de partners se presentan en groceries. 
- principales drivers que determinan altos ratios de rechazos en esta vertical 
- que acciones se deben aplicar sobre esos partners para potenciarlos ya sea en términos de marketing u operacionales. Por ejemplo: aquellos que tienen muchas ventas, pero son malos operativamente.

Para ello, se realiza:
Una segmentación de los clientes entendiendo como era el negocio de dichos partners no solo utilizando el NPS sino información de su operativa y performance comercial para finalmente ofrecer recomendaciones a la alta dirección de PedidosYa en cuanto a que acciones tomar para la vertical markets.















INDICE
Breve descripción de la compañía ………………………………………………………………………………………. 4

Introducción ………………………………………………….……………………………  ……. 5

Riesgo de la implementación de la estrategia……………….…………...………………………………………………..6

Hipótesis……………………………………………………………………….…..…7
	
Análisis Exploratorio de Datos…………………………..…..………………………………………….…..….7

Preparación de los Datos..	..………………………….……………………………………….……….…11

Modelado……………………………………………………………………….….. 16
	
Evaluación y Conclusiones………………….………………………………………….…………27

Partner Target………………………………………………………………………28

ANEXOS…./……………………………………………………………………….33




















BREVE DESCRIPCIÓN DE LA COMPAÑÍA 
PedidosYa es una compañía uruguaya de delivery online con presencia en varios países de América Latina. Su sede central está ubicada en Montevideo, Uruguay; sin embargo, también cuenta con oficinas en las principales ciudades de Argentina, Bolivia, Chile, Colombia, República Dominicana, Panamá, Paraguay y Venezuela. Su principal metodología de logística es mediante el uso de motocicletas y bicicletas de reparto.
 Actualmente ha superado los 60 mil comercios adheridos a la plataforma y se encuentra en etapa de crecimiento al prever una participación operacional en 14 mercados para el 2021. 
En estos momentos la empresa esta incursionando en nuevos mercados en el extranjero en donde tiene como politica comprar empresas (como en el caso de Glovo) que funcionan eficientemente, adquiriendo de esta forma la operación y logrando así el conocimiento (know how) de las particularidades de cada mercado.  
A nivel de inversiones, mantiene una política de inversión constante en diversos frentes con el fin que el negocio crezca. 
 

Ventaja competitiva:
Una de las principales ventajas competitivas frente a sus competidores es ser pionera en el rubro al ser la primera plataforma de delivery online, lo cual transmite confianza, seguridad y presencia de marca tanto a nivel nacional como internacional.
Especificamente en la vertical groceries, la cual se aborda en este proyecto, se ve una ventaja importante frente a sus competidores (por ejemplo: Disco, Tienda Inglesa, otros supermercados) al tener disponible información actualizada del comportamiento de compra de los usuarios, picos de consumo de productos, características del cliente, base de datos de los usuarios y el conocimiento de la demanda de productos definida por zona geográfica.
Otra ventaja importante de la empresa que se puede aplicar en esta vertical es la red logística y el sustento tecnológico que respaldan las decisiones estratégicas de la empresa. 
Ninguno de los competidores en esta vertical tiene el respaldo logístico y tecnológico de PedidosYa. 
 

INTRODUCCIÓN 
Objetivo:
Capitalizar la demanda de pedidos que se debe a la coyuntura actual por la emergencia sanitaria regional y responder con eficiencia operativa y comercial.  
Consolidar el crecimiento en las verticales no “tradicionales” haciendo uso de las ventajas competitivas de la empresa: red de clientes, sistema logístico e información relacionada al comportamiento de compra del mercado. 
La cartera de clientes de PedidosYa se compone en un 80% de partners en la categoría restaurantes los cuales requieren de un sistema logístico y operacional que tiene picos de exigencia al mediodía y durante la noche.  PedidosYa cuenta con dicha red logística. El paso siguiente, es impulsar las ventas de los nuevos verticales para que la empresa pueda aprovechar esta red, generar nuevas ocasiones de compra y realizar operaciones de forma estable durante el dia.  
Potenciar verticales que no son las tradicionales de la empresa (Groceries), permitirá optimizar la flota que en algunos momentos del día está siendo menos utilizada que en otros.  El objetivo es bajar el costo por orden, aumentar las ventas y el revenue en las distintas verticales. 
Para ello la propuesta es caracterizar la cartera de partners de la vertical en cuestion, con el objetivo que una vez determinada la tipología y características de los distintos grupos, se puedan encarar accionables especificos para cada conjunto. 
Problema:
Debido al crecimiento exponencial de la demanda en un contexto de pandemia, con una oferta que falta contextualizar por el hecho de que el ritmo de venta es muy acelerado, donde el 80% de los partners tiene menos de 10 meses de operativa en la plataforma, se plantea el problema. 
En este sentido, la dificultad se presenta al no tener identificado de forma precisa como se comportan los partners de la empresa para afrontar esta demanda, que, en definitiva, puede perjudicar la imagen de marca de PedidosYa. 
El problema en esta vertical en particular es que hay partners de distinto volúmen operacional, con distintas necesidades y a los cuales se les deberían aplicar estrategias diferenciadas según las características que tengan cada uno. 
Como los recursos de la empresa son finitos, se considera que particionando el problema y detectando posibles patrones en común entre los partners, se obtendrían directrices certeras que serían de gran utilidad para focalizar recursos y esfuerzos. En este sentido, es de relevancia que los partners puedan ser “autosuficientes” y ser los propios gestores de su negocio y performance dentro de la aplicación 
A modo de ejemplo, las necesidades de un almacén, carnicería, o un autoservicio no son las mismas que las de un supermercado como Tienda Inglesa.

Alcance:
El alcance es para toda la empresa en general.  Se trabajará con el departamento de operaciones y comercial.
El equipo establecera recomendaciones para grupos especificos dentro de la cartera de partners. Los resultados parciales seran analizados junto a la directora de Analytics de la empresa, mientras que las prupuestas a nivel comercial y operacional seran presentadas a los responsables de los respectivos departamentos. 
Es un estudio de mucha importancia para seguir potenciando el desarrollo de la vertical que más creció en el último periodo. 



RIESGOS EN LA IMPLEMENTACIÓN DE LA ESTRATEGIA 
RIESGOS DE CAMBIO 
El modelo no implica un cambio cultural dentro de la organización, dado que la empresa ya cuenta con su departamento de Analytics y tiene cultura de empresa Data Driven que apuesta por la recolección y revisión de datos y que toma decisiones estratégicas en base a la interpretación de datos.  
RIESGOS TECNOLÓGICOS 
No se considera que puede haber un riesgo tecnológico asociado al desarrollo operacional de las soluciones del problema de negocio. PedidosYa tiene respaldo e invierte permanentemente en nuevas tecnologías. Se considera, que las respuestas a las hipótesis que se formulen deben ser acompañadas por el conocimiento interno de los empleados de la compañía. 


HIPOTESIS 
La expansión del negocio de forma exponencial en el área de markets no ha permitido realizar un análisis de como esta performando los partners y así el servicio de cara al cliente. 
Se entiende que se cuenta con un input muy relevante e inmediato como es el NPS (Net Promoted Score) que ya está dando información sobre como performa cada partner, pero sin explicar que hacen que sean bien o mal valorados.
Las hipótesis:
-	Un NPS positivo o negativo de por si solo no va a explicar cómo performa un partner. Se puede ser un Partner con NPS positivo pero tener una operativa con altos rechazos, cantidad relevante de triggers y manejo ineficiente de su gestión operativa.
-	Los tiempos de preparación y entrega de pedidos no tienen alto impacto en rechazos como puede ser en la vertical restaurants 
-	La gestión operativa en grandes superficies no debería traer aparejado altos ratios de  rechazos por ordenes ni triggers.  
-	El costo de envio repercute en la cantidad de ordenes solicitadas, en consecuencia, partners considerados “nuevos” tienden a no tener costo de envio para procurar posicionarse velozmente en el mercado.
-	Locales que presentan la funcionalidad de limite de capacidad tienen menos rechazos en sus ordenes frente a aquellos  que no la tienen. 


ANALISIS EXPLORATORIO DE DATOS 
Luego de recibir la base de información de 47.166 clientes de la empresa se considera que, para atacar las necesidades del caso propuesto, se debe hacer un enfoque en la vertical “markets” buscando segmentar los distintos tipos de partners que se tienen en esta vertical. 
El universo de información clasificada asciende a 1.864 partners con 29 variables y es a priori, el sector que se analizará en este proyecto.  
El universo a estudiar es “markets”, y aquí se separa a este grupo de clientes del resto de la base porque la forma de operar es distinta, no solo en la operativa de la empresa, sino también en lo que espera y exige el cliente que realiza el pedido. Es un negocio diferente al del resto de las verticales. 
Esto no descarta que luego en el avance del proyecto de analítica, se realicen análisis en paralelo de las características de otros tipos de partners que puedan tener una oferta y comportamiento de compra similar a la vertical “markets” lo cual enriquecería los resultados.  
Primero se observan las variables en su conjunto para saber de forma genérica las relaciones intrínsecas entre ellas. 
Diagramas de correlación de variables seran importantes para saber cuáles están positiva o negativamente relacionados entre si. 
Para clasificar a los partners en distintos grupos, se entiende que hay variables que están asociadas al tamaño del cliente, a su antiguedad y otras a sus rendimientos operativos y comerciales.
La cantidad de órdenes totales históricas, aunque estas no tienen porque ser aceptadas y el “capacity_check” que es el limite de órdenes que tiene el partner en determinado momento, son variables que determinaran el volumen operativo del cliente, es decir, si estamos frente a un negocio grande o no.
La antigüedad sera definida por la variable “year_first_order”, acompañada por la variable “month_first_order”. 
A priori, se pueden distinguir las variables más importantes que se asocian a un rendimiento operativo del partner: 
-	Vendor_late: Con esta variable se sabrá que clientes ejecutan mas rápido la orden, para así poder clasificar entre buenos y malos partners.  
-	Rechazo: Cantidad de órdenes canceladas o rechazadas. Puede ser que el cliente se haya quedado sin productos debiendo rechazar la orden y así poder concluir que tiene problemas operativos porque maneja mal su catalogo. Si se conoce el motivo del rechazo, se sabra si tiene una falla operativa o comercial. 
-	Triggers: Sanciones que se generan de forma automática y se le imponen a los partners. Cada trigger tiene una explicación, lo cual podría ayudar a definir acciones futuras para mitigar triggers.  
-	Chats: Se podría considerar que una alta cantidad de chats esta asociada a un problema operacional. 
-	Cantidad De pasivos
-	Cantidad de detractores: cuanto mayor sea el número, peor sera la valoración del partner.
-	accepts_pre_order: si aceptan reservas de órdenes, por ejemplo, para la noche. Se podría relacionar con un negocio bien organizado. 
-	Sesiones: un alto número en esta variable podría representar falta de eficiencia en el partner. 
También hay variables asociadas al rendimiento operacional pero que pueden tener una menor incidencia en la vertical groceries ya que aquí el tiempo exigido de entrega del producto por parte del cliente no es el mismo que si se estuviese en la vertical foods (restaurantes).
-	Delivery_time: Rango de tiempo prometido de entrega. 
-	Actual_delivery_time: Tiempo promedio de delivery.
-	Response_time: Tiempo promedio de respuesta entre que se hace la realización del pedido y el partner confirma o rechaza la orden.
Aquí otras variables que se asocian a un rendimiento comercial del partner: 
-	Accepts_voucher: Si el local acepta voucher de descuento o no. Un 7% de los partners se niegan a aceptar, mientras un 86% si lo hacen. Del 7% restante no hay información, por lo cual se asume que son partners a los cuales se puede convencer de aplicar descuentos en sus productos.
-	voucher_order- cantidad de órdenes con voucher – descuento asociado. 
-	is_gold_vip – Si es partner patrocinado o no. 
-	qty_picts - La cantidad de fotos de los productos q tienen en su perfil. 
-	has_mov – ¿Tiene valor mínimo de compra?
-	Has_online_payment: ¿Acepta pagos online?
-	Has_custom_photo_menu: ¿tiene fotos reales en menu?
-	Qty_picts: cantidad de fotos cargadas en histórico.
-	Shipping amount: Si tiene costo de envío o no. 
-	cant_promotores: Cantidad de encuestas promotoras. 
-	has_discount - ¿tiene descuento?

Con estas variables se podrá armar un juego de datos que ayude a descifrar grupos de clientes que operan bien vs grupos que operan mal. Mismo sistema se aplicará para separar aquellos que tienen buena gestión comercial de los que no. Previamente se deberá definir parametros para considerar un buen partner o no, cuales son los rangos de las variables.
¿Hay clientes considerados buenos operativamente, pero malos comercialmente? ¿O viceversa? 
Esta comprobado que hay ciertas acciones comerciales que colaboran para que haya un aumento en la demanda de órdenes de un socio. Partners que no acepten vouchers, pagos con tarjeta de crédito o de forma electrónica, que no tengan fotos reales en su menu, no van a estar haciendo valer los beneficios comerciales de PeYa. 
Sin embargo, estos partners pueden ser eficientes operativamente al tener bajos valores en variables como tiempo de respuesta, rechazos de órdenes. La misma situación puede suceder de forma invsersa, por lo tanto, resulta interesante lograr respuestas a estas preguntas mediante la investigación analítica de la base.
En el avance del proyecto analítico se definirá la significación de negocio y la importancia de cada variable.  Así como también si se considera descartar variables en el transcurso del proyecto. 

Análisis Univariado, Imputación de valores faltantes y presencia de Outliers.
El enfoque del análisis univariado de la base se enfrentó con técnicas de distribución de frecuencias y proporciones para variables cualitativas y de distribución de centralidad, dispersión y forma para variables cuantitativas. 
Se empezará analizando aquellas variables que se asocian a un rendimiento operativo y luego se buscará su relación bivariada con las que se asocian a un rendimiento comercial. 
Lo primero que se debe hacer es una separación entre aquellos partners de esta vertical que pertenezcan a la categoría de cliente “Own Delivery” de aquellos que pertenecen a “Vendor Delivery”. Luego de esta separación se podrá realizar un análisis descriptivo mas acertado de las variables ya que cada categoría de cliente cuenta con su particularidad.
Como primera apreciación, se denota que el 94% de los partners requieren del servicio logístico de delivery de PedidosYa (“Own Delivery”).  Ante esto, se considera que una buena medida para clasificar como partners “buenos” en sus funciones operativas seran aquellos que tengan bajos valores de variables asociadas al tiempo de respuesta en la preparación, armado y entrega de pedidos. Lamentablemente, variables que se consideraban importantes en la definición de estos grupos como es el caso de Vendor_late, esta compuesta en su totalidad por valores faltantes, por lo tanto, fueron descartadas de la base en análisis.  Resta indagar sobre si esta falta de información se debe a un problema en la extracción y transformación de los datos o si se debe a otra dificultad operativa del sistema de gestión. 
Siguiendo con el análisis univariado de las variables asociadas al rendimiento operativo, se ve que la cantidad de rechazos, triggers y chats asociados a órdenes presentan distribuciones asimétricas con asimetría positiva y presencia de outliers que luego afectarán la creación y segmentación de grupos. 
Los principales resultados del análisis univariado indican que se debe hacer un tratamiento con los registros nulos de la base. Ante ello, se realizan reemplazos de valores nulos por ratios por orden emitida en variables como rechazos, mientras que en otras variables afectadas por outliers se opta por reemplazar por la mediana.  
En cuanto a los valores perdidos o nulos, se realizó lo siguiente
-	Casos faltantes de variables cualitativas: se imputaron los valores más recurrentes de dicha variable
-	N/A en variables cuantitativas: en mayoría de los casos se aplica la mediana, ya que la mayoría de las variables cuantitativas presentan problemas de outliers, y sus medias no son representativas. En otros, como en las encuestas, se decide imputarlos con valor cero.
En las variables cualitativas se decide un tratamiento similar para todos los casos en que hayan valores faltantes. Siempre rige el principio de la mayoría, es decir, para todos los casos se imputa los valores faltantes a la etiqueta con mayor frecuencia. 
Un aspecto importante en el análisis de la base es que hay presencia de variables cuantitativas que estan medidas en términos absolutos, por lo tanto, una buena práctica es que sean relativas al tiempo. 
Para esto, se decide llevar el análisis de la variable cantidad de ordenes hsitóricas a un promedio mensual por partner.  De esta forma, se logra comparar en términos de cantidad de órdenes generadas por mes a todos los partners. Y a aquellos que tengan una antigüedad mayor a la ventana de estudio (desde Agosto 2020 a Enero 2021) se decide ponderarlos por la cantidad de meses de la ventana, es decir, 6 meses. 
Procedimiento similar se realiza con el resto de las variables cuantitativas que contienen información acumulada histórica, que de ahora en más, serán expresadas en forma de ratio por orden emitida por partner. (Aquí se parte del supuesto que los datos históricos como el recuento acumulado de órdenes comienza el 01-08-2020).
Esta práctica será útil a la hora de estandarizar la base, y así no sufrir efectos indeseados en el cálculo de distancias. 





PREPARACIÓN DE DATOS
Análisis multivariado:
A continuación se presenta un diagrama de correlación que muestra la relacion de las variables numéricas en la base recibida por la empresa sin hacer modificaciones de ningún tipo. 
Sería la información de aquellos partners que no tienen valores faltantes en la base (aprox 25% de la base total) y sin hacer cálculos de ratios ni la transformación de las variables de encuestas. Este análisis permite visualizar una tendencia preliminar de correlaciones y a la vez, notar la notoria presencia de valores faltantes en la base.
Diágrama de correlaciones previo a transformaciones numéricas y sin hacer imputaciones de N/A:
 
A grandes rasgos, se concluye que hay variables muy correlacionadas entre si que pueden afectar la creación de los clústers como qty_picts y qty_products y la cantidad de encuestas relacionadas con el NPS.  También se observa que las variables cuantitativas estan correlacionadas positivamente con la variable ordenes emitidas, lo cual tiene sentido, ya que ha mayor cantidad de ordenes emitidas, mayor seran los triggers, sesiones, chats, rechazos y vouchers. 
Es importante a la hora de segmentar y clusterizar grupos, tomar acciones analíticas ante aquellas variables que esten muy correlacionadas entre sí.  Se buscaran variables que sean diferentes entre sí, incorrelacionadas,  que aporten al momento de la segmentación para la creación de los clusters. Luego en la interpretación de los mismos, se incluirán para caracterizar los grupos y evaluar relaciones. 
Con el fin que la información de las variables al momento de hacer la segmentación para clusterizar no sea redundante, se realizaron las siguientes transformaciones: 
Segmentación para las encuestas de NPS, que ahora serán presentadas en los siguientes niveles:
-	Si el NPS > 0 se definió como una encuesta positiva
-	Si el NPS < 0 se definió como una encuesta negativa
-	Si el NPS = 0 se definió como una encuesta neutra
Tener en cuenta que se estableció que los NPS cuyo dato era N/A se tomó como neutro (cero) dado que se consideró que el no contestar no significa algo negativo como positivo. 
Esto permitirá luego de definido los clusters, la identificación precisa del grupo de partners que tienen un mayor porcentaje de NPS positivo. 
 
En esta gráfica resumida de la variables NPS,  se observa que hay un gran campo para que la empresa avance en encuestas de satisfacción/valoración de forma de obtener un mayor feedback en la relación empresa – cliente. 
Con respecto a las variables altamente relacionadas con cantidad de ordenes, se decide la creación de los ratios por orden, lo cual permite nivelar y comparar partners con diferente antigüedad y volumen operacional.
Asi se transformaron las siguientes variables que estaban en cantidad acumulada histórica para pasar a estar en ratios por orden emitida: 
-	Triggers por orden
-	Chats por orden
-	Rechazos por oden
-	Sesiones por orden
-	Voucher por orden
Esta transformación permitio que la “nueva base” presente una menor correlación entre variables numéricas y que sea mas apta para clusterizar. 
Los resultados de las transformaciones de las variables númericas se muestran en el siguiente diágrama de correlación. 


Diágrama de correlaciones luego de transformaciones numéricas y con base completa:
 
Gracias a esta nueva transformación, las variables no presentan problemas de correlación y son aptas para una pre-selección para clusterizar. 
Luego de completada la base con la transformación de variables y la asignación de los valores faltantes, se procede al análisis gráfico. 
Se realizó un análisis específico en la variable rechazos por orden para entender como se distribuye y descifrar relaciones con el resto de las variables. 
Se llevó a cabo una segmentación en los siguientes niveles: 
- Partners con malos resultados: ratios de rechazos > a 2,5% por orden.
- Partners regulares en sus resultados: ratios en el rango de 1% a 2,5% por orden.
- Partners buenos en sus resultados operativos : menos de 1% de ratio por orden. 
En las siguientes tablas, se presentan datos comparativos de frecuencias en variables cualitativas y de valores de medianas en variables cuantitativas, para comparar resultados en dos grupos bien diferenciados de partners. “Rechazos Análisis” es una base de 110 partners que presentan ratios de rechazos por orden superiores a 2,5% mientras que “Rechazos Rest” sería el resto de la base con valores inferiores a dicho ratio.  Para que los resultados sean más representativos, se decidió acotar el análisis a aquellos partners que tengan más de 45 días de antigüedad en sus operaciones.

Tabla comparativa en Variables Operativas – Enfoque Rechazos
ANALISIS RECHAZOS
110 Partners	          1512 Partners
Rechazos Análisis       Rechazos Rest
  Variables Operativas	
  % Triggers por orden	3,96%	0,29%
	% Chats por orden	0%	0,12%
	% NPS Positivo	7,27%	3,90%
	% NPS Negativo	3,63%	3,90%
	% Sesiones por orden	1,01%	0,70%
	Accepts_pre_order = TRUE	82,70%	55,68%
	Response_time	2,78	1,922
	Delivery_time : Entre 15 y 30	19%	15,54%
	Actual_delivery_time	15,13	15
	capacity_check=TRUE	0,90%	16,53%

A nivel operativo, se puede concluir que la variable que tiene  más peso a la hora de los rechazos de ordenes son los triggers. Esta conclusión también se verifica en el diágrama de correlación en donde se puede visualizar correlación positiva entre las variables. 
Asimismo, se deduce que aquellos partners con mayor cantidad de rechazos, también son aquellos que no tienen límite de capacidad establecida.  Esto puede explicar gran parte de los rechazos de ordenes que deben hacer, al no tener un sistema de gestión y de previsión ante una posible escasez de productos.  

*Hipótesis contrastadas con análisis exploratorio:
“Un NPS positivo o negativo de por si solo no va a explicar cómo performa un partner. Se puede ser un Partner con NPS positivo pero tener una operativa con altos rechazos, cantidad relevante de triggers y manejo ineficiente de su gestión operativa”
En el análisis decriptivo del segmento “Rechazos Análisis” podemos ver que las encuestas de NPS no tienen un peso significativo a la hora de caracterizar eficiencias operativas de parnters. Los partners pertenecientes a este grupo tienen altos ratios de rechazos y pocas ordenes emitidas, no estan generando un valor diferencial a la empresa, sin embargo, sus niveles de NPS no difieren de los del resto de la base. 
“Los tiempos de preparación y entrega de pedidos no tienen alto impacto en rechazos como puede ser en la vertical restaurants”
Como observamos en los resultados operativos expuestos, los valores de las variables “actual_delivery_time”, “response time” y “delivery_time”, no presentan altas diferencias cuando realizamos la comparación entre grupos.
Se puede concluir que estas variables no son tan determinantes para considerar si un partner es clasificado como  “malo operativamente“ en esta vertical. O por lo menos, se puede deducir que los altos ratios de rechazos por orden, no se deben a dificultades en la preparación y entrega del pedido.
A diferencia de lo que si puede suceder en otras verticales de la empresa, como por ejemplo , en Restaurants. 
“Locales que presentan la funcionalidad de limite de capacidad tienen menos rechazos en sus ordenes frente a aquellos que no la tienen”
Como se observa en las tablas comparativas, el grupo de patnerns con alto ratio de rechazos por orden practicamente no presenta la funcionalidad de límite de capacidad. No tenemos información sobre las causas de los rechazos, no sabemos en definitiva si se deben a cuasas asociadas a limitantes y/o mala gestión de capacidad,  pero el análisis exploratorio es determinante y nos indica que a mayor es la probabilidad de tener la funcionalidad de capacidad, menor va a ser el ratio de rechazos por orden. 

Tabla comparativa en Variables Comerciales – Enfoque Rechazos 
ANALISIS RECHAZOS	110 Partners	1512 Partners
	Rechazos Análisis	Rechazos Rest
Variable
Comercial

	% Voucher por orden	4%	2,50%
	accepts_voucher = TRUE	82,70%	91,13%
	Has_Custom_Photo=TRUE 	0%	3,04%
	is_gold_vip = TRUE	0,90%	2,24%
	qty_products	48	117,5
	has_online_payment = TRUE	3,63%	95,30%
	Shipping amount = TRUE	77%	68,58%
	has_mov = TRUE	72,70%	75,72%


A nivel comercial, se nota la gran barrera para el desarrollo que es la imposibilidad de ofrecer pago online. También se visualiza una gran diferencia en los productos cargados en catálogo, lo cual da muestras clara que una escasez de variabilidad en la oferta genera falta de atracción en el consumidor final.



Tabla comparativa en Volúmen y antigüedad en días – Enfoque Rechazos 
ANALISIS RECHAZOS	110 Partners	1512 Partners
	Rechazos Análisis	Rechazos Rest
Volumen y antiguedad	Ordenes por mes	12,73	342,42
	Antiguedad en días	167,5	192,5
Aquí se concluye que los partners que tienen resultados operativas malos y que deben rechazar ordenes, tienden a tener una gran diferencia de ordenes emitidas frente a aquellos que operativamente son mejores.  Esto muestra que un alto ratio de rechazos en ordenes, atenta directamente contra el crecimiento y desarrollo de negocio del partner. 
Con respecto al análisis de la base en general (se adjuntan en anexo), se pueden detallar las siguientes conclusiones sobre los partners:
-	En su gran mayoría tienen logística a través de PedidosYa
-	Es habitual que tenga un monto mínimo de compra
-	La gran mayoría tienen pago online
-	Casi un 50-50 aceptan pre ordenes
-	Muy pocos tienen la funcionalidad de capacidad
-	En gran medida se cobra el envío
-	Delivery time es mayormente entre 30 y 45 minutos 
-	Los partners reciben en un 58% NPS positivo, 38% neutral y remanente 4% negativo
-	
MODELADO

Se tomo la base y se realizaron los siguientes procedimientos para evaluar qué modelo llevar adelante
-	Se sacaron de la base aquellas variables que no agregan valor al análisis como también aquellas donde una de sus etiquetas tenga una frecuencia mayor al 90% (se detalla en anexo).
-	Aquellas variables que estaban muy correlacionadas entre sí, no fueron consideradas en el grupo final para la segmentación, o fueron representadas por otras. 

Selección de variables para clusterizar: 

Las siguientes variables no fueron consideradas para la segmentación final por presentar frecuencias en una de sus etiquetas que ascendia a un 90%:
-	Is_logistic
-	Accepts_vouchers
-	Has_discount
-	Has_online_payment
-	Is_gold_vip
-	Has_custom_photo_menu

Otras variables fueron descartadas a nivel funcional:
-	NPS – Gracias al análisis exploratorio, verificamos que no parece ser una variable de peso a la hora de segmentar. 
-	Días de antigüedad: decidimos que los clusters se determinen por ratios operativos, y que la variable de antigüedad se utilice para la interpretación de los grupos. 

Variable	Tipo	Descripción
Delivery_time	Factor	Rango de tiempo prometido de entrega
Shipping_amount	Factor	Booleana - Si tiene costo de envío
Has_mov	Factor	Booleana - Si tiene valor mínimo de compra
Ordenes por mes	Numérica	Cantidad de ordenes promedio por mes por partner.
Response_time	Numérica	Tiempo promedio de respuesta
Accepts_pre_order	Factor	Booleana - Si acepta Pre-ordenes
Capacity_check	Factor	Funcionalidad de limite de capacidad.
Qty_products	Numérica	Cantidad de productos cargados en histórico por partner.
% Rechazos	Numérica	Porcentaje de rechazos por orden en el periodo de ventana de estudio.
% Triggers	Numérica	Porcentaje de triggers por orden en el periodo de ventana de estudio.
% Voucher_order	Numérica	Porcentaje de voucher por orden en el periodo de ventana de estudio.
% Sesiones	Numérica	Porcentaje de sesiones por orden en el periodo de ventana de estudio.
% Chats	Numérica	Porcentaje de chats por orden en el periodo de ventana de estudio.
Variables que fueron descartadas por su distribución estadistica: 
-	actual_delivery_time fue descartada por tener distribución uniforme, no tiene estructura para clusterizar.


Pre – Selección de variables para la segmentación



Como se puede visualizar en la gráfica, se logró una preselección de variables mixtas que pueden determinar el tipo de algoritmo a usar. 
Algunos algoritmos no soportan variables cualitativas pues se basan en calcular distancias. Para ello, se deberia crear una matriz de distancia en las observaciones. 	










Preselección de algoritmos: 

A priori se pensó en dos algoritmos que podrían representar de forma eficiente la segmentación de los partners.

-	KMEANS
-	KMEDOIDS


KMEANS: 

Kmeans es un algoritmo que destaca por su sencillez y velocidad de computo. Requiere que se indique de antemano la cantidad de clusters que se van a crear. 
Tiene la gran desventaja que no soporta variables cualitativas, pues se basa en calcular distancias por medio de la distancia euclidea. El agrupamiento se realiza minimizando la suma de distancias entre cada objeto y el centroide de su cluster. 

Kmeans tiene como objetivo la partición de un número N de observaciones en k grupos, en donde cada observación pertenece al grupo cuyo valor medio es más cercano. 

Ante estas características, surgen dos pasos a cumplir para preparar la base para clusterizar: 
-	Selección de las variables numéricas dentro de la preselección de variables detallada anteriormente. 
-	“Capping” – También llamado “techo” a las variables numéricas que presenten problemas de outliers (la gran mayoría). Para solucionar esta situación se realizó una función que aplica un corte a todos los outliers que superen 3,5 rangos intercuartilicos los Cuartiles Q1 y Q3. (en ambas direcciones). 
-	Esta técnica de “capping” se realizó con el propósito de mitigar efectos indeseados en la estandarización de la base. (ya que en la estandarización interviene la media, y dicho valor esta influenciado por outliers). 

Luego de realizada la estandarización de las variables numéricas, se procedió a aplicar métodos que busquen la cantidad óptima de clusters que minimicen la distancia intra-cluster. 

En la siguiente gráfica vemos el método “Silueta” para el algoritmo Kmeans, que a priori, no representa muy buenos resultados con una silueta que no supera el 0,2. 
Tampoco queda muy definida la cantidad óptima de clusters, que puede estar entre 4 y 6 cluster.

















Métrica Silueta para Kmeans:

 


Como los indices promedio de Silueta no eran muy alentadores, se decide probar con Kmedoids que a diferencia de Kmeans, es un algoritmo que si acepta variables de data mixta y es robusto a outliers. 

KMEDOIDS:

A diferencia de Kmeans, Kmedoids tiene ciertas características alentadoras para el caso en estudio.  
-	robusto a outliers, por lo tanto, no se considera necesario realizar técnicas de “capping”
-	los centros de los clusters son representativos ya que son observaciones en si mismas
-	permite trabajar con distancias de todo tipo, y variables de entrada de cualquier formato
-	encuentra una solución óptima local

Para la utilización de este algoritmo, se llevaron acciones similares que en kmeans, excepto por el tratamiento de outliers. 

-	Estandarización (escalabilidad) de las variables numéricas para poder realizar un análisis comparable numéricamente
-	Se realizó matriz de distancias Daisy para las variables mixtas con método “Gower”.
-	Prueba de Hopkings fue realizada de dicha matriz para en definitiva entender si la base tiene o no estructura para clusterizar. El resultado: 96% por lo cual se concluye que existe estructura.



Métrica Silueta para Kmedoids:

 

Como se puede visualizar en la gráfica, el indicador Silueta en Kmedoids es bastante superior al de kmeans. 
He aquí una de las razones por las cuales se optó por el algoritmo de kmedoids. 
El coeficiente de Silueta es una métrica que representa que tan bien agrupados estan los datos para cada algoritmo. Se puede concluir que en kmedoids la calidad del agrupamiento obtenido es mayor que en kmeans, y debido a eso es que se decidió la elección del algoritmo.  


Realizado el análisis de clúster óptimos, el algoritmo recomendó realizar 6 clústers, pero se tomó una decisión estratégica (dado que entre 4 y 6 no había prácticamente diferencias), de optar por presentar 4 clusters con una silueta general de 0,43 siendo un buen indicador con clusters con volúmenes de datos. 


 

En la representación gráfica ya se pueden diferenciar tamaños de clusters, a priori, el cluster 3 es el que tiene menor cantidad de partners. 


Los 4 clústers arriba representados fueron impactados en la base de datos transformada para así identificar a cada partners dentro de cada cluster. Esto  permitió realizar una visualización grafica de los principales drivers identificados para cada clústers.


Dado este modelo, se detectaron de cada clúster que existen 4 tipos de partners


-	Minimarkets –  (504 Partners) : tiendas de almacén de barrio o pequeñas cadenas. Pueden ser farmacias también. Poca escala con bajo nivel de inversión de tecnología a la empresa siendo compañías básicamente familiares o unipersonales.
-	Tiendas específicas (655 Partners) :son locales comerciales dentro de la vertical markets que no venden “commodities” como arroz, leche, quesos, sino que ofrecen un producto diferencial como puede ser; comida/ingredientes sin gluten, pasta casera, masas finas. Son tiendas muy segmentadas.
-	Grandes superficies (221 Partners) : básicamente grandes tiendas de supermercados como puede ser Grupo Casino, así como también tiendas gastronómicas como Kinko o Frog.
-	Nuevos socios (482 Partners): este cluster esta formado en su mayoría por partners que han ingresado recientemente a la empresa.  Al menos el 50% de los partners de este grupo no superan los 3 meses de antigüedad, y comparten perfiles similares en cuanto a sus problemas operativos, logísticos y características comerciales. 














Boxplots de Variables Numéricas filtradas por Cluster

 



Estas gráficas boxplots permiten visualizar distribuciones de las observaciones filtradas por Cluster. 
A grandes rasgos se puede visualizar que el Cluster 3 tiene mayores distribuciones (dispersiones de datos) en las siguientes variables: ordenes por mes, chats y cantidad de productos cargados. También se concluye que los valores de las medianas en el cluster 3 (es decir el 50% de las observaciones) son mayores en chats, ordenes, productos, y menores en tiempo de respuesta por orden en relación al resto de los clusters. A grandes rasgos, se puede concluir que el cluster 3 es donde se encuentran los partners que tienen mejores resultados operativos. 









A continuación mostramos un cuadro resumen de los meroides en las variables más importantes a nivel funcional de la base. 

Interpretación de meroides  - Centros de Clusters

VARIABLES	Mini- markets	Tiendas Específicas	Grandes Superficies	Nuevos Socios
ID - Meroide	1619	22142	2971	22166
Cant. Partners	504	655	221	482
Rechazos	0,36%	0,92%	0,13%	0,60%
Triggers	0,60%	0,76%	0,04%	0,45%
Capacity Check	FALSE	FALSE	TRUE	FALSE
NPS	NEUTRAL	POSITIVO	POSITIVO	NEUTRAL
Aceptan Pre-ordenes	TRUE	FALSE	TRUE	TRUE
Sesiones	0,60%	0,38%	1,16%	1,90%
Costo de envio	TRUE	TRUE	FALSE	FALSE
Qty_products	64	34	5309	65
Voucher_order	2,60%	1,92%	0,90%	4,20%

Debido a que kmedoids trabaja directamente con observaciones, se puede concluir que los centros de los clusters son representativos. Por lo tanto, se procedió a impactar los meroides en la base para determinar que partners eran los más representativos de cada cluster. 

Vemos que las principales diferencias se dan en las variables capacity_check, voucher por orden y cantidad de productos cargados por partner.  

 
Asi vemos la distribución en  términos de ordenes por mes sobre el total de ordenes de la base: 

Cluster 1:  20,9% 
Cluster 2:  13,81%
Cluster 3:  50,19%
Cluster 4:  15,02%

Claramente el cluster 3 es el de las grandes superficies y que más volumen operacional tiene. 
El resto de los clusters parecen tener números similares en ordenes vendidas, con la advertencia de realizar un análisis específico en los partners del cluster 2 que son los que tienen menor volumen de operaciones. 







El siguiente cuadro comparativo combina medidas de medianas en variables cuantitativas y de frecuencias en variables cualitativas: 

VARIABLES	Mini- markets	Tiendas Específicas	Grandes Superficies	Nuevos Socios
Cant. Partners	504	655	221	482
Aceptan Pre-ordenes	100%	0%	100%	80,90%
Sesiones	0,80%	0,60%	1,30%	0,80%
Costo de envio = TRUE	100%	90%	39%	0%
Qty_products	110	75	4375	77
Voucher_order	2,50%	2,2%%	1,4%%	4,17%
Has_mov = TRUE	84,30%	66,00%	92,30%	77,00%
Es Gold VIP	2,4%	0,3%	6,4%	1,7%
Delivery PEYA	95,5%	88,2%	99,5%	97,9%
Capacity_check = TRUE	9,30%	0,00%	100,00%	0,00%
ORDENES	248,8	204,5	2316	263,257
Antiguedad - Días	124	305	155	86

*se siguen obteniendo conclusiones a través de mediciones de medianas ya que las variables numéricas estan influenciadas por outliers.


Características GENERALES de los clústers detectados

Cluster 1 - Minimarkets
-	Bajo nivel de positividad de NPS 
-	Manejo de pre ordenes
-	Clientes utilizan voucher asociado
-	Baja/prácticamente nula funcionalidad de capacidad
-	Aceptan pagos online
-	Manejan un buen nivel de ordenes por mes de casi 250
-	Hacen su delivery a través de PedidosYa
-	Representan al 20% de las ordenes de la vertical





Cluster 2 - Tiendas Especificas

-	Cuentan con un alto nivel de NPS Positivo
-	 No manejan pre ordenes dado que tienen una oferta muy específica que se adapta al cliente. No venden productos que se encuentran fácilmente en otras tiendas
-	En base a lo anterior, no manejan la funcionalidad de capacidad
-	Muy baja/nula publicidad Gold VIP
-	Un 40% de los partners no exige compra mínima 
-	Menor uso de delivery de PedidosYa con menos del 90%
-	Generan un 13% de las ordenes de la vertical
-	Son el grupo que tiene menos productos cargados en su catálogo, esto lo relaciona con su especificidad. 
-	A rasgos generales, parece ser el cluster con peores indicadores de calidad


Cluster 3 - Grandes Superficies
-	Bajo nivel de triggers por orden de incumplimiento
-	NPS Positivo más alto 
-	Todos aceptan pre ordenes como también manejan funcionalidad de capacidad
-	El 70% usa pago en línea, el restante otros métodos
-	Maneja 10 veces mas pedidos que el resto de los clústers, con una mediana de 2316 ordenes por mes. Representan al 50% de las ordenes de la vertical. 
-	Hace su delivery por PedidosYa
-	Parece presentar eficiencia operativa
-	Maneja alta cantidad de productos en sus catálogos
-	Presenta buenos indicadores de calidad del servicio prestado


Cluster 4 - Nuevos socios
-	Alto ratio de rechazo vs el resto de los comercios
-	Presentan ratios más alto de triggers por orden de incumplimiento en comparación con otros grupos, ya que están comenzando a operar recientemente en la plataforma y son inexperientes. 
-	Un NPS positivo que apenas alcanza el 40%
-	Muchas ordenes por voucher asociado 
-	No manejan al momento la funcionalidad de capacidad
-	No tienen costo de envío
-	Son inexperientes, recien llegados en su mayoria en el último trimestre del año.
-	Generan 15% de las ordenes de la vertical 
-	Tienen alto ratios de sesiones 







*Hipótesis contrastadas con análisis descriptivo de clusters:
“La gestión operativa en grandes superficies no debería traer aparejado altos ratios de rechazos por ordenes ni triggers”.
Esta hipótesis se valida al análizar la variable rechazos en relación a la formación de los clusters, se observa que el cluster 3 de las grandes superficies, solo tiene un partner que pertenece a la etiqueta “Malos_op”(ratio de rechazos > 2,5%).  
 
Como indica la gráfica de barras, el grupo de partners que pertenecen al cluster 3 (grandes superficies) es aquel que tiene un menor ratio de rechazos por orden.  
Resumen de partners con rechazos > 2,5% : 110 partners
Cluster 1 =  27 Partners que equivalen a un 5,3% del Cluster.
Cluster 2 = 53 Partners que equivalen a un 8,09% del Cluster.
Cluster 3 = 1 Partner que equivale al 0,45% del Cluster. 
Cluster 4 = 29 Partners que equivalen a un 6% del Cluster. 
“El costo de envio repercute en la cantidad de ordenes solicitadas, en consecuencia, partners considerados “nuevos” tienden a no tener costo de envio para procurar posicionarse velozmente en el mercado.”
Esta hipótesis se valida al analizar el cluster llamado “nuevos socios” donde vemos que la mayoría de los partners pertenecientes a este grupo, son nuevos ingresos en la plataforma, con una antigüedad en un 50% de casos que asciende a 3 meses. También se observa que este grupo de asociados no tiene costo de envío en sus pedidos, por lo tanto se deduce que tienen la intencion de posicionarse en el mercado en el corto plazo. Asimismo, el alto ratio de vouchers por orden emitida es un indicador que contribuye a esta caracterización. 

EVALUACIÓN Y CONCLUSIONES GENERALES
En primer lugar, quedaron segmentados los partners por el tipo de negocio o su comienzo de operaciones con PedidosYa. 
Tener en cuenta que en esta vertical no tiene un alto impacto el tiempo de demora del delivery, a diferencia de la vertical de restaurantes donde el consumidor requiere la inmediatez de su pedido y exige celeridad. En este caso, el producto que se brinda si demora más de lo estipulado a priori no tiene un alto impacto negativo como en la vertical anteriormente comentada.

Recomendaciones :

Grandes superficies

-	En cuanto al rendimiento operativo, trabajar en las causas que llevan a un alto ratio de chat por orden.  Se toma por supuesto que en la mayoría de los casos, las consultas en los chats se deben a información sobre la entrega del pedido. 
-	Sugerencia: implementar chatbots de respuesta automática para este tipo de consultas, y asi también reducir carga operativa. 
-	Se deduce que el 30% de los partners de las grandes superficies que no tienen método de pago online tienen menor cantidad de ordenes emitidas en relación a aquellos que si lo tienen. 
o	Sugerencia: dar a conocer al partner los motivos del porque los métodos de pago online son importantes para su crecimiento (mostrar diferencias en resultados de ordenes emitidas por aquellos que tienen pago online vs aquellos que no lo tienen). 

o	Concluimos que los catalogos que tienen mayor cantidad de fotos hacen de un perfil mas amigable y llamativo a nuestros clientes para poder comprar lo que necesitan e incluso otros productos del catálogo que no tenían presente, generando mayor revenue para PedidosYa. 
o	Implementar una herramienta de autogestión para que el partner pueda manejar toda la información de sus productos y su catalogo de fotos. 
Nuevos partners

-	Sus inicios en la aplicación implican tener problemas operativos que derivan en rechazos, contando con triggers de incumplimiento, sin funcionalidad de capacidad generando así un NPS que es de los más bajos. 
o	Sugerencia: desarrollar un equipo de onboarding, generar un centro de ayuda para los partners, brindarle herramientas al partner para que pueda autogestionarse en la aplicación.
El beneficio se dará tanto para este nuevo socio como también para la compañía al generar nuevos clientes con buena performance.
Para sus primeros meses en la aplicación, trabajar en campañas de marketing para subisidiar pedidos con voucher y asi generar una experiencia positiva con el partner.  



Tienda Especializada

Incentivar al partner a que presente un catálogo con mas fotos y productos cargados. 
 Generar una categoría especifica dentro de la aplicación para poder darle mayor visualización a este tipo de partners. 	

Minimarkets

-	Capacidad de funcionalidad en este tipo de tiendas es fundamental no solo para ofrecer un buen servicio sino para no generar errores a la hora de iniciar y aceptar la orden.
o	Sugerencia: Brindarle información al partner de las ventajas de tener una funcionalidad de capacidad que le permita administrar su catálogo de forma más eficiente dando altas y bajas de producto cuando se requiera y asi evitar triggers. 
o	Debido al bajo NPS: Hacer sentir al partner parte del proceso de crecimiento dentro de la aplicación. Generar entrevistas, encuestas de satisfacción, brindar material de apoyo y mantenerlo actualizado de las nuevas funcionalidades. Asumimos que estas técnicas estimularán un crecimiento en el porcentaje positivo de NPS en esta categoría de partner. 
Partners “target” 
Para un análisis más específico de los clusters, se decide hacer un filtro para localizar aquellos partners con niveles operativos deficientes de forma de poder intepretarlos, obtener conclusiones y realizar accionables para su recuperación a corto plazo. 
Luego de segmentado este grupo, se le enviará el listado de partners “target” a los distintos departamentos de la empresa para que se realice el seguimiento específico para que ellos puedan desarrollarse y ser autosustentables. 
Enfasis en ratios de rechazos: 
Al hacer enfásis en el grupo de partners que presentan altos ratios de rechazos, se intentará descifrar si existen relaciones ocultas en los datos que contribuyan a un mal performance. 
Para segmentar el grupo a estudio se filtrará por las siguientes características: 
-	40 > Antigüedad en días < 150 : Con este filtro se procura centrarse en aquellos que ya tengan su negocio en marcha, con al menos un mes y medio de gestión operativa y que hayan ingresado en epoca de pandemia. 
-	Ratio rechazos > 1% : Se busca aquellos que presenten problemas operativos, y se parte del supuesto que aquellos con ratios superiores a 1% son considerados “regulares - malos operativamente”
-	Ordenes por mes < 300 : Con este filtro se busca acotar el numero de partners a aquellos que no pertenecen a las grandes superficies, que son relativamente nuevos y que seguramente necesiten asesoramiento para que puedan generar buenas experiencias para los usuarios. Ya que al tener rechazos, estan generando malas experiencias en el consumidor final y esto afecta la imágen de la empresa. 	
Resultados -- Se obtuvo una nueva base de análisis de 122 partners que se compone de: 
-	53 partners del Cluster 1 (Mini – markets)
-	12 partners del Cluster 2 (Tiendas Especificas)
-	5   partners del Cluster 3 (Grandes Superficies)
-	52 partners del Cluster 4 (Nuevos Socios)
Re-activar este conjunto de partners deberia sería el público objetivo de Peya a corto plazo con el cometido final de que estos partners sean autosustentables. 
La idea de esta nueva segmentación es encontrar drivers que expliquen o se asocien a altos ratios de rechazos. 
Tabla comparativa de frecuencias y medianas en Cluster 1
		53 Partners	 111 Partners
ANALISIS RECHAZOS - Cluster 1	Mini - Markets
	Rechazos > 1 %	Rechazos < 1%
Variables 	% Triggers por orden	1,37%	0,21%
	% Rechazos 	1,91%	0,17%
	% Chats por orden	0%	0%
	% NPS Negativo	0,00%	3,60%
	% Sesiones por orden	1,21%	1,25%
	Response_time	2,34	1,89
	Qty Products	68	49
	Has_Mov 	86,00%	84,50%
	Dias de antiguedad	86	95
	Costo de Envio	100%	100%
	ordenes por mes	38	96
	Accept_pre_order	100%	100%
	Voucher_order	4%	3,06%
	capacity_check=TRUE	0,00%	12,50%
Dato: 15,4% de los partners de este cluster presentan ratios de rechazo > 1% por orden. 	
Se comparan medianas y valores más frecuentes de partners que pertenezcan al mismo cluster, con las mismas caracteristicas de ordenes (tope 300 por mes) y en la misma ventana de tiempo, para descifrar si se pueden realizar asociaciones.
Se puede observa que la gran diferencia en los grupos son la cantidad de ordenes por mes.
Se puede concluir que altos ratios de rechazos estan relacionados con partners con baja cantidad de ordenes.  Si se encuentran las causas de los rechazos, el partner podra mitigar errores, desarrollarse, ser autosustentable y consiguientemente, venderá más ordenes. 
Los triggers de incumplimiento presentan alta correlación con los ratios de rechazos, por lo tanto es una de las situaciones que más se deben atacar. Tambien resta indagar sobre las causas de los triggers para poder enfrentar el problema con mayores herramientas. 
El NPS y los chats no parecen ser factores relevantes para que un partner tenga alto ratios de rechazo en sus ordenes en este cluster. 
Un aspecto a destacar es la funcionalidad de capacidad que ciertos partners de este cluster tienen en su sistema de gestión. Mediante el análisis de valores de medianas se puede comprobar que los partners que tienen gestión en su limite de capacidad, tienden a tener menores ratios de rechazo. Por lo tanto, una buena acción operativa sería que los partners de esta vertical accedan a la funcionalidad de capacidad. 
Con respecto a las observaciones pertenecientes al Cluster 2 y 3, se entiende que al ser muy pocas observaciones, es dificil encontrar conclusiones determinantes al momento de comparar grupos malos vs buenos operativamente.  
Con respecto a los partners del Cluster 3 que presentan alto ratio de rechazo, se decide dado que son 5 partners, realizar un seguimiento semanal de los indicadores operativos y resultados.
Dato: 5,8% de los partners del cluster 3 presentan ratios de rechazo superiores a 1%. 
Tabla comparativa de frecuencias y medianas en Cluster 4
		52 Partners	75  Partners
ANALISIS RECHAZOS - Cluster 4	Nuevos Socios
	Rechazos > 1 %	Rechazos < 1%
Variables 	% Triggers por orden	1,56%	0,4%
	% Rechazos 	2,19%	0,32%
	% Chats por orden	0,00%	0%
	% NPS Negativo	5,80%	2,70%
	% Sesiones por orden	0,73%	0,81%
	Response_time	2,9	2,16
	Qty Products	56	43
	Has_Mov 	69%	73%
	Dias de antiguedad	74	85
	Costo de Envio	0%	0%
	Pago Online 	100%	98,7
	ordenes por mes	31	106
	Accept_pre_order	94,20%	90%
	Voucher_order	6,35%	4,6%
	capacity_check=TRUE	0,00%	1,30%
Dato: 22,4% de los partners de este grupo presentan ratios de rechazo > 1% por orden. 
En este grupo de partners se presentan grandes diferencias en las ordenes de venta. Por lo tanto acciones efectivas que mitigen rechazos, serán importantes para emitir más ordenes. 
El obejtivo de nuestros accionables son generar herramientas de autogestión para que el partner pueda desarrollarse por si solo. Los equipos de onboarding brindarán herramientas de información y soporte cuando lo fuese necesario, pero es el partner quién debe valerse por si mismo.
PedidosYa brindara las herramientas necesarias para que el partner tenga oportunidad de mejora. Y cuanto más independiente y autosustentable sea el partner, menores serán los recursos empleados por la empresa.
Accionables para Partner Target: 
Elaborar un panel de control de reporting que haga seguimiento de ratios para esta cartera de partners y que incluya: 
Metas // Rendimiento operativo : 
-	Porcentaje de pedidos rechazados por el local en la última semana, con la meta de bajar del 1% por orden.
-	Porcentaje de pedidos rechazados por el consumidor final en la última semana con la meta de bajar del 1% por orden. 
-	Tiempo de respuesta : Bajar tiempos de respuesta. Implementar un ranking de velocidad de respuesta.
-	Información en promedios y gráficas comparativas de rendimiento operativo semanal en terminos de pedidos, facturación, ticket promedio
-	Información resumida sobre las causas de los rechazos en ordenes. Así de esta forma el partner puede anticiparse a futuros problemas en pedidos rechazados. 
-	Información resumida acerca de los motivos sobre los cuales ha solicitado ayuda en linea, para que de esta forma, el partner pueda aprender sobre sus propios errores 
Metas // Rendimiento comercial:
-	Productos más solicitados durante el mes, con información de tiempo y hora en que fueron solicitados. 
-	Perfiles de usuarios compradores para caracterizar el cliente final. 
-	NPS: mejorar encuestas / valoración / puntuación y ofrecer información de cómo lograr altos niveles de NPS.
-	Establecer metas comerciales de incorporar nuevas fotos de productos de forma semanal y ofrecer información al respecto de cómo hacerlo. Meta : 8-10 fotos por semana. 
De Información // Centros de ayuda:
-	Información acerca de los beneficios del pago online, como funciona y como se pone en marcha. Ventajas frente a competidores que no lo tienen. 
-	Información sobre las ventajas de tener buenos indicadores operativos.
-	Información sobre la editación, incorporación y modificación de productos en linea en el catálogo, para así poder manejar su herramienta de gestión con mayor celeridad, y no presentar problemas de límite de capacidad.
-	Información sobre la activación / desactivación de productos en linea para mitigar el ratio de triggers. Ya que así el partner evitaría tener problemas de escasez de productos en linea.


















ANEXOS
Diccionarios de variables: 

 
variables	Descripción (datos desde Agosto 2020 a Enero 2021)	 
restaurant_id	Identificador de cada partner	 
business_name	Tipo de negocio: Restaurante, Market, Coffee, Shop, etc	 
accepts_vouchers	Booleana: Local acepta voucher	 
cant_pasivos	Cantidad de encuestas Pasivos en histórico.	Agregado
cant_detractores	Cantidad de encuestas Detractores en histórico.	Agregado
cant_promotores	Cantidad de encuestas Promotores en histórico.	Agregado
actual_delivery_time	Tiempo promedio de delivery	Promedio
vendor_late	Porcentaje de órdenes entregadas tarde por parte del partner (más de 10 minutos) al rider.	Promedio
delivery_time	Rango de tiempo prometido de entrega.	Promedio
shipping_amount	Booleana: Costo de envío.	 
has_discount	Booleana: Acepta descuentos.	 
has_mov	Booleana: Tiene valor mínimo de compra.	 
has_online_payment	Booleana: Acepta pago online.	 

is_gold_vip	Boleana: Es un partner patrocinado.	 
has_custom_photo_menu	Booleana: Tiene fotos reales en menú.	 
ordenes	Cantidad de órdenes totales en histórico.	Agregado
response_time	Tiempo promedio de respuesta (tiempo que ocurre entre la realización del pedido y la confirmación o rechazo de la orden)	Promedio
accepts_pre_order	Límite de órdenes que puede recibir un local en determinado tiempo)Booleana: El local acepta pre órdenes.	 
capacity_check	Booleana: El local tiene la funcionalidad de capacidad (aplica para Groceries. Límite de órdenes que puede recibir un local en determinado tiempo)	 
year_first_order	Año de primer orden	 
month_first_order	Mes de primer orden	 
qty_picts	Cantidad de fotos cargadas en histórico.	Agregado
qty_products	Cantidad de productos cargados en histórico.	Agregado
rechazos	Cantidad de órdenes canceladas o rechazadas.	Agregado
triggers	Cantidad de triggers.	Agregado

voucher_order	Cantidad de órdenes con voucher asociado.	Agregado
is_logistic	Booleana: El partner tiene delivery a cargo de PEYA.	
cahts	Cantidad chats asociados a alguna orden.	Agregado
sesiones	Cantidad de sesiones asociadas al partner,  generadas en el período por los usuarios al acceder al centro de ayuda	Agregado

6

PedidosYa © 2020
PROJECT TIMELINE

  Presentación de caso: 11/02/2021                            2do punto de control: 11/04/2021
 



1er punto de control: 14/03/2021    3er punto de control: 09/05/2021   Entrega final:27/05/2021

















Boxplots de variables cuantitativas en la base:
 






















NIVELES DE NPS POR CLUSTER

 



Costo de Envio en Clusters

 








Accepts pre orden en Clusters

