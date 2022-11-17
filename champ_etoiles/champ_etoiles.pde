
// Variables
Star[] stars = new Star[2000];
float speed;

/////////////

// Initialisation
void setup() {
  
  // Taille d'écran de 800x800
  size (800, 800);
  
  // Initialise les étoiles
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

// Dessine
void draw() {
  
  // Fond noir
  background(0);
  
  // La vitesse est en fonction de la position de la souris
  speed = map(mouseX, 0, width, 0, 30);
  
  // 0,0 au milieu
  translate(width/2, height/2);
  
  // Met à jour toutes les étoiles
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
