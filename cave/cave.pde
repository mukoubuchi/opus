//
// [Copyright] 2017 Shin'ichi Sato. All rights reserved.
//

Cave cave ;

class Cave {

   class Player {

      class Score {
         int number ;
         PFont font ;

         Score() {
            font = loadFont("ProcessingSansPro-Semibold-24.vlw") ;
            textFont(font) ;
            number = 0 ;
         }
      }

      static final int WIDTH = 50 ;
      static final int HEIGHT = 50 ;
      PImage alien ;
      PVector location ;
      PVector velocity ;
      Score score ;

      Player() {
         velocity = new PVector(0, 3) ;
         score = new Score() ;
         alien = loadImage("alien.gif") ;
         location = new PVector(WIDTH, height / 2) ;
      }

      void reverseVelocity() {
         velocity.mult(- 1) ;
      }

      void update() {
         score.number += 10 ;
         location.add(velocity) ;
      }

      void display() {
         image(alien, location.x, location.y, WIDTH, HEIGHT) ;
      }
   }

   class Hole {
      static final int WIDTH = 10 ;
      static final int HEIGHT = 400 ;
      PVector location ;

      Hole(PVector loc) {
         location = loc.copy() ;
      }
   }

   Player player ;
   ArrayList<Hole> holes ;
   int slope ;
   color colour ;
   PImage bang ;
   String usage ;

   Cave() {
      slope = int(random(1, 6)) ;
      colour = #000000 ;
      player = new Player() ;
      holes = new ArrayList<Hole>() ;
      for (int i = 0 ; i < width / Hole.WIDTH ; i++) {
         holes.add(new Hole(new PVector(i * Hole.WIDTH, 100))) ;
      }
      bang = loadImage("bang.gif") ;
      usage = new String("[SPACE] reverse the falling direction of the player") ;
   }

   void display() {
      fill(colour) ;
      for (Hole h: holes) {
         rect(h.location.x, h.location.y, Hole.WIDTH, 400) ;
      }
      player.display() ;
      text(usage, 30, height - 24) ;
      if (checkCollision()) {
         image(bang, player.location.x, player.location.y, Player.WIDTH, Player.HEIGHT) ;
         noLoop() ;
      }
      text(player.score.number, width - 30 - textWidth(str(player.score.number)), 40) ;
   }

   void update() {
      player.update() ;
      scroll() ;
   }

   void scroll() {
      Hole headHole = new Hole(new PVector(0, 0)) ;
      headHole.location = holes.get(holes.size() - 1).location.copy() ;
      if (headHole.location.y + slope <= 0 || headHole.location.y + slope + Hole.HEIGHT >= height) {
         int sign = slope > 0 ? - 1: 1 ;
         slope = sign * int(random(1, 6)) ;
      }
      headHole.location.x += Hole.WIDTH ;
      headHole.location.y += slope ;
      holes.add(headHole) ;
      holes.remove(0) ;
      for (int i = 0 ; i < holes.size() ; i++) {
         holes.get(i).location.x -= Hole.WIDTH ;
      }
   }

   boolean checkCollision() {
      if (player.location.y <= holes.get(0).location.y ||
          player.location.y >= holes.get(0).location.y - Player.HEIGHT + Hole.HEIGHT) {
         return true ;
      }
      return false ;
   }
}

void keyPressed() {
   if (key == ' ') {
      cave.player.reverseVelocity() ;
   }
}

void setup() {
   size(800, 600) ;
   cave = new Cave() ;
}

void draw() {
   background(255) ;
   cave.display() ;
   cave.update() ;
}
