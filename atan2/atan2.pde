float axisRadius = 200 ;

void setup() {
  size(400, 400) ;
  noCursor() ;
  smooth() ;
  fill(0) ; // necessary for displaying any fonts
}

void draw() {
  background(255) ;
  displayAxes(axisRadius) ;
  translate(width / 2, height / 2) ;
  float pointY = mouseY - height / 2 ;
  float pointX = mouseX - width / 2 ;
  float angle = atan2(pointY, pointX) ;
  text("radian: " + angle, 10, axisRadius - 30) ;
  text("degree: " + degrees(angle), 10, axisRadius - 10) ;
  ellipse(pointX, pointY, 8, 8) ;
  line(0, 0, pointX, pointY) ;
  if (angle > 0) {
    arc(0, 0, 50, 50, 0, angle) ;
    text("(" + int(pointX) + ", " + int(pointY) + ")", pointX + 10, pointY + 20) ;
  } else {
    arc(0, 0, 50, 50, angle, 0) ;
    text("(" + int(pointX) + ", " + int(pointY) + ")", pointX + 10, pointY - 10) ;
  }
  if (pointX > 0) {
    for (float x = 0 ; x < pointX ; x += 5) {
      point(x, pointY) ;
    }
  } else {
    for (float x = 0 ; x > pointX ; x -= 5) {
      point(x, pointY) ;
    }
  }
  if (pointY > 0) {
    for (float y = 0 ; y < pointY ; y += 5) {
      point(pointX, y) ;
    }
  } else {
    for (float y = 0 ; y > pointY ; y -= 5) {
      point(pointX, y) ;
    }
  }
}

void displayAxes(float axisRadius) {
  pushMatrix() ;
  translate(width / 2, height / 2) ;
  for (int i = 0 ; i < 4 ; i++) {
    pushMatrix() ;
    rotate(i * HALF_PI) ;
    if (i == 0 || i == 3) {
      pushMatrix() ;
      translate(0, axisRadius) ;
      triangle(0, 0, - 5, - 5, 5, - 5) ;
      switch (i) {
      case 0:
        text("y", - 15, - 10) ;
        break ;
      case 3:
        pushMatrix() ;
        translate(- 20, - 10) ;
        rotate(HALF_PI) ;
        text("x", 0, 0) ;
        popMatrix() ;
      }
      popMatrix() ;
    }
    line(0, 0, 0, axisRadius) ;
    popMatrix() ;
  }
  popMatrix() ;
}
