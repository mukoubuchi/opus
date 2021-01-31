float hexagonRadius = 200 ;
float radius = (1 + 1/2) * hexagonRadius * sin(PI/3) ;
float triangleRadius = radius * cos(PI/3) ;
float theta = 0 ;
float x, y = 0 ;
float angle = 0 ;

void setup() {
  size(600, 600) ;
  noStroke() ;
}

void draw() {
  background(255) ;
  translate(width >> 1, height >> 1) ;
  // rotate(-angle) ;
  for(int i = 0 ; i < 2 ; i++) {
    if(i == 1) rotate(PI/3) ;
    for (int j = 0 ; j < 3 ; j++) {
      float pX = radius * cos(j * TWO_PI/3) ;
      float pY = radius * sin(j * TWO_PI/3) ;
      float nX = radius * cos((j + 1) * TWO_PI/3) ;
      float nY = radius * sin((j + 1)  * TWO_PI/3) ;
      x = lerp(pX, nX, theta/TWO_PI) ;
      y = lerp(pY, nY, theta/TWO_PI) ;
      fill(0) ;
      drawTriangle(x, y) ;
    }
  }
  theta = (theta + 0.05) % TWO_PI ;
  angle = (angle + 0.05) % TWO_PI ;
}

void drawTriangle(float cX, float cY) {
  pushMatrix() ;
  translate(cX, cY) ;
  beginShape() ;
  for(float theta = 0 ; theta < TWO_PI ; theta += TWO_PI/3) {
    float x = triangleRadius * cos(theta) ;
    float y = triangleRadius * sin(theta) ;
    vertex(x, y) ;
  }
  endShape(CLOSE) ;
  popMatrix() ;
}
