---
title: Vectors and Kinematics
keywords: vectors, kinematics
---


::: intro-box
In this lesson, we'll introduce the basics of vectors and kinematics.
:::

::: warning :
This lesson is still under-development. Check back soon for the full lesson!
:::


Doodling has been a crucial tool in our development as 
a technological civilization.
Many great inventions, many ideas that have changed the world,
were born out of a lively conversation and scribble on a napkin.
The process of rendering our thoughts in drawings allows us to clarify and better understand our own thoughts and leads us to more clearly communicate our ideas to others.


One of the most important elements of many scientific sketches is the arrow.
We use arrows to denote directions, positions, orientations, flows, motions,
and a myriad other properties and phenomena.
We use longer arrows to denote faster movement or larger displacement or more intense flows.
And we orient the arrows differently, to denote different relative orientations.


By the end of the lesson, you will use arrows in just this way to describe scientific phenomena like velocity and acceleration. First, we will introduce the scientific term for these arrows and use drawings to understand their essence.

## Using Vectors

The specific arrows we introduced above are called "vectors" by scientists and mathematicians.
Knowing the special name for important concepts helps scientists communicate more effectively and makes it easier to find out more about topic. 
When searching in the library (or on the internet!) for more information, it certainly does make it easier
to know to look for information on vectors instead of "the type of arrows scientists use in their doodles." Now that we know the name for this concept, let's dive deeper. 

### Displacement Vectors
One useful way to use vectors is to describe the straight-line distance between two points. For instance, imagine that you are currently standing at the point labeled 'start' at the center of the drawing below and then walk to the point labeled 'A'. We can use a vector to represent the distance you covered walking between the two points. The direction of the arrow indicates the direction of your motion.

`Add an animation of point labeled 'start,' something to indicate motion, point labeled 'A,' and then a vector appearing. `

However, what if you want to represent a more complicated journey? Maybe after stopping at point A, you then move to point B. We can then draw a vector between point A and point B. We can then add additional points and vectors to represent the rest of the journey. 

`Add an animation of multiple steps`

At the end of our journey, we can add these steps together to find our final position.
The process of adding these vectors together is called vector addition.
By framing vectors as representing motion, the idea of vector addition becomes easier to understand.
Vector $\vec{A}$ represents displacement (movement) in one direction and
vector $\vec{B}$ represents displacement in another direction.
We can represent our total displacement by connecting our starting and ending positions with a vector: $\vec{C}$.

`An animation of the displacements being summed up.`

`A drawing of all the steps and a new vector pointing to the "you ended here" point`.

### Velocity Vectors

In addition to simply measuring the displacement of your motion, we can also measure velocity, or the movement
per second. A velocity vector represents the direction of your movement. 
The displacement will be the sum of the velocity vectors (??).
To explore this concept, create a velocity vector by dragging the black dot in the
circle below. This vector and the corresponding displacement vector will appear on the right.
As you change the velocity, the total displacement will be shown in black while the current
velocity is shown in red. Can you use large velocity vectors to create a displacement vector
that returns to the center point? What happens if you quickly make a vertical velocity vector
followed by one that moves to the right? Can you make the movement
path (shown in gray) form a circle? Notice how the size of the velocity vector changes based on how quickly the point is moving.

`A widget where you pick a velocity and you get a trajectory and a position vector. Click on the black dot and drag it around. A lot of prettifying left to do.`

<style>
#v_to_path {
  justify-content: center;
  display: flex;
  flex-direction: row;
  position: relative;
}
.vslider {
  width: 200px;
  height: 200px;
  position: relative;
  border: solid 1px black;
  border-radius: 50%;
  overflow: hidden;
  margin: 2px;
}
.vhandle {
  display: block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: black;
  position: absolute;
  left: 95px;
  top: 95px;
}
.trajectory {
  border: solid 1px black;
  margin: 2px;
}
</style>
<div id="v_to_path">
<div class="vslider"><canvas class="velocity" width=200 height=200></canvas><span class="vhandle"></span></div>
<canvas class="trajectory" width=200 height=200></canvas>
</div>
<script>
const v_to_path = document.getElementById('v_to_path');
const v2p_vhandle = v_to_path.getElementsByClassName('vhandle')[0];
const v2p_ctx = v_to_path.getElementsByClassName('trajectory')[0].getContext('2d');
const v2p_vctx = v_to_path.getElementsByClassName('velocity')[0].getContext('2d');

