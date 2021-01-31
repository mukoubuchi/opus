class Gasket {
   PVector location ;
   float radius ;
   ArrayList<Gasket> children ;
   float minRad ;

   Gasket(PVector location, float radius, float minRad) {
      this.location = location.copy() ;
      this.radius = radius ;
      this.minRad = minRad ;
      children = new ArrayList<Gasket>() ;
      if (radius > minRad) nextGeneration() ;
   }

   void nextGeneration() {
      float radius = this.radius / 2 ;
      for (int i = 0 ; i < 3 ; i++) {
         float theta = i * TWO_PI / 3 ;
         PVector childLocation = new PVector(
                                 radius * cos(theta),
                                 radius * sin(theta)
                                 ) ;
         children.add(new Gasket(childLocation, radius, minRad)) ;
      }
   }

   void display() {
      pushMatrix() ;

      translate(location.x, location.y) ;

      beginShape() ;
      for (int i = 0 ; i < 3 ; i++) {
         float theta = i * TWO_PI / 3 ;
         vertex(radius * cos(theta), radius * sin(theta)) ;
      }
      endShape(CLOSE) ;

      for (Gasket g: children)
         g.display() ;

      popMatrix() ;
   }
}
