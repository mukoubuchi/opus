int diam = 100 ;

size(400, 400) ;
noFill() ;

for (int x = 0 ; x < width + diam ; x += diam) {
  for (int y = 0 ; y < height + diam ; y += diam) {
    ellipse(diam / 2 + x, diam / 2 + y, diam, diam) ;
  }
}

for (int x = 0 ; x < width + diam / 2 ; x += diam) {
  for (int y = 0 ; y < height + diam / 2 ; y += diam) {
    ellipse(x, y, diam, diam) ;
  }
}
