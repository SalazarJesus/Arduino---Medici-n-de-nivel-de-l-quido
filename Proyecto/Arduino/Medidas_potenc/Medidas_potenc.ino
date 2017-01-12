// Configuramos los pines del sensor Trigger y Echo
const int PinTrig = 7;
const int PinEcho = 6;

const int numLecturas = 100;
float lecturas[numLecturas]; 
int lecturaActual = 0; // Lectura por la que vamos
float total = 0; // Total de las que llevamos
float media = 0;

// Constante velocidad sonido en cm/s
const float VelSon = 34000.0;
int ledrojo=8;
int lednaranja=9;
int ledverde=10;
float distancia;
float distanciatotal=20.64;

int led;
void setup()
{
  // Iniciamos el monitor serie para mostrar el resultado
  Serial.begin(9600);
  // Ponemos el pin Trig en modo salida
  pinMode(PinTrig, OUTPUT);
  // Ponemos el pin Echo en modo entrada
  pinMode(PinEcho, INPUT);
  pinMode(ledrojo, OUTPUT); 
  pinMode(lednaranja, OUTPUT); 
  pinMode(ledverde, OUTPUT);   
}
void loop()
{
  total = total - lecturas[lecturaActual];
 
  iniciarTrigger();


 lecturas[lecturaActual] = distancia;
 
  // Añadimos la lectura al total
  total = total + lecturas[lecturaActual];
 
  // Avanzamos a la siguiente posición del array
  lecturaActual = lecturaActual + 1;
 
  // Comprobamos si hemos llegado al final del array
  if (lecturaActual >= numLecturas)
  {
    lecturaActual = 0;
  }
 
 media = total / numLecturas;
 


  // La función pulseIn obtiene el tiempo que tarda en cambiar entre estados, en este caso a HIGH
  unsigned long tiempo = pulseIn(PinEcho, HIGH);
  
  // Obtenemos la distancia en cm, hay que convertir el tiempo en segudos ya que está en microsegundos
  // por eso se multiplica por 0.000001
  distancia = tiempo * 0.000001 * VelSon / 2.0;
 
  float distanliquido = (distanciatotal - media);

  float distanciaReal;
  
  if (distanliquido < 0)
 {
  distanciaReal= 0 ;
 }
 if(distanliquido > distanciatotal)
 {
  distanciaReal=0;
 }
 if (distanliquido > 0  && distanliquido < distanciatotal )
 {
  distanciaReal=distanliquido ;
 }

float liquido;
float distancia1=3.74;
float distancia2=8.95;
float distancia3=16.30;
float dato1 = distancia2 - distancia1;
float dato2 = distancia3 - distancia2;
if (distanciaReal <= distancia1)
{
  liquido = (distanciaReal*100)/0.748;
}
if(distanciaReal > distancia1 && distanciaReal <= distancia2 )
{
  float distancia2 = distanciaReal - dato1;
  liquido=(( distancia2 *100 )/ 1.04) + 500;
}
if(distanciaReal > distancia2 && distanciaReal <= distancia3 )
{
  float distancia2 = distanciaReal - dato2;
  
  liquido=(( distancia2 *100 )/ 0.735) + 1000;
}
Serial.println(liquido);
//Serial.println(media);




  if (distanciaReal>12){
    led=1;
    digitalWrite(lednaranja,LOW);
    digitalWrite(ledrojo,LOW);
  }
  if (distanciaReal<=12 && distanciaReal > 6){
    led=2;
    digitalWrite(ledverde,LOW);
    digitalWrite(ledrojo,LOW);
  }
  if (distanciaReal<=6){
    led=3;
    digitalWrite(ledverde,LOW);
    digitalWrite(lednaranja,LOW);
  }
  switch(led){
    case 1:
    digitalWrite(ledverde,HIGH);
    break;
    case 2:
    digitalWrite(lednaranja,HIGH);
    break;
    case 3:
    digitalWrite(ledrojo,HIGH);
    break;
  }
  
  delay(50);
}
 
// Método que inicia la secuencia del Trigger para comenzar a medir
void iniciarTrigger()
{
  // Ponemos el Triiger en estado bajo y esperamos 2 ms
  digitalWrite(PinTrig, LOW);
  delayMicroseconds(2);
  
  // Ponemos el pin Trigger a estado alto y esperamos 10 ms
  digitalWrite(PinTrig, HIGH);
  delayMicroseconds(10);
  
  // Comenzamos poniendo el pin Trigger en estado bajo
  digitalWrite(PinTrig, LOW);
}