function canvas_arrow(context, fromx, fromy, tox, toy) {
  var headlen = 10;
  var dx = tox - fromx;
  var dy = toy - fromy;
  var angle = Math.atan2(dy, dx);
  context.moveTo(fromx, fromy);
  context.lineTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
  context.moveTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
}

function dragElementVel(elmnt, ctx, vctx) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  elmnt.onmousedown = dragMouseDown;
  var ipos1 = 100, ipos2 = 100;
  var intervalhandler;
  var memorycanvas;
  var m_canvas = document.createElement('canvas'); // A frame buffer for only the path
  m_canvas.width = 200;
  m_canvas.height = 200;
  var m_ctx = m_canvas.getContext('2d');
  
  m_ctx.strokeStyle='lightgrey';
  
  function drawStep() {
    var v1 = elmnt.offsetLeft-95;
    var v2 = elmnt.offsetTop-95;
    ipos1 += 0.05*v1;
    ipos2 += 0.05*v2;
    if (0<=ipos1 && ipos1<200 && 0<=ipos2 && ipos2<200) {
      m_ctx.lineTo(ipos1, ipos2);
    } else {
      ipos1 = (ipos1+200)%200;
      ipos2 = (ipos2+200)%200;
      m_ctx.moveTo(ipos1, ipos2);
    }
    m_ctx.stroke();
    ctx.clearRect(0,0,200,200);
    ctx.drawImage(m_canvas,0,0);
    ctx.strokeStyle='black';
    ctx.beginPath();
    canvas_arrow(ctx,100,100,ipos1,ipos2);
    ctx.stroke()
    ctx.strokeStyle='red';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*v1,ipos2+0.5*v2);
    ctx.stroke();
    vctx.clearRect(0,0,200,200);
    vctx.strokeStyle='red';
    vctx.beginPath();
    canvas_arrow(vctx,100,100,100+v1,100+v2);
    vctx.stroke();
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    m_ctx.beginPath();
    m_ctx.moveTo(100,100);
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
    intervalhandler = setInterval(drawStep, 50);
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    clearInterval(intervalhandler);
    elmnt.style.top = "95px";
    elmnt.style.left = "95px";
    m_ctx.clearRect(0,0,200,200);
    ipos1 = 100;
    ipos2 = 100;
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

dragElementVel(v2p_vhandle, v2p_ctx, v2p_vctx);
</script>

### Acceleration Vectors

In addition to the velocity, we also care about the acceleration, or change
in velocity over time. This next drawing allows you to manipulate the acceleration in
the farthest left circle and see the corresponding change in velocity in the center. The
acceleration (green), velocity (red) and total displacement (black) are shown on the right.
Can you use the acceleration vectors to make a velocity of zero? Can you make the movement
path (shown in gray) form a circle?

<style>
#a_to_path {
  justify-content: center;
  display: flex;
  flex-direction: row;
  position: relative;
}
.aslider {
  width: 200px;
  height: 200px;
  position: relative;
  border: solid 1px black;
  border-radius: 50%;
  overflow: hidden;
  margin: 2px;
}
.ahandle {
  display: block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: black;
  position: absolute;
  left: 95px;
  top: 95px;
}
</style>
<div id="a_to_path">
<div class="aslider"><canvas class="acceleration" width=200 height=200></canvas><span class="ahandle"></span></div>
<div class="vslider"><canvas class="velocity" width=200 height=200></canvas></div>
<canvas class="trajectory" width=200 height=200></canvas>
</div>
<script>
const a_to_path = document.getElementById('a_to_path');
const a2p_vhandle = a_to_path.getElementsByClassName('ahandle')[0];
const a2p_ctx = a_to_path.getElementsByClassName('trajectory')[0].getContext('2d');
const a2p_vctx = a_to_path.getElementsByClassName('velocity')[0].getContext('2d');
const a2p_actx = a_to_path.getElementsByClassName('acceleration')[0].getContext('2d');

