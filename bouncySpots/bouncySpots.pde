/**
 * This sketch was made based on "BouncyBubbles"
 * which is one of the sample sketches in Processing.
 */

ArrayList<Spot> spots = new ArrayList<Spot>() ;

void setup() {
   size(800, 800) ;
   noStroke() ;
   colorMode(HSB) ;
}

void draw() {
   background(255) ;
   for (Spot sp: spots) {
      sp.move() ;
      sp.collide() ;
      sp.display() ;
   }
}
void mousePressed() {
   if (mouseButton == LEFT) {
      spots.add(new Spot(mouseX, mouseY, random(60, 120))) ;
   } else if (mouseButton == RIGHT) {
      spots.remove(spots.size() - 1) ;
   } else {
      spots.removeAll(spots) ;
   }
}
