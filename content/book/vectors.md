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

Elise's Outline for the lesson

Vectors are a method of describing motion such as displacement, velocity and acceleration.
In vectors, a motion is defined by its magnitude and direction. For simplicity, lets 
study displacement, the amount an object has moved relative to it's starting location.

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