function dragElementAcc(elmnt, ctx, vctx, actx) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  elmnt.onmousedown = dragMouseDown;
  var ipos1 = 100, ipos2 = 100;
  var v1 = 0, v2 = 0;
  var intervalhandler;
  var memorycanvas;
  var m_canvas = document.createElement('canvas'); // A frame buffer for only the path
  m_canvas.width = 200;
  m_canvas.height = 200;
  var m_ctx = m_canvas.getContext('2d');
  
  m_ctx.strokeStyle='lightgrey';
  
  function drawStep() {
    var a1 = elmnt.offsetLeft-95;
    var a2 = elmnt.offsetTop-95;
    v1 += 0.1*a1;
    v2 += 0.1*a2
    ipos1 += 0.05*v1;
    ipos2 += 0.05*v2;
    if (0<=ipos1 && ipos1<200 && 0<=ipos2 && ipos2<200) {
      m_ctx.lineTo(ipos1, ipos2);
    } else {
      ipos1 = (ipos1+200)%200;
      ipos2 = (ipos2+200)%200;
      m_ctx.moveTo(ipos1, ipos2);
    }
    m_ctx.stroke();
    ctx.clearRect(0,0,200,200);
    ctx.drawImage(m_canvas,0,0);
    ctx.strokeStyle='black';
    ctx.beginPath();
    canvas_arrow(ctx,100,100,ipos1,ipos2);
    ctx.stroke()
    ctx.strokeStyle='red';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*v1,ipos2+0.5*v2);
    ctx.stroke();
    ctx.strokeStyle='green';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*a1,ipos2+0.5*a2);
    ctx.stroke();
    vctx.clearRect(0,0,200,200);
    vctx.strokeStyle='red';
    vctx.beginPath();
    canvas_arrow(vctx,100,100,100+v1,100+v2);
    vctx.stroke();
    actx.clearRect(0,0,200,200);
    actx.strokeStyle='green';
    actx.beginPath();
    canvas_arrow(actx,100,100,100+a1,100+a2);
    actx.stroke();
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    m_ctx.beginPath();
    m_ctx.moveTo(100,100);
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
    intervalhandler = setInterval(drawStep, 50);
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    clearInterval(intervalhandler);
    elmnt.style.top = "95px";
    elmnt.style.left = "95px";
    m_ctx.clearRect(0,0,200,200);
    ipos1 = 100;
    ipos2 = 100;
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

dragElementAcc(a2p_vhandle, a2p_ctx, a2p_vctx, a2p_actx);
</script>

## Vector Magnitude and Orientation

Now that you have become comfortable with drawing vectors,
we will begin to describe their properties using numbers.
Vectors have a length (mathematicians usually call it *magnitude* or *norm*) and orientation (or direction).
We will see how to encode these properties as pairs of numbers with the example below. 


Imagine that you are standing in the middle of an empty school cafeteria. The floor is 
tiled with squares. We will imagine that a giant coordinate system 
has been drawn on the floor and you are standing at the location x = 0 and y = 0.

(add image)

If you take a step forward to the next tile, we can define a displacement vector between your initial 
to final position. In this case, the magnitude of this vector is 1 tile
because you are 1 tile from your starting position.
The direction of your movement is defined using an angle. This requires agreeing on how
to describe the direction. If we were looking at a map, we might agree to describe the direction
relative to North. For vector motion, scientists, mathematicians and others have agreed to
describe the direction of a vector in terms of the angle relative to east, or the x-axis.
In this case, if you have moved towards the door in the image, you have moved north, or 
with an angle of 90 degrees from the x-axis.

