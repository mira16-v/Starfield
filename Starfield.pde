Warp [] data;
void setup()
{
  //frameRate(2);
  size(1000, 1000);
  data = new Warp[1000];
  for(int i = 0; i < 1; i++){
	data[i] = new enterprise();
  }
  for(int i = 1; i < data.length; i++){
	data[i] = new Warp();
  }
}
void draw()
{
  background(0);
  for(int i = 0; i < 1000; i++){
	if(i%2 == 0){
  	fill(255);
  	ellipse((int)(Math.random()*1000), (int)(Math.random()*1000), (int)(Math.random()*5)+1, (int)(Math.random()*5)+1);
	}
  }
  for(int i = 0; i < 1000; i++){
	data[i].show();
	data[i].warp();
  }
}
class Warp{
  int myColor, headMove;
  double myX, myY, mySpeed, myAngle, mySize;
  Warp(){
	myX = mouseX;
	myY = mouseY;
	myAngle = (Math.random()*(2*Math.PI));
	mySpeed = (Math.random()*10)+9;
	myColor = (int)(Math.random()*255);
	mySize = 300;
	headMove = mouseY;
  }
  void show(){
	fill((int)(Math.random()*245)+42, (int)(Math.random()*36)+35, (int)(Math.random()*255)+35);
	noStroke();
	ellipse((int)myX, (int)myY, (int)mySize/50, (int)mySize/200);
	//line((int)myX+50, (int)myY, (int)myX+150, (int)myY);

	ellipse((int)myX, (int)myY, 2.5, 10);
	//line((int)myX, (int)myY-50, (int)myX, (int)myY-150);

	//line((int)myX+25, (int)myY-25, (int)myX+148, (int)myY-148);
	//line((int)myX+25, (int)myY+25, (int)myX+148, (int)myY+148);
	//line((int)myX-25, (int)myY-25, (int)myX-148, (int)myY-148);
	//line((int)myX-25, (int)myY+25, (int)myX-148, (int)myY+148);
    
  }
  void warp(){
	myX = myX - (Math.cos(myAngle)*mySpeed);
	myY = myY - (Math.sin(myAngle)*mySpeed);
  }
}

void mouseClicked(){
  data = new Warp[1000];
  for(int i = 0; i < 1; i++){
	data[i] = new enterprise();
  }
  for(int i = 1; i < data.length; i++){
	data[i] = new Warp();
  }
}

class enterprise extends Warp//inherits from Particle
{ //reinitialize all the member variables and override show and move with new functions
  enterprise(){
	myAngle = (Math.random()*(2*Math.PI));
	mySpeed = (Math.random()*5)+3;
	myColor = (int)(Math.random()*255);
	mySize = 100;
 	}
  void show(){
	fill(222, 219, 219);
	stroke(222, 219, 219);
	line((int)myX-((int)mySize/8), (int)myY+((int)mySize*0.4), (int)myX-((int)mySize/2), (int)myY+((int)mySize*1.2)); //left side arm
	line((int)myX-((int)mySize/8), (int)myY+((int)mySize*0.5), (int)myX-((int)mySize/2), (int)myY+((int)mySize*1.3)); //left side arm
	line((int)myX+((int)mySize/8), (int)myY+((int)mySize*0.4), (int)myX+((int)mySize/2), (int)myY+((int)mySize*1.2)); //right side arm
	line((int)myX+((int)mySize/8), (int)myY+((int)mySize*0.5), (int)myX+((int)mySize/2), (int)myY+((int)mySize*1.3)); //right side arm
    
	ellipse((int)myX, (int)myY+10, (int)mySize/3, (int)mySize*1.9); //torso
	ellipse((int)myX, headMove-50, (int)mySize, (int)mySize); //head
    
	ellipse((int)myX-((int)mySize/2), (int)myY+((int)mySize*1.3), (int)mySize/6, (int)mySize*0.7); //left side
	ellipse((int)myX+((int)mySize/2), (int)myY+((int)mySize*1.3), (int)mySize/6, (int)mySize*0.7);  //right side
  }
  void warp(){
	mySize = mySize*0.95;
	myX = myX + (int)(Math.random()*1);
	myY = myY + (int)(Math.random()*-2)+1;
	headMove = headMove + (int)(Math.random()*-2)+1.8;
  }  
}
