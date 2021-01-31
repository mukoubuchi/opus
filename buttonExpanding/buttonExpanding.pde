float alpha = 200 ;
float r = 150 ;
boolean flag = false ;

void setup() {
  size(600, 600) ;
  noStroke() ;
  ellipseMode(RADIUS) ;
}

void draw() {
  background(255) ;
  fill(0, 255 - alpha) ;
  pushMatrix() ;
  translate(width / 2, height / 2) ;
  scale(map(alpha, 200, 255, 1, 1.5)) ;
  ellipse(0, 0, r, r) ;
  drawTriangle(0, 0) ;
  popMatrix() ;
  if (flag == true) {
    alpha += 0.5 ;
    if (alpha >= 255) {
      alpha = 200 ;
      flag = false ;
    }
  }
}

void drawTriangle(float cX, float cY) {
  pushMatrix() ;
  translate(cX, cY) ;
  beginShape() ;
  for (float theta = 0 ; theta < TWO_PI ; theta += TWO_PI / 3) {
    float x = r / 3 * cos(theta) ;
    float y = r / 3 * sin(theta) ;
    vertex(x, y) ;
  }
  endShape() ;
  popMatrix() ;
}

void mousePressed() {
  pushMatrix() ;
  if (sq(abs(mouseX) - width / 2) + sq(abs(mouseY) - height / 2) < sq(r))
    flag = true ;
  popMatrix() ;
}
