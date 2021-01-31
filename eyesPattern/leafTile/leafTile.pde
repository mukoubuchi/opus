/*
 *  [Reference]
 *  https://qiita.com/reona396/items/5fa4babc8243c4ed4914
 */

int diam = 100 ;

void setup() {
  size(400, 400) ;
}

void draw() {
  background(255) ;
  fill(0) ;
  for (int x = 0 ; x < width + diam / 2 ; x += diam) {
    for (int y = 0 ; y < height + diam / 2 ; y += diam) {
      drawSakura(x, y, sqrt(2) * diam / 2) ;
    }
  }
}

void drawSakura(int ox, int oy, float or) {
  int petalNum = 4 ;
  pushMatrix() ;
  translate(ox, oy) ;
  rotate(radians(90)) ;
  beginShape() ;
  for (int theta = 0 ; theta < 360 ; theta++) {
    float A = petalNum / PI * radians(theta) ;
    int md = floor(A) % 2 ;
    float r = pow(-1, md) * (A - floor(A)) + md ;
    float R = r + 2 * calcH(r) ;
    float x = or * R * cos(radians(theta)) ;
    float y = or * R * sin(radians(theta)) ;
    vertex(x, y) ;
  }
  endShape(CLOSE) ;
  popMatrix() ;
}

float calcH(float x) {
  return 0 ;

  // if (x < 0.8) {
  //   return 0 ;
  // } else {
  //   return 0.8 - x ;
  // }
}
