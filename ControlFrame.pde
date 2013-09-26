class ControlFrame extends PApplet {
  int w, h;
  Object parent;
  ControlP5 cp5;

  public ControlFrame(Object _parent, int _w, int _h, String _name) {
    parent = _parent;
    w = _w;
    h = _h;
    Frame f = new Frame(_name);
    f.add(this);
    this.init();
    f.setTitle(_name);
    f.setSize(this.w, this.h);
    f.setLocation(100, 100);
    f.setResizable(false); 
    f.setVisible(true);
  }

  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);
    cp5.addSlider("amplitude").plugTo(parent, "amplitude").setRange(-100, 100).setValue(25).setPosition(10, 10);
    cp5.addSlider("Wave Gap").plugTo(parent, "waveGap").setRange(2, 200).setValue(50).setPosition(10, 30);
    cp5.addSlider("Frenquency").plugTo(parent, "frequency").setRange(0.1, 200).setValue(150).setPosition(10, 50);
    cp5.addSlider("Step").plugTo(parent, "step").setRange(1, 100).setPosition(10, 80);
    cp5.addRadioButton("drawingType").plugTo(parent, "drawingType").setPosition(10,100)
       .addItem("H lines", 1).addItem("V Lines",2).addItem("Triangles",3).activate(0);
    cp5.addButton("export").plugTo(parent,"initExport").setPosition(10,150);
    // cp5.addSlider("Epaisseur").plugTo(parent, "weight").setRange(1, 5).setPosition(10, 110);
    
    
  }

  public void draw() {
  }
  public ControlP5 control() {
    return cp5;
  }
  private ControlFrame() {
  }
}

