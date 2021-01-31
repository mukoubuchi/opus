int n = 5 ;
float unitAngle = TAU / n ;
float x = 0, y = 0 ;
float radius = 200 ;
float phi = (1 + sqrt(5)) / 2 ; // golden number
float sideLength = 2 * sin(PI / n) ; // side length of n-gon inscribed in unit circle
float length = radius * sideLength * phi ;
float theta = radians(198) ;

void setup() {
  size(500, 500) ;
  background(255) ;
  translate(width / 2, height / 2) ;
  pushMatrix() ;
  drawPentagonIn(radius, 0, length, radians(198)) ;
  popMatrix() ;
  float movingDistance = length * (1 / (1 + phi)) ;
  x = radius + movingDistance * cos(theta) ;
  y = movingDistance * sin(theta) ;
  sideLength = length - 2 * movingDistance ;
  for (int i = 0 ; i < n ; i++) {
    pushMatrix() ;
    rotate(i * unitAngle) ;
    drawPentagonOut(x, y, sideLength, theta - radians(108)) ;
    popMatrix() ;
  }
}

void drawPentagonOut(float x, float y, float length, float theta) {
  if (length < 5) return ;
  for (int i = 0 ; i < n ; i++) {
    translate(x, y) ;
    x = length * cos(theta) ;
    y = length * sin(theta) ;
    line(0, 0, x, y) ;
    theta = (theta + radians(216)) % TAU ;
  }
  float movingDistance = length / phi ;
  x -= movingDistance * cos(radians(-198)) ;
  y += movingDistance * sin(radians(-198)) ;
  drawPentagonOut(x, y, movingDistance, theta) ;
}

void drawPentagonIn(float x, float y, float length, float theta) {
  if (length < 5) return ;
  for (int i = 0 ; i < n ; i++) {
    translate(x, y) ;
    x = length * cos(theta) ;
    y = length * sin(theta) ;
    line(0, 0, x, y) ;
    theta = (theta + radians(216)) % TAU ;
  }
  float movingDistance = length * (1 / (1 + phi)) ;
  x += movingDistance * cos(theta) ;
  y += movingDistance * sin(theta) ;
  sideLength = length - 2 * movingDistance ;
  length = phi * sideLength ;
  theta = (theta - unitAngle / 2) % TAU ;
  drawPentagonIn(x, y, length, theta) ;
}
