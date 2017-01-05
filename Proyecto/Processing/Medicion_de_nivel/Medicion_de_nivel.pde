import processing.serial.*;
Serial port;
color c = color(100);
float datos = 0;
int Xpos;             // horizontal position of the plot.
int Ypos;             // vertical position of the plot
int estado;
int lastXpos;         // last x coordinate
int lastYpos;         // last y coordinate
PImage Fondo;

import controlP5.*;

int uX,uY,Contador;
Button ObjetoBoton;
Button Objeto;
ControlP5 Cp5;


void setup()
{
  
  size (1350,700);
  
  Fondo=loadImage("IMAGEN.png");

  port = new Serial (this,"COM10", 9600);
  port.bufferUntil('\n');
  Xpos = width+1;
  estado=-1;
  Contador=1;
  orientation(PORTRAIT);
 
  uX=width/18;
  uY=height/32;
  Cp5=new ControlP5(this);
  ObjetoBoton = Cp5.addButton("Boton").setPosition(500,8)
                                      .setSize(90,30)                                                  
                                      .setColorActive(color(255,255,255));
  ObjetoBoton.setColorBackground(color(255,120,120))
  .setColorForeground(color(255,80,80))
  .getCaptionLabel()
  .setFont(createFont("",20))
  .toUpperCase(false)
  .setText("Iniciar")
  .setColor(color(0,0,255));
  Cp5.getController("Boton").getCaptionLabel()
  .align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);
  
  Cp5=new ControlP5(this);
  Objeto = Cp5.addButton("Parar").setPosition(1000,8)
                                      .setSize(90,30)                                                  
                                      .setColorActive(color(255,255,255));
  Objeto.setColorBackground(color(255,120,120))
  .setColorForeground(color(255,80,80))
  .getCaptionLabel()
  .setFont(createFont("",20))
  .toUpperCase(false)
  .setText("Parar")
  .setColor(color(0,0,255));
  Cp5.getController("Parar").getCaptionLabel()
  .align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);  
  
}

void draw()
{
 
  if (estado !=-1){
    fill(c);
    rect(600,20,90,70);
    fill(255, 0, 153);
    int numero=int(datos);
    textSize(20);
    text(numero+"mm",600,80);
}
 int altura=585;
 int inicio=110;
   if (estado != -1) {
  
    float inData =(datos); 
    inData = map(inData, 0, 400, 43, altura); //datos de la escala de tamaño de pantalla
    Ypos= int(height-inData);
 
    if (Xpos > width) {   // Iniciar
        image(Fondo,0,0);   // Borrar pantalla
      Xpos = inicio;           // Inicio de la barra estadistica
      lastXpos= Xpos;     // x position of first point
      lastYpos= Ypos;     // y position of first point
    }
 
   stroke(25,34,255);     //color de figura
    strokeWeight(2);        // tamaño de figura
    line(lastXpos, lastYpos, Xpos, Ypos);
      
    lastXpos= Xpos;
    lastYpos= Ypos;
 
   Xpos++; 
}

}

public void Boton()
{
    
 if(Contador==1)
 {
   estado=2;

 }
 
}

public void Parar()
{
    
 if(Contador==1)
 {
   estado=-1;
 
 }
 
}

void serialEvent (Serial port)
{
   datos = float(port.readStringUntil('\n'));
}