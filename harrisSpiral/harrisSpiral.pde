//
// [unfinished]
//

Rectangle rectangle ;

void setup() {
  size(795, 600) ;
  background(255) ;
  noFill() ;

  rectangle = new Rectangle(
                            new PVector(),
                            new PVector(width, height)
                            ) ;

  for (Rectangle r: rectangle.children) {
    r.display() ;
  }
}

class Rectangle {
  PVector location ;
  PVector sideLen ;
  ArrayList<Rectangle> children ;

  Rectangle(PVector location, PVector sideLen) {
    this.location = location.copy() ;
    this.sideLen = sideLen.copy() ;
    children = new ArrayList<Rectangle>() ;
    if (sideLen.x > 10) nextGeneration() ;
  }

  void nextGeneration() {
    PVector largeChildRectLoc = new PVector(
                                            location.x,
                                            sideLen.y
                                            ) ;
    PVector largeChildRectLen = new PVector(
                                            sideLen.y,
                                            sq(sideLen.y) / sideLen.x
                                            ) ;

    /**
     * write your codes both of the
     * smallChildRectLoc and smallChildRectLen
     * here !
     */

    children.add(new Rectangle(
                               largeChildRectLoc,
                               largeChildRectLen
                               )) ;
  }

  void display() {
    pushMatrix() ;

    translate(location.x, location.y) ;

    rotate(-HALF_PI) ;

    beginShape() ;
    vertex(0, 0) ;
    vertex(0, sideLen.y) ;
    vertex(sideLen.x, sideLen.y) ;
    vertex(sideLen.x, 0) ;
    endShape(CLOSE) ;

    float squareLen = sq(sideLen.y) / sideLen.x ;
    float squareRad = squareLen / 2 ;
    float arcDiameter = squareLen * sqrt(2) ;
    arc(squareRad, sideLen.y - squareRad,
        arcDiameter, arcDiameter,
        QUARTER_PI, PI - QUARTER_PI
        ) ;

    for (Rectangle r: children) {
      r.display() ;
    }

    popMatrix() ;
  }
}
