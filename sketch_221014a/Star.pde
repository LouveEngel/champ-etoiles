class Star {
  float x;
  float y;
  float z;
  float scalefactor;
  
  float pz;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(0, width*2);
    scalefactor = 0;
    pz = z;
  }
  
  void update() {
    z = z - speed;
    if (z < 1) {
      z = width*2;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }
  
  void show() {
    float rouge = random(0, 255);
    float vert = random(0, 255);
    float bleu = random(0, 255);
    fill(rouge, vert, bleu);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    scalefactor = map (z, width*2, 0, 0, 1);
    //ellipse(sx, sy, r, r);
    
    quad(sx,sy,sx-8*scalefactor,sy+21*scalefactor,sx,sy+14*scalefactor,sx+8*scalefactor,sy+21*scalefactor);
    triangle(sx,sy+14*scalefactor,sx-14*scalefactor,sy+7*scalefactor,sx+14*scalefactor,sy+7*scalefactor);
    
    float px1 = map(x / pz, 0, 1, 0, width);
    float py1 = map(y / pz, 0, 1, 0, height);
    
    pz = z;
    
    stroke(rouge, vert, bleu);
    line(px1, py1, sx, sy);
    line(px1+14*scalefactor, py1+7*scalefactor, sx+14*scalefactor, sy+7*scalefactor);
    line(px1-8*scalefactor, py1+21*scalefactor, sx-8*scalefactor, sy+21*scalefactor);
    line(px1+8*scalefactor, py1+21*scalefactor, sx+8*scalefactor, sy+21*scalefactor);
    line(px1-14*scalefactor, py1+7*scalefactor, sx-14*scalefactor, sy+7*scalefactor);
  }
}
