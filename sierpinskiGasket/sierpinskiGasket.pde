Gasket gasket ;
float initialRadius ;
float minRad = 10 ;

void setup() {
   size(800, 800) ;
   noFill() ;
   background(255) ;
   translate(width / 2, height / 2) ;
   initialRadius = width * 0.48 ;
   gasket = new Gasket(
                       new PVector(),
                       initialRadius,
                       minRad
                       ) ;

   gasket.display() ;
}
