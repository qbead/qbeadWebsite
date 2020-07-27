---
title: Vectors and Kinematics
keywords: vectors, kinematics
---

::: intro-box
Scientist and engineers use drawings of arrows to denote position and motion.
They are called vectors and using them makes many motion-related
problems much easier.
:::

Doodling is a crucial and empowering tool used by artists, scientists, and engineers.
Many great inventions, many ideas that have changed the world,
were born out of a lively conversation and scribble on a napkin.
The process of rendering our ideas in drawings allows us to clarify and better understand our own thoughts and leads us to more clearly communicate our ideas to others.

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

<figure><video src="/images/bookpics/vector_displacement.mp4" muted autoplay playsinline loop></video><figcaption>A vector can be used to denote motion from one point to another (like of the orange dot above).</figcaption></figure>

However, what if you want to represent a more complicated journey?
Maybe after stopping at Location 1,
you then move to Location 2.
This second displacement will be denoted by a second vector. In the journey represented in the image below, one more step is taken to reach the final destination (and a third vector represents that stage).

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
They permit us to neatly introduce the notion of *instantaneous velocity* ("instantaneous" is just a fancy word for "current").
This would be a vector whose orientation points along the current direction of motion.
This vector is longer if the position is changing faster (a longer vector represents a higher speed),
or shorter if the position is changing slowly.

Below you are provided with an interactive visualization of the notion of a velocity vector.
You can pick the velocity by dragging the black dot with the cursor of your mouse.
In the left circle, the velocity vector will be visualized.
This would be the velocity with which the position (in blue) depicted in the right rectangle would be modified.
Notice that when the orange velocity vector is small, then the blue position vector changes very slowly.
Notice as well that the direction in which the position vector changes is governed by the direction of the velocity vector.

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

function vcanvas_labels(ctx, vctx) {
  vctx.font = '20px sans';
  vctx.fillStyle = '#ff8510';
  vctx.textAlign = 'center';
  vctx.fillText('Velocity',100,120);
  vctx.font = '14px sans';
  vctx.fillText('drag the black circle',100,140);
  vctx.fillText('to set the velocity',100,160);
  ctx.font = '20px sans';
  ctx.fillStyle = '#1772b4';
  ctx.textAlign = 'center';
  ctx.fillText('Position',100,120);
  ctx.font = '14px sans';
  ctx.fillText('determined by',100,140);
  ctx.fillText('the velocity',100,160);
}

vcanvas_labels(v2p_ctx, v2p_vctx);

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
  
  m_ctx.strokeStyle='rgb(139,185,218)';
  ctx.lineCap="round";
  vctx.lineCap="round";
  ctx.lineWidth=2;
  vctx.lineWidth=2;
  
  function drawStep() {
    var v1 = elmnt.offsetLeft-95;
    var v2 = elmnt.offsetTop-95;
    ipos1 += 0.05*v1;
    ipos2 += 0.05*v2;
    //if (0<=ipos1 && ipos1<200 && 0<=ipos2 && ipos2<200) {
    //  m_ctx.lineTo(ipos1, ipos2);
    //} else {
    //  ipos1 = (ipos1+200)%200;
    //  ipos2 = (ipos2+200)%200;
    //  m_ctx.moveTo(ipos1, ipos2);
    //}
    m_ctx.lineTo(ipos1, ipos2);
    m_ctx.stroke();
    ctx.clearRect(0,0,200,200);
    ctx.drawImage(m_canvas,0,0);
    ctx.strokeStyle='#1772b4';
    ctx.beginPath();
    canvas_arrow(ctx,100,100,ipos1,ipos2);
    ctx.stroke()
    ctx.strokeStyle='#ff8510';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*v1,ipos2+0.5*v2);
    ctx.stroke();
    vctx.clearRect(0,0,200,200);
    vctx.strokeStyle='#ff8510';
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
    vcanvas_labels(v2p_ctx, v2p_vctx);
  }
}

dragElementVel(v2p_vhandle, v2p_ctx, v2p_vctx);
</script>

### Acceleration Vectors

