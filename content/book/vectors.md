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


Universally, in every human endeavor,
the most important tool that helps us progress as a technological civilization is doodling.
Many great inventions, many ideas that have changed the world,
have started as a scribble on a napkin,
born out of a lively conversation between colleagues and friends.
This process of rendering our thoughts in drawings lets us communicate better with our friends,
and even more importantly, it lets us understand our own thoughts better.

As the sophistication of our ideas grow,
our drawings also grow more intricate
and the tools and concepts we use in them become more formal.
This formality brings us great powers,
but with great power comes a lot of weird crap.

Throughout science, the most important doodle is the arrow.
We use arrows to denote directions, positions, orientations, flows, motions, tensions, and a myriad other properties and phenomena.
We use longer arrows to denote faster movement or larger displacement or more intense tension.
And we orient the arrows differently, to denote different orientations.

We can start using numbers to describe these arrows,
an important step if we want to use them for specific scientific purposes.
We will indeed do that later in this lessons,
but, as with any other scientific concept,
it is important to first understand the soul of the arrow,
to distil its essence, to doodle with it.

For the rest of the lesson we will call these arrows "vectors",
because it is always useful to give special names to important concepts.
It certainly helps, when searching in the library,
to know to ask about vectors instead of "the type of arrows scientists use in their doodles".
As Ursula Le Guin writes, knowing one's true name gives you power over them.

A great way to see the power of vectors is to employ them to describe intricate motion.
However, before we describe a journey, we need to describe its starting point.
We need to be able to draw a vector corresponding to our own position:

`Add a drawing of an arrow here pointing to a point saying "you are here"`

Then we need to draw a vector describing our next step... And the next one, and the next one.

`Add an animation of multiple steps`

And by *adding* these steps together, we finally find our new position.
This leads us to two important concepts.
First is vector addition.
Vector addition is easy to understand if you think of vectors as representing motion.
Vector $\vec{A}$ represents displacement and ...
When we perform both displacements we denote the new compound displacement as $\vec{C}$ ...

`An animation of the displacements being summed up.`

`A drawing of all the steps and a new vector pointing to the "you ended here" point`.

The second crucial concept is the idea of a rate of change. Steps... steps per second... velocity...

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

Yada yada how the acceleration is the same but for velocity...

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

Now that we have mastered the essence of vectors,
we will proceed to conquer their representation as pairs of numbers:
an important tool if we are to use our new powers on a computer,
as computers understand only numbers.
Vectors have a length (mathematicians usually call it *magnitude* or *norm*) and orientation.
We will see how to encode these properties as pairs of numbers. 

Stefan: **I strongly believe we should use meters or steps, but definitely not feet**

Imagine that you are standing in the middle of an empty school cafeteria. The floor is 
tiled with squares that are 1 foot wide. We will imagine that a giant coordinate system 
has been drawn on the floor and you are standing at the location x = 0 and y = 0.

(add image)

If you take a step forward, we can define the magnitude of your displacement
vector by comparing your final and initial positions. In this case, the magnitude is 1 foot
because you are 1 foot from your starting position.
The direction of your movement is defined using an angle. This requires agreeing on how
to describe the direction. If we were looking at a map, we might agree to describe the direction
relative to North. For vector motion, scientists, mathematicians and others have agreed to
describe the direction of a vector in terms of the angle relative to east, or the x-axis.
In this case, if you have moved towards the door in the image, you have moved north, or 
with an angle of 90 degrees from the x-axis.

If your friend, who has joined you in this adventure, moves 1 step to the right from the 
center of the cafeteria, she will have also moved with a magnitude of 1 foot. But her
direction will be 0 degrees.

(add image with diagonal motion)
Now, lets move back to the center of the cafeteria and move on a diagonal one tile. This
motion is the combination of moving one foot up and one foot to the right. The magnitude
is the distance of the diagonal (sqrt(2)) and the direction is 45 degrees. Try moving
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


#grid1d .vis {
  width: 40%;
  font-size: 2rem;
  height: 4rem;
  line-height: 4rem;
  border: solid 1px;
  border-color: black;
  display: block;
  margin: auto;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
}

#move2d .spacer {

  width:5%;
}

</style>

<div id="grid1d">
<input type="number" min="-10" max="10"  id="xvalue">
<input type="number" min="-10" max="10"  id="yvalue">

<span class="spacer"></span>

<svg id="axis" width="800" height="800" viewBox="0 0 800 800">
<line x1="0" y1="400" x2="800" y2="400" style="stroke:rgb(1,1,1);stroke-width:2" />
<line x1="400" y1="0" x2="400" y2="800" style="stroke:rgb(1,1,1);stroke-width:2" />
</svg>
<span class="spacer"></span>

<button id="plotButton">Plot</button>

<script>

//extract desired elements
var xElement = document.getElementById("xvalue");
var yElement = document.getElementById("yvalue");

var entireDiv = document.getElementById("move2d");
var waveVis = document.querySelector("#move2d .vis");

// define event handler
function plotVector(){
	// extract desired info
    var x = xElement.value;
    var y = yElement.value;
  	console.log(x)
  
    
}

// decide what event handlers to use
plotButton.onclick = plotVector;


</script>
</div>


So far, we have only discussed displacement vectors. But vectors can be used to
represent many different quantities. Of importance to the Spinwheel is the representation
of velocity. Instead of measuring the amount and direction an item has moved, we can measure the speed
and direction, giving a velocity vector. In the video below, a ball is rolling down a slope.
The vector to represent this motion has a magnitude of 5 meters per second and a direction
of 330 degrees.

(image or video of a ball moving down a slope)

Introduction of vectors as having magnitude and direction

Use of angles to represent direction

example of a ball rolling down a slope

We can describe motion through the competing forces acting on an object

Kinematics encompasses motion of objects through space by describing their speed and direction. 

Speed/Velocity

acceleration/Inertia 
(Examples of differentially massed objects)
