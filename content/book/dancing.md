---
title: Dancing with Color
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
In this adventure, you will explore the ways we can describe motion mathematically and code colorful representations of that math. 
:::

Whether you’ve watched a dance, or are a dancer yourself, you know dancing is all about movement. Be it a pirouette, a leap, or a straight line, dancers gracefully move through space in exciting ways. Your SpinWheel can act as a dancer too! Mathematically we can represent this motion in many ways. In this lesson, we will write colorful visualizations of this math that you can explore with SpinWheel!

## Linear Motion: Line Dancing

The first way we will think about motions is by moving along a line. We can move back and forth on a line but in no other direction. This is called one dimension motion. Below you can use your mouse to drag the circle along one dimension. Think of this like a dancer moving back and forth across the stage. 


<style>
#move1d {
  text-align: center;
}
#move1d #location {
  width: 80%;
  top:0.5rem;
}

#move1d .vis {
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
#move1d .spacer {

  width:5%;
}

</style>

<div id="move1d">
<input type="range" min="0" max="2000" value="1000" id="location">
<span class="spacer"></span>
<div><span class="vis"><span id="waveView"></span></span></div>

<script>

//extract desired elements
var locElement = document.getElementById("location");
var entireDiv = document.getElementById("move1d");
var waveVis = document.querySelector("#move1d .vis");

var xOld = 0;
var tOld = new Date();

// define event handler
function getValue(){
	// extract desired info
    var x = locElement.value;
    var t = new Date();
    var v = (x - xOld)/(t-tOld);
   
    // do interesting things
    

    if (v < 0 ){
    	var r = 256;
    	var b = 0;
    	}
    else {
    	var r = 0
    	var b = 256;
    	}
  
  	var g = 0;
  	//console.log(Math.abs(v))
  	var op = Math.abs(v)/10;
  	if (op < 0.1){
  		op = 0.1;
  		}
  	if (op > 1){
  		op = 1;
  		}
  	  
    waveVis.style["background-color"]= `rgba(${r},${g},${b},${op})`;
    
    // update globals
	xOld = x;
    tOld = t;
    
}

// decide what event handlers to use
locElement.oninput = getValue;


</script>
</div>


Notice when you dragged your mouse, your screen lit up at different brightnesses and colors! Try moving your mouse faster and slower! Also, in different directions!

As you can see, when you drag the mouse faster, the line gets more colorful! How fast or slow the mouse is moving is called speed. Now, did you also notice that if you dragged the mouse forward, then backward, the overall color changed? This is because we can assign a direction to our speed, and call it velocity! In our one dimensional case, left or right, or perhaps positive and negative, tell us the direction we are moving.

## Linear motion: A Three Line Dance

We’ve talked about motion in 1-D, but we don’t live and move and dance on a single line. We’re free to go forwards and back, left and right, up and down, and even along curves. Instead of one line, we can represent our everyday motions by moving along three lines. We call this three dimensional (3D) motion. Maybe you’ve seen an X Y Z grid before. This is called a cartesian coordinate system. If you click a point on the animation below, you can see how we could jump to any location in space with these three lines. 

<!-- TODO: Insert animation -->
Insert animation: I am imagining a grid (I was thinking 3D, but we could move to 2D if needed) where you click on a point, and the animation draws how you move to that line in (x,y,z) coordinates. I was also hoping to display the point (x, y, z) as a title or the top corner. First, trace the x-direction in one color (maybe pink), and fill in the x coordinate in pink. Trace y in a light blue color (fill in coordinate too), and trace z in. Leave the colorful path there until another point is selected. I think the exact color depends on the color scheme!

You’re SpinWheel can do the same! Inside your SpinWheel is a motion sensor. You can program your SpinWheel to light up different colors as it moves through space like this animation. Upload this sketch to your SpinWheel and explore how it can dance through 3D space. 

# Test of motion simulation

