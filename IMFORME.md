# Medición de nivel de líquido
Proyecto basado en https://www.hackster.io/team-protocentral/liquid-level-sensing-using-a-laser-tof-sensor-d04232?ref=similar&ref_id=19764&offset=2

# Docente:
Ing. Paulo Chiliguano.

# Integrantes
- Guillen
- Salazar
- Zambrano

# INFORME

## 1 Introducción 
En el presente informe damos a conocer las caracteristicas de los avances del proyecto __"medidor de nivel de líquido en arduino"__
que se realizaron durante la semana hasta la presente fecha.

### 1.1 Objetivos
* Analizar el código referente al lenguaje arduino del __"medidor de nivel de líquido"__ para entender su funcionamiento
* Desarrollar una interface de usuario para la interacción del circuito con el ordenador por medio del Processing
* Implementar la interface de usuario en el circuito construido en arduino

### 1.2 Materiales
1. Arduino
2. sensor ultrasonido HC-SR04
3. potenciometro
4. sensor medidor de agua
5. led's rojo verde amarillo

## 2 Caracteristicas del avance

### 2.1 primera fase
1. Mediante el módulo arduino y el sensor podemos conocer el nivel de un líquido que hay en un recipiente. Se puede observar en la
   gráfica las conexiones del sensor y el módulo arduino.
       
   ![imagen 1](http://www.prometec.net/wp-content/uploads/2014/10/Sesion-26_2.jpg)
      
2. Al momento no se ha podido comprobar con el sensor que se encuentra en la imagen así que las pruebas pertinentes se las está
   realizando con un potenciómetro como se muestra en la imagen.
   
   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15749775_1273751492663602_1159116574_n.jpg?oh=cdd5ae6f0848f8d1b96f67f78b861a62&oe=587A9315)
   
3. El  software que se está utilizando para programar la interfas de usuario es Processing que nos muestre la gráfica del nivel de agua
   que se encuentra en el recipiente el cual tendrá sus respectivas mediadas 
   
   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15909963_695239973980499_1584697272_n.png?oh=d1ff6b423c040aff322d368b8165d83d&oe=5879A318)
   
### 2.2 segunda fase
1. se adquirio el sensor de nivel de liquido
2. Se realizaron las pruebas con el sensor ya implemetado en el circuito
3. Luego de las pruebas se llego a la conclusión que el sensor tenia una desventaja la cual es que no mide con exactitud los valores que
   necesitamos y que el área de medición es limitada a 4 cm.
   
### 2.3 fase final (Resultados)
1. En esta ultima fase se dará a conocer como quedó el proyecto mostrando sus caracteristicas y funcionalidades
2. Pantalla de inicio

   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/16111178_695238080647355_205695102_n.png?oh=47073d6c648498bc902dc6322f38c5da&oe=587A7BD0)

3. Pantalla donde se observara el nivel de llenado de un recipiente

   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15978737_695219270649236_697554364_n.png?oh=93d4fd1204174d178f19d256be108c21&oe=58797E08)

4. Pantalla con la gráfica y su respectiva barra para indicar en qué nivel esta y un indicador en la parte superior central donde
   muestra los valores en forma de digito 
   
   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/16111411_695219487315881_1983323394_n.png?oh=6b5fcbaf68c1123ba6eaf0b3e143e721&oe=5879957F)

5. Si se excede le límite de llenado avisara mediante un anuncio que el líquido ha llegado a su límite 

   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15978660_695219710649192_1049406707_n.png?oh=4eaaef8da8ce6b14417ec2d9f11b6093&oe=587A9213)

6. Diagrama de conexiones para el HC-SR04 y arduino
   * El siguiente circuito es el mínimo necesario para hacer funcionar el sensor ultrasonido HC-SR04 y Arduino. Podemos utilizar cables
     Dupont o bien utilizar un protoboard y alambres.
   * Cabe aclarar que se han utilizado los pines 6 y 7, pero funciona cualquier otra combinación de pines. No hay mucho más que
     decir, ya que es bastante fácil de conectar, solamente tener cuidado con la polaridad y posición de las señales.
     
     ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15978703_695219800649183_442655180_n.png?oh=6c81df1396e1446de24167903085f00e&oe=587A8EF8)
     
7. Conceptos Básicos.
   * Primero debemos armar el circuito de prueba para el sensor, el cual consiste únicamente en proveer alimentación al módulo y
     asignarle 2 pines de interfaz con el Arduino (echo y trigger). Este tipo de módulos para medición de distancia por ultrasonidos se
     divide en 2 grandes grupos: Interfaz mediante pulso de eco e interfaz serial (I2C o UART). El HC-SR04 cae dentro del primer grupo,
     por lo que explicaremos su funcionamiento brevemente en las siguientes líneas.
     La interfaz digital se logra mediante 2 pines digitales: el pin de trigger (disparo) y echo (eco).
     * El primero recibe un pulso de habilitación de parte del microcontrolador, mediante el cual se le indica al módulo que comience a
       realizar la medición de distancia.
     * A través de un segundo pin (echo) el sensor “muestra” al microcontrolador un pulso cuyo ancho es proporcional al tiempo que tarda
       el sonido en viajar del transductor al obstáculo y luego de vuelta al módulo.
  * Mediante una sencilla formula puede estimarse entonces la distancia entre el sensor y el obstáculo si se conoce el tiempo de viaje
    del sonido así como la velocidad de propagación de la onda sonora. La siguiente imagen muestra los pulsos recibidos y enviados por
    el sensor, de acuerdo a la hoja de datos elaborada por Itead Studio.
    
    ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15978137_695219840649179_660101128_n.png?oh=69b360d7c9dd28c8d600556366272eb2&oe=587A591C)

  * Como se puede observar, el HC-SR04 genera un pulso en el pin marcado como “echo” cuya duración es proporcional a la distancia medida
    por el sensor. Para obtener la distancia en centímetros, solamente debemos dividir el tiempo en microsegundos entre 58 o para
    obtener la distancia.
    
8. En el circuito se puede observar tres led's los que tienen la funcion de alertar en que nivel se encuentra bajo medio o alto
   
   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t35.0-12/16106119_1301158019922949_243741239_o.jpg?oh=2954c6ebec4d39237ecb2647eae6378e&oe=587A8C70)

9. Por ultimo se muestra el circuito implemetado con el recipiente para su respectiva medición

   ![](https://scontent.fuio1-1.fna.fbcdn.net/v/t34.0-12/15978666_1301158059922945_1974727419_n.jpg?oh=1cb3c36a43be5774561e9a0b078bd620&oe=58798AD5)

  

   
