class Shooting  {
PVector location;
PVector velocity;
  
  
  Shooting(){}
Shooting (PVector l, PVector v){
location=l;
velocity=v;
  velocity.mult(5);

}
void display(){
  fill(0,255,255);
  circle(location.x,location.y,20);
 update();
}
void update(){
location.add(velocity);

}


}
