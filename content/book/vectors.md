---
title: Vectors and Kinematics
keywords: vectors, kinematics
---

::: intro-box
Scientist and engineers use drawings of arrows to denote position and motion.
They are called vectors and as thinking about them make many motion-related
problems much easier.
:::

Doodling is a crucial and empowering tool used by artists, scientists, and engineers.
Many great inventions, many ideas that have changed the world,
were born out of a lively conversation and scribble on a napkin.
The process of rendering our thoughts in drawings allows us to clarify and better understand our own thoughts and leads us to more clearly communicate our ideas to others.

One of the most important elements of many scientific doodles is the arrow.
We use arrows to denote directions, positions, orientations, flows, motions,
and a myriad other properties and phenomena.
We use longer arrows to denote faster movement or larger displacement or more intense flows.
And we orient the arrows differently, to denote different directions and positions.
By the end of the lesson, you will use arrows in just this way to describe concepts like velocity and acceleration. But first, let's start with an informal doodle to get the hang of it.

## Using Vectors

The specific arrows we introduced above are called *vectors* by scientists and mathematicians.
Knowing the special name for important concepts helps scientists communicate more effectively and makes it easier to find out more about topic. 
When searching in the library (or on the internet) for more information, it certainly does make it easier
to know to look for information on *vectors* instead of "the type of arrows scientists use in their doodles".
Now that we know the name for this concept, let's dive deeper. 

### Position and Displacement

The most immediate application of our arrow doodles (vectors), is to denote a position in space and how that position changes.
We would need a *starting point* with respect to which we will denote all other positions.
Imagine you are at that starting point.
Then you take a few more steps in an arbitrary direction and you are at a new location.
You can draw a vector between the starting position and the initial position.
This vector then represents your displacement.
We can endow the *starting point* with the special property of being the center of our map.
Frequently this center is called the *origin* of our map.
Vectors starting at that origin can be thought of representing not only displacement,
but also a current position.

<figure><video src="/images/bookpics/vector_displacement.mp4" muted autoplay playsinline loop></video><figcaption>A vector can be used to denote the motion from one point to another.</figcaption></figure>

However, what if you want to represent a more complicated journey?
Maybe after stopping at Location 1,
you then move to Location 2.
This second displacement will be denoted by a second vector.

<figure><video src="/images/bookpics/vector_multiple_steps.mp4" muted autoplay playsinline loop></video><figcaption>For each step of your journey, you can draw a vector between the prior and current location.</figcaption></figure>

An important concept comes up when we try to describe the final destination of the journey.
The final position is the result of all preceding displacements.
It almost feels natural to call the final position the *sum of all preceding displacements*.
But notice this is a different type of addition that the one we have seen before with numbers.
It is not only the size that matters here, but also the orientation.
We have a special name for this type of operation. We call it *vector addition*.

By framing vectors as representing motion, the idea of vector addition becomes easier to understand.
<span class="footnote">Vector<span>We denote variables representing vectors with a cute little arrow above the letter.</span></span> $\vec{A}$ represents the first displacement.
Then vector $\vec{B}$ and $\vec{C}$ represent the second and third steps of our journey,
each in a slightly different direction.

<figure><video src="/images/bookpics/vector_summation.mp4" muted autoplay playsinline loop></video><figcaption>The total displacement, $\vec{D}$, is the sum of vectors $\vec{A}$, $\vec{B}$, and $\vec{C}$</figcaption></figure>

Then we can write $$\vec{D} = \vec{A}+\vec{B}+\vec{C}$$ and from the drawing we can see that $\vec{D}$,
the vector representing the final position, is the one connecting the starting point and the end destination.
It is also the vector obtained by following one after the other
each of the vectors representing the sequence of displacements.
In other words, to add to vectors together, we simply put the start of the second vector where the first vector ends. Then the new vector, joining the start of the first vector and the end of the second vector, represents the sum, i.e. the total displacement.

### Velocity Vectors

