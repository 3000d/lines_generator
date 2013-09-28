/**

  Original algorithm found in "Processing Creative Coding and Computational Art" of Ira Greenberg (http://www.iragreenberg.com)
*/

void drawLines() {
  // stop drawing at the bottom of the sketch window
  if (y<height-margin) {
    float py = 0;
    for (float i=margin/2; i<width-margin/2; i+=step) {
      py = y+sin(radians(angle))*amplitude;
      py=constrain(py, margin/2, height-margin/2);
      line(i, py, prevX, prevY);
      // triangle(i,py,i,prevY,i,prevX);
      angle+=frequency;
      prevX = i;
      prevY = y;
    }
    y+=waveGap;  //step waves down
    prevY+=waveGap;
  }
  else {
    return;
  }

  prevX = 10;
  drawLines();
}

void drawVLines() {
  if (x>width-margin) { 
    return;
  }
  float px = 0;
  for (float i=margin/2;i<height;i+=step) {
    px = x+sin(radians(angle))*amplitude;
    px =constrain(px, margin/2, width-margin/2);
    line(px, i, prevX, prevY);
    angle+=frequency;
    prevY=i;
    prevX=x;
  }
  x+=waveGap;
  prevX+=waveGap;

  prevY=10;
  drawVLines();
}

void reset() {
  y = margin;
  x = margin/2;
  prevY = margin;
  prevX = margin/2;
  angle=0;
}

void drawFrame() {
  strokeWeight(2);
  for (int i = 0; i < 3; i++) {
    line(0, 0, width, 0); // -
    line(width, 0, width, height); // | 
    line(width, height, 0, height); // _
    line(0, height, 0, 0); // |
  }
  strokeWeight(1);
}
void drawTriangles() {
  if (y>height-margin/2)return;
  beginShape(TRIANGLE);
  float mx, my;
  for (float i=margin/2;i<width-margin/2;i+=step) {
    // for(float i = margin/2;i<width;i+=20){
    for (float j =1; j<4;j++) {
      vertex(x,y);
      mx = x+cos(radians(angle))*amplitude;
      my = y+sin(radians(angle))*amplitude;
      vertex(mx, my);
      mx = x - cos(PI)*amplitude;
      my=y-sin(PI)*amplitude;
      vertex(mx, my);
    }
    x+=step;
    angle+=frequency;
  }
  angle=0;
  x = margin/2;
  y+=waveGap;
  endShape();
  drawTriangles();
}

