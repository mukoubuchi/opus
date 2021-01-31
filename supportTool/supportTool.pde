PImage logo ;
int w, h ;

int n = 10 ;
ArrayList<PVector> nodes = new ArrayList<PVector>() ;
int target = 0 ;

boolean isSquare = true ;

final int MIN_SIZE = 150 ;

void setup() {
  size(600, 600) ;
  surface.setResizable(true) ;
  w = width ;
  h = height ;
  imageMode(CENTER) ;
  logo = loadImage("img.png") ;
  imageScaling() ;
  drawNodes() ;
}

void drawNodes() {
  for (int i = 0; i < n; i++) {
    nodes.add(new PVector((i + 1) * width / (n + 1), height / 2)) ;
  }
}

void relocateNodes() {
  for (int i = 0; i < nodes.size(); i++) {
    nodes.get(i).set((i + 1) * width / (nodes.size() + 1), height / 2) ;
  }
}

void draw() {
  background(255) ;
  image(logo, width / 2, height / 2, w, h) ;
  noStroke() ;
  fill(255, 200) ;
  rect(0, 0, width, height) ;

  noFill() ;
  stroke(255, 0, 0) ;
  beginShape() ;
  curveVertex(nodes.get(0).x, nodes.get(0).y) ;
  for (int i = 0; i < nodes.size(); i++) {
    curveVertex(nodes.get(i).x, nodes.get(i).y) ;
  }
  curveVertex(nodes.get(nodes.size() - 1).x, nodes.get(nodes.size() - 1).y) ;
  endShape() ;

  stroke(0) ;
  beginShape() ;
  for (int i = 0; i < nodes.size(); i++) {
    vertex(nodes.get(i).x, nodes.get(i).y) ;
  }
  endShape() ;

  fill(0, 255, 0) ;
  for (int i = 0; i < nodes.size(); i++) {
    ellipse(nodes.get(i).x, nodes.get(i).y, 5, 5) ;
  }

  fill(255, 0, 0) ;
  ellipse(nodes.get(target).x, nodes.get(target).y, 5, 5) ;
}

void imageScaling() {
  if (logo.width > logo.height) {
    h = (logo.height * width) / logo.width ;
    w = width ;
  } else {
    w = (logo.width * height) / logo.height ;
    h = height ;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    nodes.add(new PVector(mouseX, mouseY)) ;
    target = nodes.size() - 1 ;
  } else if (mouseButton == RIGHT) {
    if (nodes.size() >= 2 && nodes.size() - 1 > target) {
      nodes.remove(nodes.get(nodes.size() - 1)) ;
    }
  }
}

void mouseMoved() {
  nodes.get(target).set(mouseX, mouseY) ;
}

void keyPressed() {
  if (keyCode == RIGHT) {
    target = min(target + 1, nodes.size() - 1) ;
  } else if (keyCode == LEFT) {
    target = max(0, target - 1) ;
  } else if (key == 'c') { // curve
    printCurveVertex() ;
  } else if (key == 'v') { // vertex
    printVertex() ;
  } else if (key == 'i') { // input
    selectInput("Please select a background image file.", "selectImage") ;
  } else if (key == 'P') { // Plus
    quickScaleupImage() ;
  } else if (key == 'p') { // plus
    scaleupImage() ;
  } else if (key == 'M') { // Minus
    quickScaledownImage() ;
  } else if (key == 'm') { // minus
    scaledownImage() ;
  } else if (key == 'U') { // Up
    quickExpandWindow() ;
  } else if (key == 'u') { // up
    expandWindow() ;
  } else if (key == 'D') { // Down
    quickContractWindow() ;
  } else if (key == 'd') { // down
    contractWindow() ;
  } else if (key == 'r') { // reset
    resetSize() ;
  } else if (key == 'x') { // exchange
    exchangeAspectRatio() ;
  } else if (key == 'f') { // full
    toDisplayAspectRatio() ;
  } else if (key == 's') { // size
    printSize() ;
  }
}

void printCurveVertex() {
  println("beginShape() ; ") ;
  println("curveVertex(" + nodes.get(0).x + ", " + nodes.get(0).y + ") ; ") ;
  for (int i = 0; i < nodes.size() - 1; i++) {
    println("curveVertex(" + nodes.get(i).x + ", " + nodes.get(i).y + ") ; ") ;
  }
  println("curveVertex(" + nodes.get(nodes.size() - 1).x + ", " + nodes.get(nodes.size() - 1).y + ") ; ") ;
  println("endShape() ; ") ;
}