Motion, however, is not always described by a few discrete steps.
Usually, motion is a smooth process in which the position of a point slowly and smoothly changes,
very much unlike the abrupt discrete steps seen above.

Vectors become even more useful here.
They permit us to introduce the notion of *instantaneous velocity* ("instantaneous" is just a fancy word for "current"). This would be a vector, whose orientation points along the current direction of motion.
This vector is longer if the position is changing faster (a longer vector represents a higher speed),
or shorter if the position is changing slowly.



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
#grid2d {
  text-align: center;
}
.grid2dcontrol > input {
  width: 40px;
}
</style>

<div id= "grid2d">
<div id="vectorGrid">
<canvas class="trajectory1D" width=400 height=400></canvas>
</div>
<div id="values">
<div class="grid2dcontrol">X component: <span id="xshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="xvalue"></div>
<div class="grid2dcontrol">Y component: <span id="yshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="yvalue"></div>
<div class="grid2dcontrol">Magnitude: <span id="magshow">0</span></div>
<div class="grid2dcontrol">Angle: <span id="angshow">0</span>&deg;</div>
</div>
</div>

<script>
const v_to_path2D = document.getElementById('vectorGrid');
const ctx2D = v_to_path2D.getElementsByClassName('trajectory1D')[0].getContext('2d');
var xElement = document.getElementById("xvalue");
var yElement = document.getElementById("yvalue");
xElement.value = 2;
yElement.value = 2;
var xcurrent = 0;
var ycurrent = 0;

function canvas_axis(context, maxX, maxY) {
  var midX = maxX/2;
  var midY = maxY/2;
  var stepX = maxX/20;
  var stepY = maxY/20;
  context.strokeStyle='rgba(0,0,0,0.5)';
  context.lineWidth=1;
  context.moveTo(midX, 0);
  context.lineTo(midX,maxY);
  context.moveTo(0, midY);
  context.lineTo(maxX, midY);
  context.stroke();
  context.strokeStyle='rgba(0,0,0,0.1)';
  for (var i=-10; i<=10; i++) {
    context.moveTo(0,midY+i*stepY);
    context.lineTo(maxX,midY+i*stepY);
    context.moveTo(midX+i*stepX,0);
    context.lineTo(midX+i*stepX,maxY);
  }
  context.stroke();
}

function plot_all(){
    xcurrent = 0.8*xcurrent + 0.2*xElement.value;
    ycurrent = 0.8*ycurrent + 0.2*yElement.value;
    var x = xcurrent;
    var y = ycurrent;
    x_scale = x*20 + 200;
    y_scale = -y*20 + 200;
  
    ctx2D.clearRect(0,0,400,400);
    ctx2D.beginPath();
    canvas_axis(ctx2D, 400, 400);
    ctx2D.beginPath();
    ctx2D.strokeStyle='black';
    ctx2D.lineWidth=2;
    canvas_arrow(ctx2D,200,200,x_scale, y_scale);
    ctx2D.stroke();
    var magnitude = Math.sqrt(x*x  + y*y);
    var direction_angle = Math.atan2(y,x)/Math.PI*180;
    if (direction_angle < 0){
    	direction_angle = direction_angle + 360;
    }
    document.getElementById("xshow").innerHTML=xcurrent.toFixed(1);
    document.getElementById("yshow").innerHTML=ycurrent.toFixed(1);
    document.getElementById("magshow").innerHTML=magnitude.toFixed(1);
    document.getElementById("angshow").innerHTML=direction_angle.toFixed(0);
}

setInterval(plot_all, 50);
</script>


Now that we have represented displacement vectors with numbers, lets discuss velocity vectors.
Instead of measuring the amount and direction an item has moved, we can measure the speed
and direction, giving a velocity vector. In the video below, a ball is rolling down a slope.
The vector to represent this motion has a magnitude of 5 meters per second and a direction
of 330 degrees. The same concept applies to acceleration vectors.
