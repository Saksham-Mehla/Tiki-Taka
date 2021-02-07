  boolean gameover= false, right = false, left = false, d = false, a = false, z = false, c = false, n=false, m=false;
  int topscore=0;
  int bottomscore=0;
  int mode = 0;
  float changespeed=0;
  Paddle1 bottom1;
  Paddle2 bottom2;
  Ball pongball;
  Paddle4 top1;
  Paddle3 top2;
  
void setup()
{
  frameRate(100);
  noStroke();
  pongball= new Ball();
  bottom1 = new Paddle1();
  bottom2 = new Paddle2();
  top1 = new Paddle4();
  top2 = new Paddle3();
  top1.y=80 ;          // Coordinates top
  top1.x=100;
  top2.y=190 ;
  top2.x=100;
  bottom1.y = 420;     //  Coordinates bottom
  bottom2.y = 320;
  bottom1.x = 100;
  bottom2.x = 100;
  size(500, 500);
}
void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (key == 'n')
  {
    n=true;
  }
  if (key == 'm')
  {
    m =true;
  }
  if (key == 'a')
  {
    a = true;
  }
  if (key == 'd' )
  {
    d = true;
  }
  if (key == 'z')
  {
    z=true;
  }
  if (key == 'c')
  {
    c=true;
  }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode ==RIGHT)
  {
    right = false;
  }
  if (key == 'n')
  {
    n=false;
  }
  if (key == 'm')
  {
    m=false;
  }
  if (key =='a')
  {
    a=false;
  }
  if (key =='d')
  {
    d=false;
  }
  if (key == 'z')
  {
    z=false;
  }
  if (key == 'c')
  {
    c=false;
  }
}

void draw()
{
  if ( mode == 0 ) //intro screen
  {
    background(255);
    fill(0);
    textSize(30);
    text("Single Player", 150, 70);
    text("Multi Player", 160, 450);
    textSize(50);
    text("Tiki Taka", 140, 250);
    if (mousePressed == true && mouseY <= 250)
    {
      mode = 1;
    }
    if (mousePressed == true && mouseY >= 250)
    {
      mode = 2;
    }
  }
    
  if (mode == 1) // singlePlayer
  {
    if (gameover == false)
    {
      background(0, 120, 0);
      bottom1.show();
      bottom2.show();
      top1.show();
      top2.show();
      fill(255);
      rect(200, 0, 100, 10);
      rect(200, 490, 100, 10);
      textSize(25);
      fill(255);
      text(str(topscore), 30, 40);
      text(str(bottomscore), 30, 470);   
      
      
      if (left==true)
      {
        bottom1.moveleft();
      }
      if (right==true)
      {
        bottom1.moveright();
      }
      if (a == true)
      {
        bottom2.moveleft();
      }
      if (d == true)
      {
        bottom2.moveright();
      }
      if ( pongball.x >= top1.x)
      {
        top1.moveright();
      }
      if ( pongball.x <= top1.x)
      {
        top1.moveleft();
      }
      if ( pongball.x >= top2.x)
      {
        top2.moveright();
      }
      if ( pongball.x <= top2.x)
      {
        top2.moveleft();
      }
      
      
      
      pongball.move();
      pongball.bounce();
      pongball.show();
      if (pongball.y<=18 && pongball.x<300 && pongball.x>200)  
      {
        gameover=true;
        bottomscore++;
      }
      if (pongball.y>=482 && pongball.x<300 && pongball.x>200)
      {
        gameover=true;
        topscore++;
      }
    }
    else //gameover==true
    {
      background(247, 226, 47);
      fill(220,0,0);
      changespeed=0;
      textSize(17);
      text("Top Player's Score: "+topscore, 20, 100);
      fill(0,0,150);
      text("Bottom Player's Score: "+bottomscore, 280, 100);
      fill(255);
      textSize(36);
      text("Click to continue.", 100, 250);
      fill(0);
      textSize(20);
      text("Continue in Multi-Player", 250, 450);
      if (mousePressed==true && mouseY<350)
      {
        pongball.x=int(random(200, 301));
        pongball.y=int(random(200, 301));
        int xdirection=int(random(2));
        int ydirection=int(random(2));
        if (xdirection==0)
        {
          pongball.right=true;
        }
        else //xdirection==1
        {
          pongball.right=false;
        }
        if (ydirection==0)
        {
          pongball.up=true;
        }
        else //ydirection==1
        {
          pongball.up=false;
        }
        gameover=false;
      }
      else if (mousePressed == true && mouseY> 400 )
      {gameover = false;
      topscore = 0;
      bottomscore = 0;
    mode = 2;}
    }
}
    
    if (mode == 2) //multiplayer
    {
      if (gameover == false)
      {
      background(0, 120, 0);
      bottom1.show();
      bottom2.show();
      top1.show();
      top2.show();
      fill(255);
      rect(200, 0, 100, 10);
      rect(200, 490, 100, 10);
      textSize(25);
      fill(255);
      text(str(topscore), 30, 40);
      text(str(bottomscore), 30, 470);   
      
      
      if (left==true)
      {
        bottom1.moveleft();
      }
      if (right==true)
      {
        bottom1.moveright();
      }
      if (n == true)
      {
        bottom2.moveleft();
      }
      if (m==true)
      {
        bottom2.moveright();
      }
      if (a==true)
      {
        top1.moveleft();
      }
      if (d==true)
      {
        top1.moveright();
      }
      if (z==true)
      {
        top2.moveleft();
      }
      if (c==true)
      {
        top2.moveright();
      }
      pongball.move();
      pongball.bounce();
      pongball.show();
      if (pongball.y<=18 && pongball.x<300 && pongball.x>200)  
      {
        gameover=true;
        bottomscore++;
      }
      if (pongball.y>=482 && pongball.x<300 && pongball.x>200)
      {
        gameover=true;
        topscore++;
      }
    }
    else //gameover==true
    {
      background(247, 226, 47);
      fill(220,0,0);
      changespeed=0;
      textSize(17);
      text("Top Player's Score: "+topscore, 20, 100);
      fill(0,0,150);
      text("Bottom Player's Score: "+bottomscore, 280, 100);
      fill(255);
      textSize(36);
      text("Click to continue.", 100, 250);
      fill(0);
      textSize(20);
      text("Continue in Single-Player", 250, 450);
      if (mousePressed==true && mouseY<350)
      {
        pongball.x=int(random(200, 301));
        pongball.y=int(random(200, 301));
        int xdirection=int(random(2));
        int ydirection=int(random(2));
        if (xdirection==0)
        {
          pongball.right=true;
        }
        else //xdirection==1
        {
          pongball.right=false;
        }
        if (ydirection==0)
        {
          pongball.up=true;
        }
        else //ydirection==1
        {
          pongball.up=false;
        }
        gameover=false;
      }
      else if (mousePressed == true && mouseY> 400 )
      {gameover = false;
      topscore = 0;
      bottomscore = 0;
        mode = 1 ;
      
    }
  }
}
}
  
