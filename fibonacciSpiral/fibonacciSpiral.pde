int hue = 0 ;
ArrayList<PVector> origin ;

void setup() {
  size(806, 500) ;
  origin = new ArrayList<PVector>() ;
  float windowX = float(width) ;
  float windowY = float(height) ;
  origin.add(new PVector(windowX, windowY)) ;
  colorMode(HSB, 360, 100, 100) ;
}

void draw() {
  pushMatrix() ;
  for(int i = 0 ; i < origin.size() -1 ; i++) {
    float x = origin.get(i).x ;
    translate(x, 0) ;
    rotate(HALF_PI) ;
  }
  noStroke() ;
  fill(hue, 100, 100) ;
  float xLength = origin.get(origin.size() - 1).x ;
  float yLength = origin.get(origin.size() - 1).y ;
  rect(0, 0, xLength, yLength) ;
  PVector reference = new PVector(yLength, yLength) ;
  stroke(0, 0, 0) ;
  arc(reference.x, reference.y, 2 * reference.y, 2 * reference.y, PI, PI + HALF_PI) ;
  popMatrix() ;
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      hue = (hue + 60) % 360 ;
      PVector current = origin.get(origin.size() - 1) ;
      origin.add(new PVector(current.y, current.y / 1.618)) ;
    }
    if(keyCode == LEFT) {
      if(origin.size() > 1) origin.remove(origin.size() - 1) ;
    }
  }
}
