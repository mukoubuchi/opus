float r = 200 ;
int count = 0 ;
float theta = 0 ;
color[] c = {
  color(0, 255, 0),
  color(255, 0, 0),
  color(0, 0, 255),
  color(255, 255, 0)
} ; // 0(green), 1(red), 2(blue), 3(yellow)
int frontColor = 0 ;

void setup() {
  size(600, 600) ;
  noStroke() ;
}

void draw() {
  background(255) ;
  translate(width/2, height/2) ;
  rotate(HALF_PI + QUARTER_PI) ; // adjustment
  switch(frontColor) {
  case 1: rotate(HALF_PI) ; break ;
  case 2: rotate(2 * HALF_PI) ; break ;
  case 3: rotate(3 * HALF_PI) ; break ;
  default: break ;
  }
  for(int i = 0 ; i < 4 ; i++) {
    float y = map(cos(theta), -1, 1, -r, r) ;
    fill(c[3 - (frontColor + i) % 4]) ;
    ellipse(0, y, 280, 280) ;
    rotate(HALF_PI) ;
  }
  count = (count + 2) % (4 * 180) ;
  switch(count) {
  case 0 * 180: frontColor = 0 ; break ;
  case 1 * 180: frontColor = 1 ; break ;
  case 2 * 180: frontColor = 3 ; break ;
  case 3 * 180: frontColor = 2 ; break ;
  default: break ;
  }
  theta = radians(count) ; 
}