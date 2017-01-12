import processing.serial.*;
Serial port;

float datos = 0;
int Xpos;             // horizontal position of the plot.
int Ypos;             // vertical position of the plot
int estado;
int lastXpos;         // last x coordinate
int lastYpos; // last y coordinate
PImage Fondo;
PImage fondo1;
import controlP5.*;

int uX,uY,Contador;
Button ObjetoBoton;
Button Objeto;
Button Continuar;

ControlP5 Cp5;
boolean display = false;
PImage letras;
PImage recipiente;

color c=#003366;
color borrar=#fed7d7;
float angle = 0.0;
float offset = 60.00;
float scalar = 30.00;
float speed = 0.5;
int x=0,y,z;
void setup()
{
  
  size (1350,700);
  
  Fondo=loadImage("IMAGEN.png");
  fondo1=loadImage("fondo1.png");
  port = new Serial (this,"COM10", 9600);
  port.bufferUntil('\n');
  Xpos = width+1;
  estado=-1;

  Contador=1;
  y=0;
  orientation(PORTRAIT);
 

  Cp5=new ControlP5(this);
  ObjetoBoton = Cp5.addButton("Boton").setPosition(350,40)
                                      .setSize(120,50)                                                  
                                      .setColorActive(color(255,255,255));
  ObjetoBoton.setColorBackground(color(9,58,88))
  .setColorForeground(color(0,112,136))
  .getCaptionLabel()
  .setFont(createFont("",30))
  .toUpperCase(false)
  .setText("Iniciar")
  .setColor(color(255,255,255));
  Cp5.getController("Boton").getCaptionLabel()
  .align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);
  
  Cp5=new ControlP5(this);
  Objeto = Cp5.addButton("Parar").setPosition(850,40)
                                      .setSize(120,50)                                                  
                                      .setColorActive(color(255,255,255));
  Objeto.setColorBackground(color(9,58,88))
  .setColorForeground(color(0,112,136))
  .getCaptionLabel()
  .setFont(createFont("",30))
  .toUpperCase(false)
  .setText("Parar")
  .setColor(color(255,255,255));
  Cp5.getController("Parar").getCaptionLabel()
  .align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);  
  
  Cp5=new ControlP5(this);
  Continuar = Cp5.addButton("Continuar").setPosition(1180,600)
                                      .setSize(150,80)                                                  
                                      .setColorActive(color(255,255,255));
  Continuar.setColorBackground(color(9,58,88))
  .setColorForeground(color(0,112,136))
  .getCaptionLabel()
  .setFont(createFont("",30))
  .toUpperCase(false)
  .setText("Continuar")
  .setColor(color(255,255,255));
  Cp5.getController("Continuar").getCaptionLabel()
  .align(ControlP5.CENTER,ControlP5.CENTER).setPaddingX(0);  


  background(fondo1);

  recipiente=loadImage("lalla.png");
  letras=loadImage("logo.png");
 
     for (int i=0; i<300; i++) {
          stroke(random(255), random(255), random(255));
          strokeWeight(random(10));
          line(0, 0, random(600), random(500));
}
  smooth();
}

void draw()
{
 hideButton();
 Button();
  if(y!=-1)
  {   
  PFont mono;
  mono=loadFont("CooperBlack-48.vlw");
  textSize(32);
  fill(255,0,125);
  textFont(mono);

  image(letras,605,0);
  image(recipiente,750,250);

  
  }
 
  
  if(x<=900){
    stroke(29, 250, 138);
    strokeWeight(3);
    fill(125,255,0);
    rect(200,550,x,30);
    x=x+25;
  }
  
  

  if (estado !=-1){
     PFont mono;
    mono=loadFont("CooperBlack-48.vlw");
    fill(c);
    rect(625,20,100,80);
    fill(255, 255, 255);
    int numero=int(datos);
    textFont(mono);
    textSize(20);
    text(numero+" ml",630,80);
    if (datos>2000)
    {
      fill(c);
    rect(50,20,200,80);
    fill(255, 255, 255);
    textFont(mono);
    textSize(20);
    text("Se ha exedido el \nlímite de llenado",60,50);
    }
      if (datos<2000)
    {
    fill(borrar);
    rect(50,20,200,80);

    }
    
}
 int altura=585;
 int inicio=114;
 float mucho;
   mucho=(datos);
   if (estado != -1) {
    if(mucho>2000){
      mucho=2000;
    }
    float inData =mucho; 
 
    inData = map(inData, 0, 2000, 43, altura); //datos de la escala de tamaño de pantalla
    Ypos= int(height-inData);
 
    if (Xpos > width) {   // Iniciar
      image(Fondo,0,0);   // Borrar pantalla
      Xpos = inicio;           // Inicio de la barra estadistica
      lastXpos= Xpos;     // x position of first point
      lastYpos= Ypos;     // y position of first point
    }
  
    stroke(4,0,253);     //color de figura
    strokeWeight(2);        // tamaño de figura
    line(lastXpos, lastYpos, Xpos, Ypos);
    
    lastXpos= Xpos;
    lastYpos= Ypos;
    
    Xpos++; 
}
if (estado != -1){
  float barra=mucho;
  float c = map(barra, 0, 2000, 0, altura);
  float d = map(barra, 0, 2000, 0, 545);

  stroke(254, 215, 215);
  strokeWeight(3);
  fill(254, 215, 215);
  rect(15, 660, 30, -600);
  stroke(254, 215, 215);
  strokeWeight(3);
  fill(247, 22, 28);
  rect(15, 660, 30, -d);  
  
}

}


public void Boton()
{
    
 if(Contador==1)
 {
   estado=2;
   
   
 }
}
 public void Continuar()
{
  
   y=-1; 
  if (Contador == 1) {
    display = true;
    image(Fondo,0,0); 
  }
   if (Contador == 1) { 
    Continuar.hide();
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

void hideButton() {

  if (display == false) {
    Objeto.hide();
 
  }
  else {
    Objeto.show();
  
  }
}
void Button() {

  if (display == false) {
    ObjetoBoton.hide();
 
  }
  else {
    ObjetoBoton.show();
  
  }
}

void keyPressed() {

}