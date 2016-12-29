import processing.serial.*;
Serial port;
color c = color(100);
float datos = 0;
int Xpos;             // horizontal position of the plot.
int Ypos;             // vertical position of the plot
 
int lastXpos;         // last x coordinate
int lastYpos;         // last y coordinate
PImage Fondo;
void setup()
{
  
  size (1350,700);
  
  Fondo=loadImage("fondo.jpg");
  
  port = new Serial (this,"COM10", 9600);
  port.bufferUntil('\n');
  Xpos = width+1;

 
  
}

void draw()
{
 

  if (datos !=-1){
    fill(c);
    rect(70,70,70,70);
    fill(255, 0, 153);
    int numero=int(datos);
    textSize(20);
    text(numero+"mm",70,100);
}
 int altura=600;
 int inicio=40;
   if (datos != -1) {
  
    float inData =(datos); 
    inData = map(inData, 0, 1022, 40, altura); //datos de la escala de tamaño de pantalla
    Ypos= int(height-inData);
 
    if (Xpos > width) {   // Iniciar
        image(Fondo,0,0);   // Borrar pantalla
      Xpos = inicio;           // Inicio de la barra estadistica
      lastXpos= Xpos;     // x position of first point
      lastYpos= Ypos;     // y position of first point
    }
 
   stroke(25,34,255);     //color de figura
    strokeWeight(3);        // tamaño de figura
    line(lastXpos, lastYpos, Xpos, Ypos);
      
    lastXpos= Xpos;
    lastYpos= Ypos;
 
   Xpos++; 

   
   
}

}

void serialEvent (Serial port)
{
   datos = float(port.readStringUntil('\n'));
}