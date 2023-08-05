  
import processing.video.*;

Capture cam;
float offset;
PFont f;  // Global font variable
int index = 0;
String[] headlines = {
  "ELA É TÃO MÃE QUANTO EU.", 
  "A DIFERENÇA ENTRE NÓS É A SUA INDIFERENÇA.",
  "SOMOS APENAS MÃES E TEMOS MEDO.",
  "A DIFERENÇA ENTRE NÓS É QUE EU POSSO ESCOLHER",
  "A DIFERENÇA ENTRE NÓS É A LIBERDADE",
  };

String[] imageNames = { "mamalia2.png", "mamalia3.png", "PORCA.png" };
PImage[] images = new PImage[imageNames.length];


void setup() {
  
 
  
  
  size(1366, 600);
     smooth();
   //começa fonte
f = createFont("HelveticaNeue-Bold",24,true);  
 

 
//camera
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture."); //<>//
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}



void draw() {
 
  //código imagem transparência


for (int i=0; i < imageNames.length; i++){
  String imageName = imageNames[i];
  images[i] = loadImage(imageName);
  image(images[i],offset,0);
  tint(255, 153);
  delay(3000);
 } 
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);



//retangulo preto
   fill(#000000);
   rect(0,400,1366,400);
   
//começa aqui o código da fonte
fill(#ffffff);
textFont(f,22);        
 textAlign(CENTER);
  text(headlines[index],width/2,450);
  index = (index+1) % headlines.length;
   delay(3000);
  




   saveFrame("mammalia-####.png");
 }  
 
