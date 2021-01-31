void setup() {
  size(500, 500) ;
  // stroke(0, 0, 255) ;
  for (int x = -2 * width ; x < width ; x += 250) {
    for (int xx = x, y = 0 ; y < height ; y += 50, xx += 100) {
      line(xx, y, xx + 150, y) ;
    }
  }
  // stroke(255, 0, 0) ;
  for (int y = -3 * height - 50 ; y < height ; y += 250) {
    for (int yy = y, x = 0 ; x < width ; x += 50, yy += 150) {
      line(x, yy, x, yy + 150) ;
    }
  }
}
