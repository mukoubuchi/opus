float smallRadius = 100 ;
float margin = 15 ;
float bigRadius = 250 ;
float x = 0 ;
float y = 0 ;
float theta = 0 ;
float angle = 0 ;

void setup() {
  size(600, 600) ;
}

void draw() {
  pushMatrix() ;
  translate(width / 2, height / 2) ;
  angle = (angle + 0.02) % TWO_PI ;
  rotate(angle) ;
  /*
   * blocks
   */
  noStroke() ;
  fill(255, 0, 0) ; // red
  drawTriangle(PI - PI / 6) ;
  drawBlock(PI) ;
  fill(0, 40) ; // shadow
  drawTriangle(PI - PI / 6) ;
  fill(255, 255, 0) ; // yellow
  drawTriangle(PI + HALF_PI) ;
  drawBlock(PI + HALF_PI+PI / 6) ;
  fill(0, 40) ; // shadow
  drawTriangle(PI + HALF_PI) ;
  fill(0, 255, 0) ; // green
  drawTriangle(HALF_PI - PI / 3) ;
  drawBlock(HALF_PI - PI / 6) ;
  fill(0, 40) ; // shadow
  drawTriangle(HALF_PI - PI / 3) ;
  popMatrix() ;
  /*
   * ellipse
   */
  strokeWeight(margin) ;
  stroke(255) ;
  fill(0, 0, 255) ; // blue
  ellipseMode(RADIUS) ;
  ellipse(width / 2, height / 2, smallRadius, smallRadius) ;
}

void drawBlock(float phi) {
  beginShape() ;
  theta = phi ;
  x = (smallRadius+margin / 2) * cos(theta) ;
  y = (smallRadius+margin / 2) * sin(theta) ;
  vertex(x, y) ;
  theta += PI / 6 ;
  x = (bigRadius) * cos(theta) ;
  y = (bigRadius) * sin(theta) ;
  vertex(x, y) ;
  for (float i = theta ; i < theta + TWO_PI / 3 ; i += 0.01) {
    x = (bigRadius) * cos(i) ;
    y = (bigRadius) * sin(i) ;
    curveVertex(x, y) ;
    // println(x + ", ", + y) ;
  }
  curveVertex(x, y) ; // guide
  theta += PI / 3 ;
  x = (smallRadius + margin / 2) * cos(theta) ;
  y = (smallRadius + margin / 2) * sin(theta) ;
  vertex(x, y) ;
  endShape(CLOSE) ;
}

void drawTriangle(float phi) {
  beginShape() ;
  theta = phi ;
  x = (smallRadius + margin / 2) * cos(theta) ;
  y = (smallRadius + margin / 2) * sin(theta) ;
  vertex(x, y) ;
  theta += PI / 3 ;
  x = (bigRadius) * cos(theta) ;
  y = (bigRadius) * sin(theta) ;
  vertex(x, y) ;
  theta -= PI / 6 ;
  x = (smallRadius) * cos(theta) ;
  y = (smallRadius) * sin(theta) ;
  vertex(x, y) ;
  endShape(CLOSE) ;
}
