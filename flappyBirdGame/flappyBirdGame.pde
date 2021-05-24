//Global Variables
//////////////////////////////////////
                                    //
//The y-coordinate of the bird      //
float yPos = 75;                    //
                                    //
//The falling velocity of the bird  //
float yVelocity = 0;                //
                                    //
//The gravity factor                //
float gravity = 0.12;               //
                                    //
//Bird image asset                  //
PImage bird;                        //
                                    //
//x-coordinate of the pipe          //
float xPos = 700;                   //
                                    //
//x-coordinate of the second pipe   //
float xPosSecond = 1020;            //
                                    //
//height of the first pipe          //
float pipeHeight1 = 150;            //
                                    //
//height of the second pipe         //
float pipeHeight2 = 200;            //
                                    //
//whether or not the game is over   //
boolean dead;                       //
                                    //
//The score                         //
int score = 0;                      //
//////////////////////////////////////

void setup()
{
  size(500,800);
  bird = loadImage("bird.png");

  
}

void draw(){
  
  background(113,197,218);
//background details


  if ((xPos+100 < 115 && xPos+100 > 111)||(xPosSecond+100 < 115 && xPosSecond+100 > 111)){
    score++;
  }


  if (xPos <= 185 && xPos+100 >= 115){
    if (yPos+45 >= 586-pipeHeight1 || yPos <= 450-pipeHeight1){
      dead = true;
    }
  }
  else if(xPosSecond <= 185 && xPosSecond+100 >= 115){
      if (yPos+45 >= 586-pipeHeight2 || yPos <= 450-pipeHeight2){
      dead = true;
    }
  }
    

   //moving pipe
    
   if (xPos <= -150){
     xPos = 500;
     pipeHeight1 = random(150,300);
   }
   else{
     if (dead == false){
       xPos -=2.5;
     }
   }
    
   if (xPosSecond <= -150){
     xPosSecond = 500;
     pipeHeight2 = random(100,500);
   }
   else{
     if (dead == false){
       xPosSecond -=2.5;
      }
    }
    
   //height of pipe
    
   //pipe 1  
   //bottom
     
   fill(88,64,73);
   rect(xPos-4,596-pipeHeight1,108,pipeHeight1+4);
    
   fill(116, 191, 46);
   rect(xPos,600-pipeHeight1,100,pipeHeight1);
    
   fill(88,64,73);
   rect(xPos-9,586-pipeHeight1,118,38);
    
   fill(116, 191, 46);
   rect(xPos-5,590-pipeHeight1,110,30);
    
      //top
   fill(88,64,73);
   rect(xPos-4,0,108,426-pipeHeight1);
    
   fill(116, 191, 46);
   rect(xPos,0,100,420-pipeHeight1);
    
   fill(88,64,73);
   rect(xPos-9,416-pipeHeight1,118,38);
    
   fill(116, 191, 46);
   rect(xPos-5,420-pipeHeight1,110,30);
    
   //pipe 2
    
   //bottom
      
   fill(88,64,73);
   rect(xPosSecond-4,596-pipeHeight2,108,pipeHeight2+4);
    
   fill(116, 191, 46);
   rect(xPosSecond,600-pipeHeight2,100,pipeHeight2);
    
   fill(88,64,73);
   rect(xPosSecond-9,586-pipeHeight2,118,38);
    
   fill(116, 191, 46);  
   rect(xPosSecond-5,590-pipeHeight2,110,30);
    
     //top
  
  
   fill(88,64,73);
   rect(xPosSecond-4,0,108,426-pipeHeight2);
    
   fill(116, 191, 46);
   rect(xPosSecond,0,100,420-pipeHeight2);
    
   fill(88,64,73);
   rect(xPosSecond-9,416-pipeHeight2,118,38);
    
   fill(116, 191, 46);
   rect(xPosSecond-5,420-pipeHeight2,110,30);
  
  //blue sky
  fill(221,216,148);
  rect(0,600,500,800);
  
  
  //grass and dirt
  for (int i=0;i<491;i+=10){
    if (i/10 %2 == 0){
      fill(93,139,36);
    }
    else{
      fill(153,229,83);
    }
    noStroke();
    rect(i,600,i+10,10);
    
  }

  
  

//bird
  image(bird,115,yPos,75,45);

  
  yVelocity += gravity;
  yPos += yVelocity;
  if(yPos >= 565){
    noLoop();
  }
  
  fill(255);
  textSize(32);
  text(str(score),250,100);


}

void keyReleased(){
  if (dead == false){
    if (key == ' '){
      yPos-=70;
      yVelocity=0;
    }
  }
}

  
