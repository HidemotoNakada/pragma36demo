interface MouseHandler {
  void clicked();
}

class MouseArea {
  int x0, y0, x1, y1;
  MouseHandler h;   
   MouseArea(int [] topLeft, int [] size, MouseHandler h) {
    this.x0 = topLeft[0];
    this.y0 = topLeft[1];
    this.x1 = topLeft[0] + size[0];
    this.y1 = topLeft[1] + size[1];
    this.h = h;
  }
  MouseArea(int x0, int y0, int x1, int y1, MouseHandler h) {
    this.x0 = x0;
    this.y0 = y0;
    this.x1 = x1;
    this.y1 = y1;
    this.h = h;
  }
}

class MouseDispatcher {
  List<MouseArea> areas = new ArrayList<MouseArea>();  
  void addHandler(int x0, int y0, int x1, int y1, MouseHandler h) {
      areas.add(new MouseArea(x0, y0, x1, y1, h));
  }
  void addHandler(int [] topLeft, int [] size, MouseHandler h) {
      areas.add(new MouseArea(topLeft, size, h));
  }
  MouseHandler lookUp(int x, int y) {
    for (MouseArea a: areas) {
       if (a.x0 < x && a.x1 > x && a.y0 < y && a.y1 > y) 
         return a.h;   
    }  
    return null;
  }
}
