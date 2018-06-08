/*
        PROGRAMACION EN INGENIERIA
            ENERO-JUNIO 2018

   HECTOR HURTADO RAMÍREZ
   08 JUNIO 2018
   
   BENJAMIN MORENO
  
*/


//*******************NOTA********************************//
//Para que la captura de pantalla sea muestre correctamente, mueva la ventana del programa a la esquina superior derecha de su pantalla.


//*******************LIBRERIAS********************************//
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.AWTException;

import ddf.minim.*;

Minim minim;
Minim gestor;
AudioPlayer musica_fondo;
//------------------------------------------------------------//

//****************DECLARACION DE OBJETOS Y VARIABLES**********//
PImage screenshot;
Rectangle dimension;
Robot robot;
Capture video;
OpenCV opencv;

String textoInput;          //String captura de usuario
String textoAux;        //String auxiliar para captura de usuario
String Contra = "POAOGB";    //declara la contraseña correcta
int contEnter = 0;
int screen;                //var para control de pantallas
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;




//-------------------------------------------------------------//


//************************S E T   U P**************************//
void setup()
{
  size(640, 480);
  
  screen = 0;
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start();

  smooth(4);
  frameRate(30);
  imageMode(CORNER);
  background((color) random(#000000));
 
  screenshot = createImage(displayWidth, displayHeight, ARGB);
  dimension  = new Rectangle(displayWidth, displayHeight);
 
  try
  {
    robot = new Robot();
  }
  catch (AWTException cause)
  {
    println(cause);
    exit();
  }//fin catch
  
  gestor = new Minim(this);
  musica_fondo = gestor.loadFile("xfiles.mp3");
  musica_fondo.setGain(-5);
  musica_fondo.loop();

//********* IMAGENES DE LA GALERIA*******
img = loadImage("yo.jpg");
img2 = loadImage("london.jpg");
img3 = loadImage("subzero.jpg");
img4 = loadImage("stone.jpg");
img5 = loadImage("forest.jpg");
img6 = loadImage("tree.jpg");
img7 = loadImage("mariposa.jpg");
img8 = loadImage("stone2.jpg");
img9 = loadImage("bart.PNG");
img10 = loadImage("abstract.PNG");


  textoInput = "";
  textoAux = "";
}
//-----------------------------------------------------------------//


void draw() {
  
  

 
    
    String s = "Identificacion de usuario por password";
    fill(50);
    text(s, 10, 10, 70, 80);  // Text wraps within text box
    
      if(key == '1')
        {
          screen = 1;  
        }
 //*********************PANTALLA UNO***************************//
  if (screen==1);
  {

  scale(2);
  textSize(32);
  text("word", 10, 30);
  opencv.loadImage(video);

  image(video, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);
  
  println("Bienvenido a mi galeria");
  println("Para ver el contenido acerca tu rostro a la cámara e ingresa la contraseña proporcionada  :> ");
 
  for (int i = 0; i < faces.length; i++) 
  {
    //println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  
        
    if (Contra.equals(textoInput) == false)
    {
     screen = 1;
     if(textoInput.length()>1)
       {
         screen = 3;
       }
     
    }
    else  
    {
      screen=2;
      
      if(Contra.equals(textoInput) == true)
      {
        screen = 2;
      }
      
    } //fin else comp contraseña
          
  }// fin FOR cuenta caras
  textSize(20);
  fill(200,200,200);
  text("Introduce la contraseña",50,50);
  text("Indicio: PO*OG*",70,80);
  
  
//**********************SEGUNDA PANTALLA************************//  
  if (screen==2)
    {
    background(255,0,255,150);
    s = "";
    textSize(20);
    text(  "Desbloqueaste la galeria!", 40,100);
    textSize(10);
    text("Para ver las fotografias presiona 1,2,3,4 o 5" ,45,120);
    text("Para ver las ilustraciones presiona 6,7,8,9 o z",45,140);
    text("Presiona r para regresar a esta pantalla",45,160);
    fill(50);
    text(s, 10, 10, 70, 80);  // Text wraps within text box
    //image(grabScreenshot(screenshot, dimension, robot), 0, 0, width, height);
  }
  if (key =='8'){
    image(img, 0, 0);
    image(img, 0, 0, width/2, height/2);
  }  
  
  if (key =='9'){
    image(img2, 0, 0);
    image(img2, 0, 0, width/2, height/2);
  }  
  if (key =='z'){
    image(img3, 0, 0);
    image(img3, 0, 0, width/2, height/2);
  }  
  if (key =='1'){
    image(img4, 0, 0);
    image(img4, 0, 0, width/2, height/2);
  }  
  if (key =='2'){
    image(img5, 0, 0);
    image(img5, 0, 0, width/2, height/2);
  }  
  if (key =='3'){
    image(img6, 0, 0);
    image(img6, 0, 0, width/2, height/2);
  }  
  if (key =='4'){
    image(img7, 0, 0);
    image(img7, 0, 0, width/2, height/2);
  }  
  if (key =='5'){
    image(img8, 0, 0);
    image(img8, 0, 0, width/2, height/2);
  }  
  if (key =='6'){
    image(img9, 0, 0);
    image(img9, 0, 0, width/2, height/2);
  }  
  if (key =='7'){
    image(img10, 0, 0);
    image(img10, 0, 0, width/2, height/2);
  }  
  if (key =='r'){
    screen =2;
    }
  

//--------------------------------------------------------------//

//**********************TERCERA PANTALLA************************//
    if(screen==3)
    {
      //background(255,255,255);
      image(grabScreenshot(screenshot, dimension, robot), 0, 0, width, height);
      //redraw();
      //noLoop();
      //noLoop();
      //background(#00B286);
       s = "";
    text("ERROR!!!!",80,200);
    textSize(15);
    text("Detén el programa e intenta de nuevo", 20,220);
    fill(50);
    text(s, 10, 10, 70, 80);  // Text wraps within text box
    }
   
//--------------------------------------------------------------//       
  }
}

void captureEvent(Capture c)
{
  c.read();
}


void keyPressed () {                                  //CAPTURAR TEXTO USUARIO
  
  if (key == RETURN || key == ENTER) {
    // A presionar enter guarda la cadena de caracteres ingresada 
    if (!textoAux.equals("")) {
      textoInput = textoAux;
      textoAux = "";
      println (textoInput);
    }
  }
  else
  {
    // registra cualquier caracter presionado  
    textoAux = textoAux + (key+"");
  } // else
} // func 


static final PImage grabScreenshot(PImage img, Rectangle dim, Robot bot)
{
  //return new PImage(bot.createScreenCapture(dim));
 
  bot.createScreenCapture(dim).getRGB(0, 0
    , dim.width, dim.height
    , img.pixels, 0, dim.width);
 
  //img.updatePixels();
  return img;
}


// HECTOR HURTADO RAMÍREZ /m/ /m/