After you click `Run`, grab the SpinWheel and shake it.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.readIMU();
  float ax = abs(SpinWheel.ax)*100;
  float ay = abs(SpinWheel.ay)*100;
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(ax, ay, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

As you move the SpinWheel, do you notice the different colors and brightness? Just like in our one-dimensional line, could you see different colors representing directions? Now we have three lines and 6 directions to move. Did the speed you moved your SpinWheel change the brightness?

If you are interested in reading a more detailed explanation of what each line above does, then check out [this annotated script](/codedoc/examples/Dancing_with_Color/Acceleration_Light_Up_Basic/Acceleration_Light_Up_Basic.ino.html). 

::: further-reading
To learn more about modifying the SpinWheel's LED display with the output from the SpinWheel's motion sensors, check out the ["Step Counter" activity](/stepcounter). This lesson will teach you to access the output from the motion sensors, monitor it on your computer, and use this to turn your SpinWheel into a step counter. You can do this lesson either now or after finishing the rest of this lesson.
:::


## Turning: Rotational Motion

We've talked about moving through space in line, 
but now imagine a dancer's feet doing turn after turn and their arms outstretched in different configurations. 
Can you picture how their arms and feet move through space in small tight turns, like chaînés turns, and wide turns, like an attitude or a fouetté? 


There are many different ways we can describe all types of different dances! 
Mathematically, we could say that there are many different coordinate systems to describe motion. 
A dancer turning is a type of rotational motion. 
Instead of describing each point by drawing three separate lines, 
we could think of this motion in terms of points along a circle. 
This system is called polar coordinates.

![Notice how in tight turns or wide turns, a dancers feet create different size circles through space. We coudl describe these circles using polar coordinates.
](/images/dance_turn.jpg)

::: further-reading
Polar coordinates are useful to describe points along a circle more easily than in Cartesian coordinates, but knowing more about them isn't important for the rest of this lesson. If you are interested in diving into this idea a bit more deeply, then check out our [rotation lesson](/rotation).  
:::

There are special sensors in your SpinWheel, called gyroscopes, that allow it to detect rotational motion. 
We can use the output from these sensors to have the SpinWheel respond to spinning! To begin, we can start with a simpler case and program the SpinWheel to light up when it detects rotation around one axis. 

In this case, we're measuring the rotation around the SpinWhee's x-axis, which is stored in the variable SpinWheel.gx. As the sensor is very sensitive, we only want to change color if there is sufficient rotation. In this case, we will only have the color change if absolute value of the rotation is greater than 1. 

![In this picture you can see the x and y axes of your SpinWheel.
](/images/dance_axis.jpg)

To see the senor respond to rotional motion, upload [this sketch](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Basic/1D_Rotation_Light_Up_Basic.ino.html) and explore what happens when you rotate your SpinWheel.

<!--TODO: Maybe only choose one or two of these to be in the lesson and have the rest be elsewhere; Add more context/explanation/better commenting -->

One simple modification we can make to the previous sketch is to have the LEDs change color based on the direction of rotation. In the script below, the LEDs light up green up when the device is spun in one direction, and blue when spun in the other direction. If you prefer other colors, then you can modify the code below to change the colors. For a hint of how to do this and a more detailed explanation of those code, you can also check out [this script](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Advanced/1D_Rotation_Light_Up_Advanced.ino.html).
  
```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Initialize all of the hardware on the SpinWheel.
  SpinWheel.begin();
}

int pos_spin = 0;
int neg_spin = 0;

void loop() {
  SpinWheel.readIMU();
  // If the x rotation (gx) is big enough, then 
  // change the color of the big LEDs based on the
  // direction of the spin
  if (abs(SpinWheel.gx) > 1) {
    pos_spin = 255;
    neg_spin = 0;
  }
  else if (SpinWheel.gx < -1) {
    neg_spin = 255;
    pos_spin = 0;
  }
  else {
    pos_spin = 0;
    neg_spin = 0;
  }
  // If gz is positive, set the big LEDs to light up green
  // If gz is negative, set the big LEDs to light up blue
  SpinWheel.setLargeLEDsUniform(0, pos_spin, neg_spin);
  // Make the SpinWheel show the registered color.
  SpinWheel.drawFrame();
 }
```

It is also possible to measure and change the SpinWheel's LEDs color based on rotation in 3D space. 
In [this sketch](/codedoc/examples/Dancing_with_Color/3D_Rotation_Light_Up/3D_Rotation_Light_Up.ino.html) 
,you can code the red, green, and blue components of the LEDs to respond to the rotation around the x, y, and z axes. 
Rather than only modifying the large LEDs as in the earlier sketches, this sketch also has the small LEDs light up in response to the SpinWheel's rotational motion.


One of the programs that came preloaded on your SpinWheel was an LED "snake" that spins around the device. 
We can modify this snake so that it only rotates when you rotate. 
You will program the SpinWheel LEDs to light up and turn and turn like a dancer. 
[In this script](/codedoc/examples/Dancing_with_Color/Motion_Snake/Motion_Snake.ino.html)
,we'll introduce a new function: `SpinWheel.setSmallLEDsPointer(angle, decay, red, green, and blue)`. 
Angle controls how big the snake is, 
decay the fade at the end of the snake, and red, green, and blue represent the red, green, and blue component of the small LEDs. 
The "snake" only moves when you rotate along the x axis. 
Can you modify the color of the snake? 
What about changing how long the snake is? Can you have it respond to rotation around the other axes? What about making it change with respect to acceleration in one direction? What about making it respond to motion in all three directions? 


## The Grand Finale: Showing Off All Its Colors

You’ve explored both linear and rotational motion independtly so far in this adventure. Using the above scripts as a starting point, you can modify the SpinWheel to respond to your motion however you see fit! 
We'll leave you with one final more complicated sketch to inspire your imagination. 
Here is a webpage with a [grand finale code and explaination](/codedoc/examples/Dancing_with_Color/Grand_Finale/Grand_Finale.ino.html). This script has the SpinWheel respond to both acceleration and rotation.


To see even more dances mathematically, 
you can watch Mariel Pettee’s, 
a physics graduate student who studies particle physics as well as physics and dance, 
[AI-generated dances](https://vimeo.com/400629616) below. 
![Mariel Pette: Mirror Exercise](/images/PlaceholderDancing.png)

You can also watch more of her videos [here](https://vimeo.com/400641881) and read a [paper](https://arxiv.org/abs/1907.05297)  on this research.  


<!--TODO: insert Mariel's video here -->

