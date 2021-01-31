Spot sp ;
ArrayList<Spot> spots ;

void setup() {
   size(700, 350) ;
   colorMode(HSB, 300) ;
   background(0) ;
   noStroke() ;

   spots = new ArrayList<Spot>() ;
   for (int oRad = 300 ; oRad > 0 ; oRad -= 15) {
      spots.add(new Spot(
                         10,
                         oRad,
                         PI / oRad,
                         color(oRad, 300, 200))) ;
   }
}

void draw() {
   fill(0, 10) ;
   rect(0, 0, 700, 350) ;

   translate(width / 2, height - 25) ;
   for (Spot sp: spots) {
      sp.update() ;
      sp.display() ;
   }
}