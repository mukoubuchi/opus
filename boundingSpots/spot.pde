class Spot {
   float x, y, diam ;
   float oRad, theta, dt ; // oRad: orbital radius
   color col ;

   Spot(float diam_, float oRad_, float dt_, color col_) {
      diam = diam_ ;
      oRad = oRad_ ;
      dt = dt_ ;
      col = col_ ;
   }

   void display() {
      float sigma = abs(theta - PI) ;
      x = oRad * cos(sigma) ;
      y = - oRad * sin(sigma) ;
      fill(col) ;
      ellipse(x, y, diam, diam) ;
   }

   void update() {
      theta = (theta + dt) % TWO_PI ;
   }
}