In many circumstances it is not easy to keep a steady velocity (and hence a steadily changing position).
To study such cases, we need to define a new vector, the *acceleration* vector,
which describes how the velocity vector changes.
In the same way in which the velocity vector's direction shows the direction in which the position changes,
the acceleration vector's direction shows how the current velocity will change.
And the bigger the acceleration vector is, the more rapidly the velocity vector changes.
In the visualization below you can see how changing the acceleration vector
(by dragging the black circle) will induce a change in the velocity vector,
which in turn will change the velocity.

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

function acanvas_labels(ctx, vctx, actx) {
  actx.font = '20px sans';
  actx.fillStyle = '#e63928';
  actx.textAlign = 'center';
  actx.fillText('Acceleration',100,120);
  actx.font = '14px sans';
  actx.fillText('drag the black circle',100,140);
  actx.fillText('to set the acceleration',100,160);
  vctx.font = '20px sans';
  vctx.fillStyle = '#ff8510';
  vctx.textAlign = 'center';
  vctx.fillText('Velocity',100,120);
  vctx.font = '14px sans';
  vctx.fillText('determined by',100,140);
  vctx.fillText('the acceleration',100,160);
  ctx.font = '20px sans';
  ctx.fillStyle = '#1772b4';
  ctx.textAlign = 'center';
  ctx.fillText('Position',100,120);
  ctx.font = '14px sans';
  ctx.fillText('determined by',100,140);
  ctx.fillText('the velocity',100,160);
}

acanvas_labels(a2p_ctx, a2p_vctx, a2p_actx);

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
  
  m_ctx.strokeStyle='rgb(139,185,218)';
  ctx.lineCap="round";
  vctx.lineCap="round";
  actx.lineCap="round";
  ctx.lineWidth=2;
  vctx.lineWidth=2;
  actx.lineWidth=2;
  
  function drawStep() {
    var a1 = elmnt.offsetLeft-95;
    var a2 = elmnt.offsetTop-95;
    v1 += 0.1*a1;
    v2 += 0.1*a2
    ipos1 += 0.05*v1;
    ipos2 += 0.05*v2;
    //if (0<=ipos1 && ipos1<200 && 0<=ipos2 && ipos2<200) {
    //  m_ctx.lineTo(ipos1, ipos2);
    //} else {
    //  ipos1 = (ipos1+200)%200;
    //  ipos2 = (ipos2+200)%200;
    //  m_ctx.moveTo(ipos1, ipos2);
    //}
    m_ctx.lineTo(ipos1, ipos2);
    m_ctx.stroke();
    ctx.clearRect(0,0,200,200);
    ctx.drawImage(m_canvas,0,0);
    ctx.strokeStyle='#1772b4';
    ctx.beginPath();
    canvas_arrow(ctx,100,100,ipos1,ipos2);
    ctx.stroke()
    ctx.strokeStyle='#ff8510';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*v1,ipos2+0.5*v2);
    ctx.stroke();
    ctx.strokeStyle='#e63928';
    ctx.beginPath();
    canvas_arrow(ctx,ipos1,ipos2,ipos1+0.5*a1,ipos2+0.5*a2);
    ctx.stroke();
    vctx.clearRect(0,0,200,200);
    vctx.strokeStyle='#ff8510';
    vctx.beginPath();
    canvas_arrow(vctx,100,100,100+v1,100+v2);
    vctx.stroke();
    actx.clearRect(0,0,200,200);
    actx.strokeStyle='#e63928';
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
    acanvas_labels(a2p_ctx, a2p_vctx, a2p_actx);
  }
}

dragElementAcc(a2p_vhandle, a2p_ctx, a2p_vctx, a2p_actx);
</script>

There are a couple of interesting cases to consider. Try to reproduce the following in the visualization:

- When the acceleration vector points in the same direction as the velocity vector, then the velocity will grow.
- When the acceleration vector is pointing in the direction opposite to the velocity vector, then the velocity will become lower and lower, until eventually the position stops changing. If we continue after that point, the velocity will change directions and start growing bigger and bigger.
- When the acceleration is perpendicular to the velocity, then the velocity will have its orientation change, causing a turn. Try, for instance, to see whether you can control the acceleration such that the position traces out circles.

