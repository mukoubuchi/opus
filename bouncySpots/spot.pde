final float SPRING = 0.05 ;
final float GRAVITY = 0.03 ;
final float FRICTION = - 0.9 ;

class Spot {
   float x, y, diam ;
   float velX, velY ;
   color col = color(random(255), 255, 255, random(55, 200)) ;

   Spot(float x_, float y_, float diam_) {
      x = x_ ;
      y = y_ ;
      diam = diam_ ;
   }

   void display() {
      fill(col) ;
      ellipse(x, y, diam, diam) ;
   }

   void move() {
      velY += GRAVITY ;
      x += velX ;
      y += velY ;
      if (x + diam / 2 > width) {
         x = width - diam / 2 ;
         velX *= FRICTION ;
      }
      else if (x - diam / 2 < 0) {
         x = diam / 2 ;
         velX *= FRICTION ;
      }
      if (y + diam / 2 > height) {
         y = height - diam / 2 ;
         velY *= FRICTION ;
      }
      else if (y - diam / 2 < 0) {
         y = diam / 2 ;
         velY *= FRICTION ;
      }
   }

   void collide() {
      for (Spot other: spots) {
         if (this.equals(other)) { // except for the self object
            return ;
         } else {
            float difX = other.x - x ;
            float difY = other.y - y ;
            float distance = sqrt(difX * difX + difY * difY) ;
            float minDist = other.diam / 2 + diam / 2 ;
            if (distance < minDist) {
               float angle = atan2(difY, difX) ;
               float targetX = x + cos(angle) * minDist ;
               float targetY = y + sin(angle) * minDist ;
               float accX = (targetX - other.x) * SPRING ;
               float accY = (targetY - other.y) * SPRING ;
               velX -= accX ;
               velY -= accY ;
               other.velX += accX ;
               other.velY += accY ;
            }
         }
      }
   }
}
