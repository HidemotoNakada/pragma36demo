
public abstract class Mode {
  static final int Japan = 1;
  static final int Taiwan = 2;
  static final int NotDefined = 3;
}

int compute = Mode.NotDefined;
int storage = Mode.NotDefined;

int [] computeJapanLoc = {194, 164};
int [] computeTaiwanLoc = {992, 164};
int [] computeSize = {210, 180};

int [] storageJapanLoc = {165, 465};
int [] storageTaiwanLoc = {960, 465};
int [] storageSize = {280, 200};

void _rect(int [] loc, int [] size) {
  rect(loc[0], loc[1], size[0], size[1], 30); 
}

void drawCompute(){   
  stroke(0,0,0,0);
  fill(255, 255, 128, 80);
  if (compute == Mode.Japan) { 
    _rect(computeJapanLoc, computeSize);     
  } else if (compute == Mode.Taiwan) {
    _rect(computeTaiwanLoc, computeSize);  
  }
}
void drawStorage(){   
  if (storage == Mode.Japan) { 
    _rect(storageJapanLoc, storageSize);    
  } else if (storage == Mode.Taiwan) {
    _rect(storageTaiwanLoc, storageSize);
  }
}

void drawLine(){
  int [] s;
  int [] e;
  if (compute == Mode.NotDefined || storage == Mode.NotDefined)
    return;
  if (compute == Mode.Japan) 
    s = computeJapanLoc;
  else
    s = computeTaiwanLoc;
  if (storage == Mode.Japan) 
    e = storageJapanLoc;
  else
    e = storageTaiwanLoc;  
  int sx = s[0] + computeSize[0] / 2;      
  int sy = s[1] + computeSize[1] / 2;    
  int ex = e[0] + storageSize[0] / 2;      
  int ey = e[1] + storageSize[1] / 2;    

  double len = Math.sqrt((sx - ex) * (sx - ex) + (sy - ey) * (sy - ey)); 
  double angle = Math.atan((double)(ex - sx) / (ey - sy)); 
  
  stroke(255, 255, 128, 80);
  strokeWeight(100);
  line(sx, sy, ex, ey); 
}
