class GameObject {
  PVector location; // текуща позиция на обекта
  PVector velocity; // скорост / промяната в позицията във времето / посока на движение
  PVector acceleration;

  boolean direction = true;
  
  

  GameObject(PVector l, PVector v) {
    location=l;
    velocity=v;
    
  }
  void display() {
    // display visuals

    update();
  }

  void update() {

    //velocity.add(acceleration);


    location.add(velocity);

    // acceleration.mult(0);

    checkEdges();
  }
  void checkEdges() {
    if (location.x > width-30) {
      velocity.x *= -0.5 ;
      location.x = width-30;
    } else if (location.x < 30) {
      velocity.x *= -1;
      location.x = 30;
    }

    if (location.y > height-120) {
      velocity.y *= -0.7;
      location.y = height-120;
    } else if (location.y < 30) {
      velocity.y *= -1;
      location.y = 30;
    }
  }
  
  }
