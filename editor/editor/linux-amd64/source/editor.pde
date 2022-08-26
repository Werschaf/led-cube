

import controlP5.*;

ControlP5 cp5;

ScrollableList list;

float i = 0;

ArrayList<Cube> frames = new ArrayList<Cube>();

int from_x, from_y = 0;
int to_x, to_y = 0;

boolean mouse_pressed = false;

void setup() {
  size(1250, 780, P3D);
  surface.setResizable(true);
  camera(0, 0, 0, width*3/5, height/2-30, 0.0, 
       0.0, 1.0, 0.0);
  
  
  //translate(width*3/5, height/2,0);
  
  //frames.add(new Cube());
  
  UI();
}

void draw() {
  background(50);
  lights();
  print(width);
  print("\n");
  print(height);
  print("\n");
  
  pushMatrix();
  
  translate(width*3/5, height/2-30,0);
  rotateX(0);
  rotateY(90);
  rotateZ(i);
  int spacing = 90;
  
  for (int k = -2; k <= 2 ; k++) {
    for (int j = -2; j <= 2; j++) {
      for (int i = -2; i <= 2; i++) {
        
        pushMatrix();
        
        translate(k*spacing, j*spacing, i*spacing);
        
        
        noStroke();
        fill(0,0,0,70);
        sphere(width/100);
        //fill(0,255,0,128);
        
        popMatrix();
        
        //layers[i][j][k] = 0;
      
      }
    }
  }
  
  
  translate(0, 3*spacing, 0);
  
  box(400, 50, 400);
  
  popMatrix();
  
  pushMatrix();
  
  translate(width-60, height-60, 0);
  rotateX(0);
  rotateY(90);
  rotateZ(i);
  
  // making toggle cube ## experimental
  pushMatrix();
  fill(255, 255, 255, 150);
  box(40);
  translate(-20, -20, 0);
  fill(255, 0, 0);
  box(10, 10, 40);
  translate(0, 0, -20);
  rotateX(PI/2);
  box(15, 15, 15);
  popMatrix();
  // end toggle cube
  
  popMatrix();
  
  i += 0.01;
  
  line(from_x, from_y, to_x, to_y);
}

void mousePressed(){
   if (mouse_pressed) {
     
   }
  
  if (mouseButton==LEFT) { 
    from_x = mouseX;
    from_y = mouseY;
    mouse_pressed = true;
  }
}

void UI() {
  cp5 = new ControlP5(this);
  var arial = createFont("arial",20);
  
  // ListVIew for the Frames
  ArrayList l = new ArrayList();
  
  for (int i = 0; i < 80; i++) {
    l.add(str(i));
  }
  
  list = cp5.addScrollableList("Layers")
     .setPosition(5, 5)
     .setSize(150, height-5)
     .setBarHeight(40)
     .setItemHeight(30)
     .addItems(l)
     ;
     
  list.onRelease(new CallbackListener() {
  public void controlEvent(CallbackEvent theEvent) {
    list.setOpen(true);
    }
  });
  
  // new Frame Button
  cp5.addButton("New Frame")
     .setValue(0)
     .setPosition(165, 5)
     .setSize(150,40)
     ;
     
  // delete Frame Button
  cp5.addButton("Delete Frame")
     .setValue(0)
     .setPosition(165, 55)
     .setSize(150,40)
     ;
     
  // set FrameTime
  cp5.addTextfield("Frame Time")
     .setPosition(165, 105)
     .setSize(150,40)
     .setFont(arial)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
   // set FrameTime
  cp5.addTextfield("File Name")
     .setPosition(165, height-155)
     .setSize(150,40)
     .setFont(arial)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
  // delete Frame Button
  cp5.addButton("Save File")
     .setValue(0)
     .setPosition(165, height-95)
     .setSize(150,40)
     //.setColorBackground(color(255, 255, 255))
     ////.setColorForeground(color(0, 0, 0))
     //.setColorActive(color(10, 10, 10))
     ;
     
  // delete Frame Button
  cp5.addButton("Open File")
     .setValue(0)
     .setPosition(165, height-45)
     .setSize(150,40)
     ;
     
   //cp5.addTextlabel("label")
   //                 .setText("A single ControlP5 textlabel, in yellow.")
   //                 .setPosition(100,50)
   //                 .setColorValue(0xffffff00)
   //                 .setFont(createFont("Georgia",20))
   //                 ;
                    
  
}

void updateFrames() {
  list.clear();
  int i = 0;
  ArrayList new_frames = new ArrayList();
  for (Cube frame : frames) {
    new_frames.add("Frame: " + str(i));
  }
  list.addItems(new_frames);
}
