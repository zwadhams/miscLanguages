
import 'dart:html';
import 'dart:math';
import 'dart:async';

CanvasElement canvas = CanvasElement(); //was having trouble getting these to compile under any curcumstance. 
CanvasRenderingContext2D ctx; //Think it might have been something with dartpad


var ball;

class Ball {
  var r = 15.0; //ball size
  var x = 50.0;
  var y = 50.0;
  var vx = 0.0;
  var vy = 0.0;
}

void resetOnClick(MouseEvent event){//when mouse is clicked
  
  //makes sure the ball stays inside the box
  if(event.offset.x < canvas.width - ball.r && event.offset.y < canvas.height - ball.r){ 
  	ball.x = event.offset.x;
  	ball.y = event.offset.y;
  	ball.vx = 0.0;//velocity
  	ball.vy = 0.0;//velocity
  }
  
}

void drawBall(){//constucts the ball
  ctx.clearRect(0,0, canvas.width, canvas.height);
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.restore();
  
  ball.x = ball.x + ball.vx;//velocity on right
  ball.y = ball.y + ball.vy;//velocity on left
  
  ball.vx = ball.vx * .996;//to right of screen
  ball.vy = ball.vy * .996;//to bottom of screen
  
  ball.vx = ball.vx + .07; //gravity to right of screen
  ball.vy = ball.vy + .07; //gravity to bottom of screen
  
  ctx.save();
  ctx.translate(ball.x, ball.y);
  ctx.fillStyle = "red"; //ball color
  ctx.beginPath();
  ctx.arc(0, 0, ball.r, 0, pi*2, false);
  ctx.closePath();
  ctx.fill();
  ctx.restore();
  
  //sees if ball hits the side
  if (ball.y + ball.r > canvas.height){
    ball.y = canvas.height - ball.r;
    ball.vy = (-1) * ball.vy;
  }
  //sees if ball hits the bottom
  if(ball.x + ball.r > canvas.width){
    ball.x = canvas.width - ball.r;
    ball.vx = (-1) * ball.vx;   
    }
  
  
  
  timeWait();
}

Timer timeWait([int milliseconds]) { //this timer keeps the ball moving in a semi normal way
  const timeout = const Duration(milliseconds: 6);//seconds between each frame
  const ms = const Duration(milliseconds: 1);
  var duration = milliseconds == null ? timeout : ms * milliseconds;
  return new Timer(duration, drawBall);
}

void main(){
  ball = new Ball();
  canvas = querySelector('#canvas'); //creates canvas
  ctx = canvas.getContext('2d'); //makes it 2d
  drawBall(); //calls the function that creates the ball
  ctx.canvas.onClick.listen(resetOnClick); //listens for my click to reset it
}
