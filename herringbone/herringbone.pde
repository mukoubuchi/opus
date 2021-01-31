void setup() {
  size(500, 500) ;
  // stroke(0, 0, 255) ;
  for (int x = -width ; x < 2 * width ; x += 200) {
    for (int xx = x, y = 0 ; y < height ; y += 50, xx += 50) {
      line(xx, y, xx + 150, y) ;
    }
  }
  // stroke(255, 0, 0) ;
  for (int y = -height - 50 ; y < 2 * height ; y += 200) {
    for (int yy = y, x = 0 ; x < width ; x += 50, yy += 50) {
      line(x, yy, x, yy + 150) ;
    }
  }
}
