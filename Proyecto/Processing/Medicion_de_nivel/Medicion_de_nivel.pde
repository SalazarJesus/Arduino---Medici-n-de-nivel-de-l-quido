import processing.serial.*;
Serial port;
float brightness = 0;
int Xpos;             // horizontal position of the plot.
int Ypos;             // vertical position of the plot
 
int lastXpos;         // last x coordinate
int lastYpos;         // last y coordinate

void setup()
{
  size (1000,560);
  port = new Serial (this,"COM10", 9600);
  port.bufferUntil('\n');
  Xpos = width+1;
}

void draw()
{
 
 
   if (brightness != -1) {
  
    float inData =(brightness); //<-----CHECK THIS
    inData = map(inData, 60, 1023, 60, 500); //Escala de la Gráfica
    Ypos= int(height-inData);
 
    if (Xpos > width) {   // if off the screen
      background(0);      // Clear Screen
      Xpos = 100;           // initiate new trace
      lastXpos= Xpos;     // x position of first point
      lastYpos= Ypos;     // y position of first point
    }
    // background(0);
    //text(lastXpos,50,200);
    stroke(25,34,255);     //stroke color
    strokeWeight(3);        // stroke size
    line(lastXpos, lastYpos, Xpos, Ypos);
 
    lastXpos= Xpos;
    lastYpos= Ypos;
 
 
  Xpos++; 
}

}

void serialEvent (Serial port)
{
   brightness = float(port.readStringUntil('\n'));
}