size(600, 600) ;
background(0) ;
fill(255, 30) ;
stroke(255, 30) ; // noStroke() ;
translate(width / 2, height / 2) ;
for(float r = 200 ; r > 0 ; r -= lerp(0.1, 5, r / 200)) {
  rect(0, 0, r, -r) ;
  rotate(-radians(10)) ;
}
