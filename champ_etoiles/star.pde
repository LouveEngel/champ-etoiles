
// Classe étoile
class Star {
  
  // Position et taille
  float x;
  float y;
  float z;
  float scalefactor;
  float pz;
  
  // Initialisation aléatoire
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(0, width * 2);
    scalefactor = 0;
    pz = z;
  }
  
  // Met à jour la position
  void update() {
    z -= speed;
    if (z < 1) {
      z = width * 2;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }
  
  // Affiche l'étoile
  void show() {
    
    // Couleur aléatoire
    float rouge = random(0, 255);
    float vert = random(0, 255);
    float bleu = random(0, 255);
    fill(rouge, vert, bleu);
    noStroke();
    
    // Nouvelle position
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    // Taille en fonction de z
    scalefactor = map (z, width * 2, 0, 0, 1);
    
    // L'étoile
    quad(sx, sy, sx - 8 * scalefactor, sy + 21 * scalefactor, sx, sy + 14 * scalefactor, sx + 8 * scalefactor, sy + 21 * scalefactor);
    triangle(sx, sy + 14 * scalefactor, sx - 14 * scalefactor, sy + 7 * scalefactor, sx + 14 * scalefactor, sy + 7 * scalefactor);
    
    // Ancienne position
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);
    pz = z;
    
    // Les lignes 
    stroke(rouge, vert, bleu);
    line(px, py, sx, sy);
    line(px + 14 * scalefactor, py + 7 * scalefactor, sx + 14 * scalefactor, sy + 7 * scalefactor);
    line(px - 8 * scalefactor, py + 21 * scalefactor, sx - 8 * scalefactor, sy + 21 * scalefactor);
    line(px + 8 * scalefactor, py + 21 * scalefactor, sx + 8 * scalefactor, sy + 21 * scalefactor);
    line(px - 14 * scalefactor, py + 7 * scalefactor, sx - 14 * scalefactor, sy + 7 * scalefactor);
  }
}
