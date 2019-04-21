import java.io.*;
import java.util.*;
import java.awt.Font;
import g4p_controls.*;
PImage img;
GButton gButton;

MouseDispatcher md;

void setup() {
  size(1700, 768);
  //japan=loadShape("http://upload.wikimedia.org/wikipedia/commons/5/56/Blank_map_of_Japan.svg");
  img = loadImage("Picture1.png");

  gButton = new GButton( this, 600, 650, 200, 80, "START" );
  gButton.setFont(new Font("Dialog", Font.PLAIN, 24));

  md = new MouseDispatcher();
  md.addHandler(computeJapanLoc, computeSize, new MouseHandler() {
    public void clicked() {compute = Mode.Japan;}});
  md.addHandler(computeTaiwanLoc, computeSize,  new MouseHandler() {
    public void clicked() {compute = Mode.Taiwan;}});
  md.addHandler(storageJapanLoc, storageSize,  new MouseHandler() {
    public void clicked() {storage = Mode.Japan;}});   
  md.addHandler(storageTaiwanLoc, storageSize,  new MouseHandler() {
    public void clicked() {storage = Mode.Taiwan;}});

  frameRate(10);    
}

void mouseClicked() {
  println("clicked!!" + mouseX + ", " + mouseY);
  MouseHandler h = md.lookUp(mouseX, mouseY);
  if (h != null)
    h.clicked();
}

void draw() {
  scale(0.5);
  background(color(255,255,255)); 
  image(img, 0, 0);
  
  drawCompute();
  drawStorage();
  drawLine();
  //  fill(0, 255, 255, c % 255);
  
  //rect(30, 20, 55, 55);
  pushMatrix();
  translate(1350, 0);
  drawWorkFlow();
  popMatrix();
}

void handleButtonEvents( GButton button, GEvent event ) {
  //println("comp" + compute[0].isSelected() + "," + compute[1].isSelected());
  //println("data" + data[0].isSelected() + "," + data[1].isSelected());  
  
  
  try {
    Process proc = Runtime.getRuntime().exec("/bin/ls");
    Monitor m = new Monitor(proc.getInputStream());
    (new Thread(m)).start(); 
   
    } catch (IOException e) {
      println(e);
  }
}
