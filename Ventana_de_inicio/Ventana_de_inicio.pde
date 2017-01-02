PImage foto;
PImage fo;
PImage f;
PImage fi;
color c;
float angle = 0.0;
float offset = 60.00;
float scalar = 30.00;
float speed = 0.5;
int x=0;
void setup(){
 // frameRate(3);
  size(1000,600);
  background(#CCEEFF);
  foto=loadImage("vaso.png");
  fo=loadImage("lalla.png");
  f=loadImage("logo.png");
  fi=loadImage("agua1.png");
  
  smooth();
 
  /*background(#CCEEFF);
  colorMode(HSB);
  col = 0;*/
  
  
}

void draw(){
  for(int i=0;i<=1000;i++){
      for(int j=0;j<=600;j++){
           c= color(mouseX,i,j);
         set(i,j,c);
       }
     }
     
     
  PFont mono;
  mono=loadFont("CooperBlack-48.vlw");
  textSize(32);
  fill(255,0,125);
  textFont(mono);
 // text("Detector level of liquid",200,90);
  image(f,405,0);
  image(fo,400,200);
  image(foto,430,300);
  
  /*for(int i=0; i<=800;i++){
    rect(30,500,i,30);
  }*/
  
  if(x<=550){
    fill(125,255,0);
    rect(200,550,x,30);
    x=x+5;
  }else{
    image(fi,0,0);
    
  }
  
 

 /* col = (col+1) % 256;
  fill(col,255,255,100);
  ellipse(random(mouseX-30, mouseX+30) ,random(mouseY-30,mouseY+30), 20 , 20 );*/
}

/*void mousePressed(){
background(#CCEEFF);
}*/