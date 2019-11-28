import processing.sound.*;
SoundFile file;
float dt, t1, t2,EM,omega,Ec1,teta0,h, teta1,teta,at,x,y,posx,posy;
float a1,a2,a3,a4,a5;
float v1,v2,v3,v4,v5,v;
PVector peso;
PVector b1,b2,b3,b4,b5; 
float comprimento = 200;
float newton = 0;
float g = 600.0;
float m = 1;
float vt = 1;//0.99;
float ver = 1.;

void setup(){
size(800,400);
file = new SoundFile(this, "knock.mp3");
b1 = new PVector(0,comprimento);
b2 = new PVector(0,comprimento);
b3 = new PVector(0,comprimento);
b4 = new PVector(0,comprimento);
b5 = new PVector(0,comprimento);

peso = new PVector(0,g);
//v1 = new PVector(1,0);
//v2 = new PVector(0,0);
//v3 = new PVector(0,0);
//v4 = new PVector(0,0);
//v5 = new PVector(0,0);
}

void mouseDragged(){
b1 = new PVector( mouseX - 300 ,mouseY -100);
b1.setMag(comprimento);
}

void mouseReleased(){
newton = 1;
teta = PVector.angleBetween(b1,peso);
h = comprimento - comprimento*cos(teta);
EM = g*h+sq(vt)/2;
v1 = 1;
v5 = 0;
}

boolean colidiu = false;

void draw(){
if (newton == 1){

t2 = millis()/1000.0; 
dt = t2 - t1; 
t2 = t1;

  if (v1>0){
//teta1 = teta0*cos(sqrt(g/comprimento)*t2);
//teta = sqrt(2*g*(cos(teta1)-cos(teta0)/comprimento))*dt;
//teta0 = teta1;
//b1.rotate(teta1);
//b1.setMag(comprimento);
omega = ver*vt/comprimento;
teta -= omega*dt;
x = -comprimento*sin(teta);
y = comprimento*cos(teta);

if (EM < m*g*(comprimento-y)){  
  ver *= -1;
}
else{
vt = sqrt(2*(EM - g*(comprimento-y)));
}
b1 = new PVector(x,y);
}

if (v5>0){
//teta1 = teta0*cos(sqrt(g/comprimento)*dt);
//teta = sqrt(2*g*(cos(teta1)-cos(teta0)/comprimento))*dt;
//teta0 = teta1;
//b5.rotate(teta1);
omega = ver*vt/comprimento;
teta -= omega*dt;
x = -comprimento*sin(teta);
y = comprimento*cos(teta);

if (EM < g*(comprimento-y)){
ver *= -1;
}

vt = sqrt(2*abs(EM - g*(comprimento-y)));

b5 = new PVector(x,y);
//b5.setMag(comprimento);
}


if((b1.copy().sub(b2.copy().add(75,0))).mag() < 76 && v1 > 0){
//  v = v5;
v5 = 1;
v1 = 0;
file.cue(3);
file.play();

println("Col1");
}

else if((b2.copy().sub(b3.copy().add(75,0))).mag() <  75){
//v = v3;
//v3 = 1;
//v2 = 0;
//println("Col2");
}

else if((b3.copy().sub(b4.copy().add(75,0))).mag() <  75){
//v = v4;
//v4 = 1;
//v3 = 0;
//println("Col3");
}


else if((b4.copy().sub(b5.copy().add(75,0))).mag() <  75 && v5 > 0){

//v = v5;
//v5 = v4;
//v4 = v;

println("Col4");
file.stop();
v1 = 1;
v5 = 0;
file.cue(3);
file.play();
}
}

background(200);
rect(225,20,350,30);
fill(0,0,0);
line(250,50,b1.x+250,b1.y+50);
line(325,50,b2.x+325,b2.y+50);
line(400,50,b3.x+400,b3.y+50);
line(475,50,b4.x+475,b4.y+50);
line(550,50,b5.x+550,b5.y+50);
ellipse(b1.x+250,b1.y+50,75,75);
ellipse(b2.x+325,b2.y+50,75,75);
ellipse(b3.x+400,b3.y+50,75,75);
ellipse(b4.x+475,b4.y+50,75,75);
ellipse(b5.x+550,b5.y+50,75,75);
t1 = millis()/1000.0;
}
