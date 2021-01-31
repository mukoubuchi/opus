float radius = 150 ;
float packmanRadius = 200 ;
float angle = 0 ;
int[] state = { 0, 1, 2, 3 } ;
int stateNumber = 0 ;

void setup() {
  size(600, 600) ;
  background(255) ;
  noStroke() ;
}

void draw() {
  background(255) ;
  translate(width / 2, height / 2) ;
  rotate(QUARTER_PI) ;
  fill(0) ;
  if (state[stateNumber] == 0) {
    rotate(angle) ;
    for (float theta = 0 ; theta < TWO_PI ; theta += HALF_PI) {
      float x = radius * cos(theta) ;
      float y = radius * sin(theta) ;
      drawPackman(x, y, packmanRadius, packmanRadius, theta, true) ;
    }
  } else if (state[stateNumber] == 2) {
    rotate(-angle) ;
    beginShape() ;
    for (float theta = 0 ; theta < TWO_PI ; theta += HALF_PI) {
      float x = radius * cos(theta) ;
      float y = radius * sin(theta) ;
      drawBall(x, y, packmanRadius, packmanRadius, theta) ;
      vertex(x, y) ;
    }
    rotate(2 * angle) ;
    fill(255) ;
    endShape() ;
  } else {
    for (float theta = 0 ; theta < TWO_PI ; theta += HALF_PI) {
      float x = radius * cos(theta) ;
      float y = radius * sin(theta) ;
      drawPackman(x, y, packmanRadius, packmanRadius, theta, false) ;
    }
    angle += 0.1 ; // adjustment of the rest time
  }
  if (angle < QUARTER_PI) {
    angle += lerp(0.005, 0.12, angle / HALF_PI) ;
  } else {
    angle += lerp(0.12, 0.005, angle / HALF_PI) ;
  }
  if (angle > HALF_PI) {
    angle = 0 ;
    stateNumber = (stateNumber + 1) % state.length ;
  }
}

void drawBall(float x, float y, float w, float h, float theta) {
  ellipse(x, y, w, h) ;
}

void drawPackman(float x, float y, float w, float h, float theta, boolean hasRotate) {
  pushMatrix() ;
  translate(x, y) ;
  rotate(QUARTER_PI + PI) ;
  if (hasRotate == true)
    rotate(lerp(0, TWO_PI, -angle / HALF_PI)) ;
  arc(0, 0, w, h, theta, theta + TWO_PI - HALF_PI, PIE) ;
  popMatrix() ;
}
