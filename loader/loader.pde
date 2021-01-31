float theta = 0 ;
float phi = 0 ;
float delta = 0 ;
float startAngle = 0 ;
float diameter = 80 ;
int[] toggle = { 0, 1 } ;
int i = 0 ;
float angle = 0 ;

void setup() {
  size(100, 100) ;
  strokeWeight(20) ;
  strokeCap(SQUARE) ;
  noFill() ;
  stroke(0, 0, 255, 200) ;
}

void draw() {
  background(255) ;
  translate(width / 2, height / 2) ;
  if (angle >= TWO_PI) angle = 0 ;
  rotate(angle) ;
  if (toggle[i] == 0) {
    arc(0, 0,
        diameter, diameter,
        radians(startAngle),
        radians(phi + theta)) ;
    theta += lerp(6, 6, theta / 300) ;
    if (theta >= 300) {
      delta = phi + 300 ;
      theta = 0 ;
      i = (i + 1) % 2 ;
    }
    angle += lerp(0.06, 0.06, theta / 300) ;
  } else if (toggle[i] == 1) {
    arc(0, 0,
        diameter, diameter,
        radians(phi + theta),
        radians(delta)) ;
    theta += lerp(12, 1, theta / 300) ;
    if (theta >= 300) {
      i = (i + 1) % 2 ;
      startAngle = phi + theta ;
      phi = delta ;
      theta = 0 ;
    }
    angle += lerp(0.06, 0.06, theta / 300) ;
  }
}