If your friend, who has joined you in this adventure, moves to the right from the 
center of the cafeteria, she will have also moved with a magnitude of 1 tile. But her
direction will be 0 degrees.

(add image with diagonal motion)
Now, lets move back to the center of the cafeteria and move on a diagonal one tile. This
motion is the combination of moving one tile up and one tile to the right. The magnitude
is the distance of the diagonal (sqrt(2 tiles)) and the direction is 45 degrees. Try moving
in various directions and distances using the widget below and see how the magnitude and 
direction change.


<style>
#grid1d {
  text-align: center;
}
#grid1d #location {
  width: 10%;
  top:0.5rem;
}



#grid1d .spacer {

  width:5%;
}


</style>
<dif id= "grid1d">
<div id="vectorGrid">
<canvas class="trajectory1D" width=400 height=400></canvas>
</div>
<div id="values">
<span class="spacer">X displacement: </span><input type="number" min="-10" max="10"  id="xvalue">
<span class="spacer">Y displacement: </span><input type="number" min="-10" max="10"  id="yvalue">

<button id="plotButton">Plot</button>

<span class="spacer">Magnitude: </span><span class="vis" id="magshow">0</span>
<span class="spacer">Angle: </span><span class="vis" id="angshow">0</span>

</div>


<script>
const v_to_path2D = document.getElementById('vectorGrid');
const ctx2D = v_to_path2D.getElementsByClassName('trajectory1D')[0].getContext('2d');
var xElement = document.getElementById("xvalue");
var yElement = document.getElementById("yvalue");


function canvas_arrow2D(context, fromx, fromy, tox, toy) {
  var headlen = 10;
  var dx = tox - fromx;
  var dy = toy - fromy;
  var angle = Math.atan2(dy, dx);
  context.moveTo(fromx, fromy);
  context.lineTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
  context.moveTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));

  
}

function canvas_axis(context, maxX, maxY) {
  var midX = maxX/2;
  var midY = maxY/2;
  context.moveTo(midX, 0);
  context.lineTo(midX,maxY);
  context.moveTo(0, midY);
  context.lineTo(maxX, midY);
}

// define event handler
function plotVector(){
	// extract desired info
    var x = xElement.value;
    var y = yElement.value;
    x_scale = x*15 + 200; // make relative to our image in scale up
    y_scale = -y*15 + 200; // flip the sign
  
	var m_canvas = document.createElement('canvas'); // A frame buffer for only the path
  	m_canvas.width = 400;
  	m_canvas.height = 400
  
	ctx2D.clearRect(0,0,400,400);
    ctx2D.drawImage(m_canvas,0,0);
    ctx2D.strokeStyle='black';
    ctx2D.beginPath();
    canvas_arrow2D(ctx2D,200,200,x_scale, y_scale);
    ctx2D.stroke();
	canvas_axis(ctx2D, 400, 400);
	ctx2D.stroke();
	var magnitude = Math.sqrt(x*x  + y*y);
	var direction_angle = Math.atan2(y,x)/Math.PI*180;
	if (direction_angle < 0){
		direction_angle = direction_angle + 360;
	}
	document.getElementById("magshow").innerHTML=magnitude.toFixed(2);
	document.getElementById("angshow").innerHTML=direction_angle.toFixed(2);
    
}

// decide what event handlers to use
plotButton.onclick = plotVector;


</script>


Now that we have represented displacement vectors with numbers, lets discuss velocity vectors.
Instead of measuring the amount and direction an item has moved, we can measure the speed
and direction, giving a velocity vector. In the video below, a ball is rolling down a slope.
The vector to represent this motion has a magnitude of 5 meters per second and a direction
of 330 degrees. The same concept applies to acceleration vectors.
