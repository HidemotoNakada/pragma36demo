int w_off_x = 0;
int w_off_y = 10;
int w_size_x = 300;
int w_size_y = 60;
int w_interval_y = 100;

String [] labels = {"Initialze", "Downloading Satelite Data", 
  "Generating Training Data", "Traing a model", "Finalize"}; 

void drawRect(int n, String text, boolean blink) {  
  int p = 255;   // 128 - 255 
  if (blink) 
    p = (int)(128 + 128 * Math.sin(PI * frameCount / 5.0));         
  fill(255, 255, p);
  int x = w_off_x;
  int y = w_off_y + n * (w_size_y + w_interval_y);  
  rect(x, y, w_size_x, w_size_y, 10);

  fill(0);
  int tx = x + w_size_x / 2;
  int ty = y + w_size_y / 2;
  textSize(22);
  textAlign(CENTER, CENTER);
  text(text, tx, ty);

}
void drawArrow(int n) {
  int x = w_off_x + w_size_x /2;
  int y = w_off_y + w_size_y * n + w_interval_y * (n - 1);
  stroke(0);
  _drawArrow(x, y, w_interval_y, 90);
}

void _drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

void drawWorkFlow(){ 
  int c = frameCount / 100;    
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i < 5; i++) {
    if (i != 0) drawArrow(i);
    drawRect(i, labels[i], c % 5 == i);
  }
}
