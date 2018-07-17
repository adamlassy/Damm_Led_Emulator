final int LED_STRIP_TYPE_REGULAR = 0;
final int LED_STRIP_TYPE_CIRCLE = 1;

class LedStrip {
  
  int sSize;
  PVector locSpacing;
  PVector locOrigin;
  int lLedSize;
  
  int lType;
  int lRadius;
  
  PVector stripStart;
  PVector stripEnd;
  
  Led[] arrLeds;
  
  LedStrip (int _stripType, int _size, int _ledSize, int _x, int _y, int _spacingX, int _spacingY) {
 
    lLedSize = _ledSize;
    lType = _stripType;
    sSize = _size; 
    locSpacing = new PVector(_spacingX, _spacingY);
    locOrigin = new PVector(_x, _y);

    lRadius = _spacingX;
    
    arrLeds = new Led[sSize];
    //lType = LED_STRIP_TYPE_REGULAR;

    //println(arrLeds.length);
    for (int i=0; i<sSize; i++) {
      //println(i);
      //println(locSpacing.x);
      
      if (lType == LED_STRIP_TYPE_REGULAR)
      {
        arrLeds[i] = new Led(
          int(i*locSpacing.x), 
          int(i*locSpacing.y)
        );
      }
      else
      {
        arrLeds[i] = new Led(lRadius,0);
      }

    }
    
    stripStart = new PVector(locOrigin.x - LED_SIZE, locOrigin.y - LED_SIZE);
    stripEnd = new PVector(sSize * (locSpacing.x), locOrigin.y);

  }

  void update() { 
  } 
  
  void setColor(int _i, color _c) {
    //println("color " + red(_c));
     arrLeds[_i].c = _c;
  }
  
  void draw() {
    //Draw Rectangle
   
    pushMatrix();
    translate(locOrigin.x, locOrigin.y);
      
    if (lType == LED_STRIP_TYPE_REGULAR)
    {

      for (int i=0; i<sSize; i++) {
        arrLeds[i].draw();   
      }

      noFill();
      rect(stripStart.x, stripStart.y, stripEnd.x, stripEnd.y);
    }
    else
    {
      for (int i=0; i<sSize; i++) {
        rotate(TWO_PI/sSize);
        arrLeds[i].draw();   
      }
    }

    popMatrix();

  }


}  

class Led {
  
  color c;
  int x, y;
  int lSize;

  Led () {}

  Led (int _x, int _y) { 
    x = _x;
    y = _y;
  }

  void setLoc(int _x, int _y) {
  
    //println("here");
    //println(_x);

    x = _x;
    y = _y;
  }

  void update(color _c) { 
    c = _c;
  } 
  
  void draw() {
    
    //println("Draw " + c);
    //c = color(255,0,0);
    
    fill(c);
    stroke(100);
    ellipse(x, y, LED_SIZE, LED_SIZE);
  }

}