 Mover mover;
Shooting ball;
Npc npc;


ArrayList<Npc> npcc = new ArrayList<Npc>();


float gameTime;

void setup () {
  size(720, 720);
  setBackground();
  //mover=new Mover(new PVector(5));
  mover=new Mover(new PVector(height/2,width/2),new PVector(-1,1));
  ball=new Shooting(new PVector(width/2, height/2),new PVector(-1,1));
  npc=new Npc(new PVector(width/2,height/2), new PVector(random(1,5), random(1,5)));
  
  
  for(int i=1;i<=5;i++){
  npcc.add(new Npc(new PVector(width/i,height/2), new PVector(random(1,5), random(1,5))));
  }
 
}

void draw() {

  background(255);
//for(int i=0;i<=width;i+=2){
//for(int j=i;j<=height;j+=2){
//image(background, width/i, height/i);
//}

image(background, 0, 0);
image(background, height/2, width/2);
image(background, height/2, 0);
image(background, 0, height/2);
 
  mover.display();
npc.display();
isAttack();
GUI_bar();
  gameTime += 1/frameRate;
  //startGame();
 for (int i = 0; i < npcc.size(); i++) {
 Npc ppc1 = npcc.get(i);
  ppc1.display();
}

isAttack();


}
void isAttack(){
if(ball.location.x==npc.location.x||ball.location.y==npc.location.y){
npc.delete();


}
}