class Paddle1
{
  int x, y;
  Paddle1()
  {
    x=250;
    y=496;
  }
  void show()
  {
    strokeWeight(0);
    fill(0, 0, 150);
    rect(x, y, 60, 4);
  }
  void moveleft()
  {
    if (x>=0)
    {
      x-=5;
    }
  }
  void moveright()
  {
    if (x<=440)
    {
      x+=5;
    }
  }
}
class Paddle2
{
  int x, y;
  Paddle2()
  {
    x=250;
    y=496;
  }
  void show()
  {
    strokeWeight(0);
    fill(0, 0, 150);
    rect(x, y, 50, 4);
    rect(x+150, y, 50, 4);
  }
  void moveleft()
  {
    if (x>=0)
    {
      x-=5;
    }
  }
  void moveright()
  {
    if (x<=300)
    {
      x+=5;
    }
  }
}
class Paddle3
{
  int x, y;
  Paddle3()
  {
    x=250;
    y=496;
  }
  void show()
  {
    strokeWeight(0);
    fill(247, 226, 47);
    rect(x, y, 50, 4);
    rect(x+150, y, 50, 4);
  }
  void moveleft()
  {
    if (x>=0)
    {
      x-=5;
    }
  }
  void moveright()
  {
    if (x<=300)
    {
      x+=5;
    }
  }
}
class Paddle4
{
  int x, y;
  Paddle4()
  {
    x=250;
    y=496;
  }
  void show()
  {
    strokeWeight(0);
    fill(247, 226, 47);
    rect(x, y, 60, 4);
  }
  void moveleft()
  {
    if (x>=0)
    {
      x-=5;
    }
  }
  void moveright()
  {
    if (x<=440)
    {
      x+=5;
    }
  }
}

class Ball
{
  int x, y;
  boolean up, right, down, left;
  Ball()
  {
    x=16;
    y=484;
    up=true;
    right=true;
    down=true;
    left=true;
    
  }
  void move()
  {
    if (up==true)
    {
      y=int(y-2-changespeed/2);
    }
    else  //up==false
    {
      y=int(y+2+changespeed/2);
    }
    if (right==true)
    {
      x=int(x+1+changespeed/2);
    }
    else  //right==false
    {
      x=int(x-1-changespeed/2);
    }
  }
  
  void bounce()
  {
    if (get(int(x)-8, int(y))!= color(0, 120, 0) && get(int(x)-8, int(y))!= color(255))
    {
      right=true;      
    }
    if (get(int(x)+8, int(y))!= color(0, 120, 0) && get(int(x)+8, int(y))!= color(255))
    {
      right=false;         
    }
    if (get(int(x), int(y)-8) != color(0,120,0) && get(int(x), int(y)-8) != color(255))
    {
      up=false;      
    }
    if (get(int(x), int(y)+8) != color(0,120,0) && get(int(x), int(y)+8) != color(255))
    {
      up=true;
      changespeed+=1.0/32;      
    }
    
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 16, 16);
  }
}