void printVertex() {
  println("beginShape() ; ") ;
  for (int i = 0; i < nodes.size(); i++) {
    println("vertex(" + nodes.get(i).x + ", " + nodes.get(i).y + ") ; ") ;
  }
  println("endShape() ; ") ;
}

void selectImage(File selection) {
  if (selection == null) {
    println("The dialog box was closed.") ;
  } else {
    logo = loadImage(selection.getAbsolutePath()) ;
    imageScaling() ;
  }
}

PVector getWindowLocation() {
  PVector l = new PVector() ;
  java.awt.Frame f = (java.awt.Frame)((processing.awt.PSurfaceAWT.SmoothCanvas) surface.getNative()).getFrame() ;
  l.x = f.getX() ;
  l.y = f.getY() ;
  return l ;
}

void quickExpandWindow() {
  if (w < displayWidth && h < displayHeight) {
    surface.setSize(min(width + 10, displayWidth), min(height + 10, displayHeight)) ;
    // if (width < displayWidth && height < displayHeight) {
    //   PVector location = getWindowLocation() ;
    //   surface.setLocation(int(location.x - 5), int(location.y) - 5) ;
    // }
    relocateNodes() ;
  }
}

void expandWindow() {
  if (w < displayWidth && h < displayHeight) {
    surface.setSize(min(width + 1, displayWidth), min(height + 1, displayHeight)) ;
    relocateNodes() ;
  }
}

void quickContractWindow() {
  if (w > MIN_SIZE && h > MIN_SIZE) {
    surface.setSize(max(width - 10, MIN_SIZE), max(height - 10, MIN_SIZE)) ;
    relocateNodes() ;
  }
}

void contractWindow() {
  if (w > MIN_SIZE && h > MIN_SIZE) {
    surface.setSize(max(width - 1, MIN_SIZE), max(height - 1, MIN_SIZE)) ;
    relocateNodes() ;
  }
}

void quickScaleupImage() {
  if (w < width && h < height) {
    if (logo.width > logo.height) {
      w = min(w + 10, width) ;
      h = (logo.height * w) / logo.width ;
    } else {
      h = min(h + 10, height) ;
      w = (logo.width * h) / logo.height ;
    }
  }
}

void scaleupImage() {
  if (w < width && h < height) {
    if (logo.width > logo.height) {
      w = min(w + 1, width) ;
      h = (logo.height * w) / logo.width ;
    } else {
      h = min(h + 1, height) ;
      w = (logo.width * h) / logo.height ;
    }
  }
}

void quickScaledownImage() {
  if (w > MIN_SIZE && h > MIN_SIZE) {
    if (logo.width > logo.height) {
      w = max(w - 10, MIN_SIZE) ;
      h = (logo.height * w) / logo.width ;
    } else {
      h = max(h - 10, MIN_SIZE) ;
      w = (logo.width * h) / logo.height ;
    }
  }
}

void scaledownImage() {
  if (w > MIN_SIZE && h > MIN_SIZE) {
    if (logo.width > logo.height) {
      w = max(w - 1, MIN_SIZE) ;
      h = (logo.height * w) / logo.width ;
    } else {
      h = max(h - 1, MIN_SIZE) ;
      w = (logo.width * h) / logo.height ;
    }
  }
}

void resetSize() {
  surface.setSize(600, 600) ;
  surface.setLocation(displayWidth / 2 - width / 2, displayHeight / 2 - height / 2) ;
  imageScaling() ;
  relocateNodes() ;
}

void toImageAspectRatio() {
  surface.setSize(w, h) ;
  imageScaling() ;
  relocateNodes() ;
}

void toSquareAspectRatio() {
  if (w < h) {
    surface.setSize(h, h) ;
  } else {
    surface.setSize(w, w) ;
  }
  relocateNodes() ;
}

void toDisplayAspectRatio() {
  surface.setSize(displayWidth, displayHeight) ;
  surface.setLocation(displayWidth / 2 - width / 2, displayHeight / 2 - height / 2) ;
  relocateNodes() ;
}

void exchangeAspectRatio() {
  if (isSquare) {
    toImageAspectRatio() ;
  } else {
    toSquareAspectRatio() ;
  }
  isSquare = !isSquare ;
}

void printSize() {
  println("logo size: " + "(" + w + ", " + h + ")" + "\t" + "window size: " + "(" + width + ", " + height + ")") ;
}
