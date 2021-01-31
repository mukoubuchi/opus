size(500, 500) ;
background(0) ;
int centerX = width / 2, centerY = height / 2 ;
int currentR = 3 ;
noFill() ;
stroke(255) ;
strokeWeight(0.1) ;
beginShape(TRIANGLE_STRIP) ;
for (int i = 0 ; i < 5 ; i++) {
  for(float theta = 0 ; theta <= 360 ; theta += 12) {
    float r = map(theta, 0, 360, currentR, 2 * currentR) ;
    float x1 = centerX + r * cos(radians(theta)) ;
    float y1 = centerY + r * sin(radians(theta)) ;
    float x2 = centerX + 2 * r * cos(radians(theta)) ;
    float y2 = centerY + 2 * r * sin(radians(theta)) ;
    vertex(x1, y1) ;
    vertex(x2, y2) ;
  }
  currentR *= 2 ;
}
endShape() ;
