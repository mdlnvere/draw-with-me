ArrayList<PVector[]> allPaths;
PVector[] currentPath;
int num = 200;

boolean isDrawing = true;

void setup() {
  size(800, 800);
  background(0);
  frameRate(60);
  allPaths = new ArrayList<PVector[]>();
  startNewPath(mouseX, mouseY);
}

void draw() {
 // background(0); 

  for (PVector[] path : allPaths) {
    drawPath(path);
  }

  if (isDrawing) {
    updatePath(currentPath);
  }
}

void mousePressed() {
  isDrawing = !isDrawing; 
  if (isDrawing) {
    startNewPath(mouseX, mouseY);
  }
}

// === Fonctions ===

void startNewPath(float x, float y) {
  PVector[] path = new PVector[num];
  for (int i = 0; i < num; i++) {
    path[i] = new PVector(x, y);
  }
  allPaths.add(path);
  currentPath = path;
}

void updatePath(PVector[] path) {
  for (int i = 1; i < num; i++) {
    path[i - 1].set(path[i]);
  }

  PVector last = path[num - 2];
  PVector target = new PVector(mouseX, mouseY);
  PVector next = PVector.lerp(last, target, 0.25);
  path[num - 1] = next;
}

void drawPath(PVector[] path) {
  stroke(255);
  noFill();
  beginShape();
  for (int i = 0; i < num; i++) {
    curveVertex(path[i].x, path[i].y);
  }
  endShape();
}
