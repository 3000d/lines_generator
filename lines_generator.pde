/*Simple Repeating Wave Pattern
 Ira Greenberg, October 13, 2005
 */
import processing.dxf.*;


import controlP5.*;
import java.awt.Frame;
import java.awt.BorderLayout;

ControlP5 cp5;
ControlFrame cf;
boolean record = false;
float margin = 30;
float y, x;
float angle = 0;
float amplitude = 12;
float waveGap = 35;
float frequency = .3;
float prevX, prevY=30;
float step = 1;
float weight = 1;

static final int H_LINES =1;
static final int V_LINES = 2;
static final int TRIANG = 3;
int drawingType =1;

void setup() {
  size(800, 600, P3D);
  background(0);
  stroke(255);
  noFill();
  y = x = margin/2;
  cp5 = new ControlP5(this);
  cf = new ControlFrame(this, 400, 400, "Controls");

  prevX = 10;
  frameRate(30);
}
void draw() {
  background(0);
  reset();
  drawFrame();
  drawSelected();
}

void export(File file) {
  if (file != null) {
    String fileName = file.getAbsolutePath(); 
    beginRaw(DXF, fileName+".dxf"); // Start recording to the file
    noLoop();
    reset();
    drawFrame();
    drawSelected();
    endRaw();
    loop();
  }
}

void drawSelected(){
 switch(drawingType) {
    case V_LINES:{
     drawVLines();
     break; 
    }
    case H_LINES:{
      drawLines();
     break; 
    }
    case TRIANG:{
     drawTriangles();
     break; 
    }
  } 
}

void drawingType(int a){
  if(a >0 && a <4){
    drawingType = a;
  } 
 
}

void initExport(){
  selectOutput("Export to dxf", "export");
}

void keyPressed() {
  if (key=='s') {
    saveFrame("lines_#####.png");
  } 
  if (key == 'R' || key == 'r') { // Press R to save the file
    initExport();
  }
}

