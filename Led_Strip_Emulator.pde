/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
final int LED_LENGTH = 120;
final int STRIP_SPACING = 30;
final int LED_SIZE = 12;
//final int NUM_BEAMS = 4;

LedStrip _strip;
int _ci = 0;

ArrayList<Beam> arrBeam = new ArrayList<Beam>();

void setup() {

  frameRate(60);
  background(0);

  size(800, 800);
 
  _strip = new LedStrip(LED_STRIP_TYPE_CIRCLE,LED_LENGTH,LED_SIZE,400,400,350,0);

  arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  //arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));
  //arrBeam.add(new Beam(int(random(10,30)), random(.03,.3), random(.013,.02),1, int(random(0,LED_LENGTH-1)), LED_LENGTH));

}

void update() {

  _ci++;
  if (_ci > 255) {
    _ci = 0;
  }
  
  //Update the beams
  for (int i=0; i<arrBeam.size(); i++) {
    if(!arrBeam.get(i).move()) {
      arrBeam.remove(i);
      arrBeam.add(new Beam(int(random(10,30)), random(.015,.15), random(.015,.02),1, int(random(0,LED_LENGTH-20)), LED_LENGTH));
    } 
  }
  
  //for (int i=0; i<LED_LENGTH; i++)
  //{
  //  _strip.setColor(i,color(_ci, _ci, _ci));
  //}
  float _val = 0;
  for(int i=0; i<LED_LENGTH; i++){

    _val = 0;
    for (int j=0; j<arrBeam.size(); j++) {
      _val += arrBeam.get(j).getVal(i) * 255;
    }

    if (_val > 255) {
      _val = 255;
    }

    _strip.setColor(i,color(_val, _val, _val));
  }
  
}

void draw() {

   update();

   _strip.draw();
}