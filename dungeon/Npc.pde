class Npc extends GameObject {
  boolean isLeaving=false;

  PVector velocity;
  PVector l; 
  Npc(PVector l, PVector d) {
    super(l, d);
    
    velocity=d;
  }


  void display() {
    fill(0,255,255);
    circle(location.x,location.y,50);
    attack();
  
  }



  void update() {
  }
  void attack() {
  location.add(velocity);
    checkEdges();
    
  }
  
  void checkEdges() {
    if (location.x > width-30) {
      velocity.x *= -0.7 ;
      location.x = width-30;
    } else if (location.x < 30) {
      velocity.x *= -1;
      location.x = 30;
    }

    if (location.y > height-30) {
      velocity.y *= -1;
      //location.y = height-120;
    } else if (location.y < 30) {
      velocity.y *= -1;
     // location.y = 30;
    }

}
void delete(){
noFill();

}
}