## Vector Magnitude and Components (or Coordinates)

Now that you have become comfortable with drawing vectors,
we will begin to describe their properties using numbers.
This is particularly useful when we want to use computers to draw vectors,
or when we want to learn a vector that was measured by a sensor.
For instance, the motion sensors on the SpinWheel can measure the acceleration vector
describing the motion of the device.
However, to interpret that measurement we need to understand
how a vector can be represented as a sequence of numbers.

As we have seen, one important property of vectors is their length.
Mathematicians usually call it *magnitude* or *norm*.
To also describe the orientation of a given vector, we will need something more.
We have already mentioned that an *origin* or a center from which vectors radiate would be convenient.
That gives us a reference starting point, but it does not yet give us a reference orientation
with respect to which we can measure the orientation of our vector.

One way to achieve this orientation requirement is to draw a grid over which the vectors will be drawn.
For a real-world example, consider the tile floor in a cafeteria.
You can pick a tile at the center of the room to be your origin.
But the grid provides you with something more:
the two sides of the tile give you two axes along which displacement can be measured. 
To each displacement vector you can assign a description in words:
"I move $X$ tiles to the right and $Y$ tiles forward".
The numbers $X$ and $Y$ is what we call the *coordinates* (or *components*) of the vector.
It is customary for drawings to depict $X$ horizontally and $Y$ vertically.

This custom is kept in the visualization below, where a tile grid is drawn,
together with a position vector on top of it.
You can use the sliders to modify the coordinates
(i.e. the number of tiles taken to the right or forward,
where negative numbers are interpreted as stepping to the left or backwards).

<style>
#grid2d {
  text-align: center;
}
.grid2dcontrol > input {
  width: 40px;
}
.xcom {
  color: #228e2c;
}
.ycom {
  color: #2676b3;
}
</style>

<div id= "grid2d">
<div id="vectorGrid">
<canvas class="trajectory1D" width=400 height=400></canvas>
</div>
<div id="values">
<div class="grid2dcontrol xcom">X component: <span id="xshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="xvalue"></div>
<div class="grid2dcontrol ycom">Y component: <span id="yshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="yvalue"></div>
<div class="grid2dcontrol">Magnitude: <span id="magshow">0</span></div>
<!--<div class="grid2dcontrol">Angle: <span id="angshow">0</span>&deg;</div>-->
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
ctx2D.textAlign = 'center';
ctx2D.textBaseline = 'middle';

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
    ctx2D.font = '14px sans';
    ctx2D.fillStyle = '#228e2c';
    ctx2D.strokeStyle = '#228e2c';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(200,y_scale);ctx2D.stroke();
    ctx2D.fillText('X = '+xcurrent.toFixed(1),x*10+200,y_scale-10*Math.sign(y));
    ctx2D.fillStyle = '#2676b3';
    ctx2D.strokeStyle = '#2676b3';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(x_scale,200);ctx2D.stroke();
    ctx2D.fillText('Y = '+ycurrent.toFixed(1),x_scale+40*Math.sign(x),-y*10+200);
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
    //document.getElementById("angshow").innerHTML=direction_angle.toFixed(0);
}

setInterval(plot_all, 50);
</script>

A third direction can be added if we want to describe a position in three dimensions.
For instance, in the example of a cafeteria with a tile floor,
the third component of the vector would be the height above the floor (usually denoted as $Z$).
Similar grids can be constructed for velocity vectors and acceleration vectors (the grids are called *coordinate systems*). In fact, our SpinWheel device has its own grid in which it measures acceleration.
The way this measurement is provided, is as three variables, $a_x$, $a_y$, and $a_z$,
which represent the components of the acceleration along the $X$, $Y$, and $Z$ directions.
Now that you have a rough understanding of what these number represent,
we will use them in various creative endeavors,
where a small piece of code will be able to react to motion in a colorful way.
For instance, consider how we use acceleration measurements in the [make a step counter](/stepcounter)
project, or their more artistic use in the [dance and motion visualization](/dancing) project.

<!-- TODO: Insert 3D animation or widget -->