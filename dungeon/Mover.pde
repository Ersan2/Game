class Mover extends GameObject {

  ArrayList<Shooting> shot;
  PVector dir;
  PVector aimDirection;



  Mover(PVector l, PVector v) {
    super(l, v);
    shot=new ArrayList<Shooting>();

  }

  void display() {
    fill(0, 255, 0);

    circle(location.x, location.y, 50);
    noFill();
  
  shotDir();
  fire();
  
  update();
}

void update() {
  if (keyPressed) {
    moveWithKey();
    checkEdges();
  }
  
  direction();
}

void direction (){

if(key=='4'){
  
  shot.add(new Shooting(new PVector(location.x,location.y), new PVector(-1,0)));
  
}
if(key=='5'){

  shot.add(new Shooting(new PVector(location.x,location.y), new PVector(0,1)));
}
if(key=='6'){
   shot.add(new Shooting(new PVector(location.x,location.y), new PVector(1,0)));
}

if(key=='8'){  
  shot.add(new Shooting(new PVector(location.x,location.y), new PVector(0,-1)));
}

}

void checkEdges() {
  if (location.x > width-30) {
    velocity.x *= -0.5 ;
    location.x = width-30;
  } else if (location.x < 30) {
    velocity.x *= -1;
    location.x = 30;
  }

  if (location.y > height-30) {
    velocity.y *= -0.7;
    location.y = height-30;
  } else if (location.y < 30) {
    velocity.y *= -1;
    location.y = 30;
  }
}


float stepSize = 5;
void moveWithKey() {
  PVector dirKey = location;

  if (key == 'a' || key == 'A') {
    dirKey.x -= stepSize;
  }
  if (key == 'd' || key == 'D') {
    dirKey.x += stepSize;
  }
  if (key == 'w' || key == 'W') {
    dirKey.y -= stepSize;
  }
  if (key == 's' || key == 'S') {
    dirKey.y += stepSize;
  }
    

  // Calculate movement position
  //PVector dir = PVector.sub(dirKey, location);
  //dir.mult(0.8);
  //velocity = dir;
}

void shotDir() {

  PVector mouse = new PVector(location.x, location.y);
  PVector dir = PVector.sub(mouse, location);
  // dir.normalize();
  //dir.mult(150);

  aimDirection = PVector.add(location, dir);
  velocity = dir;
  if (key=='4') {
    aimDirection.x-=30;
    //shot.add(new Shooting(location,dir));
  }
  if (key=='5') {
    aimDirection.y+=30;
  }
  if (key=='6') {
    aimDirection.x+=30;
  }
  if (key=='8') {
    aimDirection.y-=30;
    //shot =new Shooting(location,vel);
    //shot.display();
    //shot.add(new Shooting(location, new PVector(aimDirection.x-25, aimDirection.y-25)));
  }

  fill(255, 0, 0);
  circle(aimDirection.x, aimDirection.y, 30);
}

void fire() {

  for (int i=shot.size()-1; i>=0; i--) {
    Shooting f = shot.get(i);
    println("add");
    //println(location.x);
    //println(aimDirection);
 //shot.printer();
  
    f.display();
    if ((f.location.x > width-30 || f.location.x < 0 )|| (f.location.y > height || f.location.y < 0)) {
      println("removed");
      shot.remove(i);
    }
  }
}
void shooting(PVector l, PVector dir){
shot.add(new Shooting (l,dir));
println("adding");
}
}
