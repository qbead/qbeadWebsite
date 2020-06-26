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
.vslider {
  width: 100px;
  height: 100px;
  position: relative;
}
.vhandle {
  display: block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: black;
  position: absolute;
  left: 45px;
  top: 45px;
}
</style>
<div id="v_to_path">
<div class="vslider"><span class="vhandle"></span></div>
<canvas class="trajectory" width=100 height=100></canvas>
</div>
<script>
const v_to_path = document.getElementById('v_to_path');
const v2p_vhandle = v_to_path.getElementsByClassName('vhandle')[0];
const v2p_ctx = v_to_path.getElementsByClassName('trajectory')[0].getContext('2d');

function dragElement(elmnt, ctx) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  elmnt.onmousedown = dragMouseDown;
  var ipos1 = 50, ipos2 = 50;
  var intervalhandler;
  
  ctx.strokeStyle='black';
  
  function drawStep() {
    ipos2 += 0.1*(elmnt.offsetTop-45);
    ipos1 += 0.1*(elmnt.offsetLeft-45);
    if (0<=ipos1 && ipos1<100 && 0<=ipos2 && ipos2<100) {
      ctx.lineTo(ipos1, ipos2);
    } else {
      ipos1 = (ipos1+100)%100;
      ipos2 = (ipos2+100)%100;
      ctx.moveTo(ipos1, ipos2);
    }
    ctx.stroke();
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    ctx.beginPath();
    ctx.moveTo(50,50);
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
    intervalhandler = setInterval(drawStep, 100);
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
    elmnt.style.top = "45px";
    elmnt.style.left = "45px";
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

dragElement(v2p_vhandle, v2p_ctx);
</script>

Yada yada how the acceleration is the same but for velocity...

`A widget where you pick an acceleration and you get a velocity and a trajectory`

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

Widget: allow user to input coordinates, draw the vector and output the magnitude
and direction

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
