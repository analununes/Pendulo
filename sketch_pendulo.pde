float x1,y1,x2,y2,x3,y3,x4,y4,x5,y5;
PVector b1,b2,b3,b4,b5;
float comprimento = 200;
float newton = 0;

void setup(){
size(800,400);
b1 = new PVector(0,comprimento);
b2 = new PVector(0,comprimento);
b3 = new PVector(0,comprimento);
b4 = new PVector(0,comprimento);
b5 = new PVector(0,comprimento);
}

void mouseDragged(){
b1 = new PVector( mouseX - 300 ,mouseY -100);
b1.setMag(comprimento);
}

void mouseReleased(){
newton = 1;
}

if (newton == 1){

}

void draw(){
background(200);
rect(225,0,350,50);
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
}
