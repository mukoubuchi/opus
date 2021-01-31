float n = 6 ;
float uAngle = TWO_PI / 6 ;
float radius = 200 ;
float xLength = radius * cos(uAngle) ;
float yLength = radius * sin(uAngle) ;
float x = 0, y = 0 ;
float angle = 0 ;

void setup() {
  size(600, 600) ;
  noFill() ;
  strokeWeight(2) ;
}

void draw() {
  angle = map(mouseX, 0, width, PI, -PI) ;
  background(204) ;
  drawCube(width >> 1, height >> 1) ;
}

void drawCube(float cX, float cY) {
  pushMatrix() ;
  translate(cX, cY+yLength/2) ;
  rotate(HALF_PI) ;
  beginShape(QUAD_STRIP) ;
  x = xLength * cos(angle) ;
  y = yLength * sin(angle) ;
  vertex(x, y) ;
  vertex(x -radius, y) ;
  x = xLength * cos(angle + HALF_PI) ;
  y = yLength * sin(angle + HALF_PI) ;
  vertex(x, y) ;
  vertex(x - radius, y) ;
  x = xLength * cos(angle + PI) ;
  y = yLength * sin(angle + PI) ;
  vertex(x, y) ;
  vertex(x - radius, y) ;
  x = xLength * cos(angle + PI + HALF_PI) ;
  y = yLength * sin(angle + PI + HALF_PI) ;
  vertex(x, y) ;
  vertex(x - radius, y) ;
  x = xLength * cos(angle + TWO_PI) ;
  y = yLength * sin(angle + TWO_PI) ;
  vertex(x, y) ;
  vertex(x - radius, y) ;
  endShape() ;
  popMatrix() ;
}
