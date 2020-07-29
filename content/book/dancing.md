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

Whether you’ve watched a dance, or are a dancer yourself, you know dancing is all about movement. Be it a pirouette, a leap, or a straight line, dancers gracefully move through space in exciting ways. Your SpinWheel can act as a dancer too! Mathematically we can represent this motion in many ways. In this lesson, we will write colorful visualizations of this math that you can explore with you SpinWheel!

## Linear Motion: Line Dancing

The first way we will think about motion is by moving along a line. We can move back and forth on a line but in no other direction. This is called one dimension motion. Below you can use your mouse to drag the circle along one dimension. Think of this like a dancer moving back and forth across the stage. 


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
    	var r = 0;
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


Notice when you dragged your mouse, your screen lit up at different brightnesses and colors! Try moving your mouse faster and slower!

As you can see, when you drag the mouse faster, the color gets brighter! How fast or slow the mouse is moving is called speed. Now, did you also notice that if you dragged the mouse to the left, then to the right, the color changes? This is because we can assign a direction to our speed, and call it velocity! The color of the box becomes blue when we drag the slider to the right and red when we drag the slider to the left. The color tells us the direction we are moving (right or left). When we represent velocity with numbers, we call motion in one direction positive and motion in the opposite direction negative.

::: further-reading
We discuss the idea of velocity more in our lesson on [vectors and kinematics](/vectors). Kinematics is simply a fancy word for the study of motion. 
:::

## Linear motion: A Three Line Dance

We’ve talked about motion in one dimension (1D), but we don’t live and move and dance on a single line. We’re free to go forwards and back, left and right, up and down, and even along curves. Instead of one line, we can represent our everyday motions by moving along three lines. We call this three dimensional (3D) motion. When we move, or when the SpinWheel moves, we
are travelling in 3D space. Inside your SpinWheel is a motion sensor that can tell when the SpinWheel moves. 

::: further-reading
If you are curious about the sensor itself, check out our [specs](/specs) page where we talk more about the motion sensor and the other components of the SpinWheel.
:::


The code below will light up the virtual SpinWheel in  different colors as it moves.
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

The ways the SpinWheel changes with motion is easier to see if you upload the sketch directly onto your SpinWheel: `Examples → SpinWearables → Dancing_with_Color → Acceleration_Light_Up_Basic`. After you open the file and save it, you can upload this sketch to your SpinWheel and explore how the LEDs change as it dances through 3D space.
To see these colors clearly, place your SpinWheel on a table, oriented to match the virtual SpinWheel. Try moving the SpinWheel left and right, up and down, while keeping it on the  table. 

The virtual SpinWheel can only move in two dimensions as it is trapped in the plane of your computer screen. For this reason, the code above and that you just uploaded onto your SpinWheel only shows the motion in two dimensions. Acceleration to the left and right (`ax`) controls the red component of the LEDs, while acceleration up and down (`ay`) controls the green component of the LEDs. The SpinWheel flashes yellow when it moves at an angle instead of straight up and down because then there is acceleration in both the horizontal and vertical directions. If you carefully lift your SpinWheel from the table, you'll notice that the color does not change. This is because movement in the z direction isn't included in this code.

Did the speed you moved your SpinWheel change the brightness? With a faster acceleration, you may have noticed that the SpinWheel's LEDs lit up more brightly.

If you are interested in reading a more detailed explanation of what each line above does, then check out [this annotated script](/codedoc/examples/Dancing_with_Color/Acceleration_Light_Up_Basic/Acceleration_Light_Up_Basic.ino.html). 

::: further-reading
To learn more about modifying the SpinWheel's LED display with the output from the SpinWheel's motion sensors, check out the ["Step Counter" activity](/stepcounter). This lesson will teach you to access the output from the motion sensors, monitor it on your computer, and use this to turn your SpinWheel into a step counter. You can do this lesson either now or after finishing the rest of this lesson. 
:::


## Turning: Rotational Motion

We've talked about moving through space in line, 
but now imagine a dancer's feet doing turn after turn and their arms outstretched in different configurations. 
Can you picture how their arms and feet move through space in small tight turns, like chaînés turns, and wide turns, like an attitude or a fouetté? 


There are many different ways we can describe all types of different dances! 
A dancer moving side to side is a type of translational motion.
A dancer turning in a circle is a type of rotational motion. 

![Notice how in tight turns or wide turns, a dancer's feet create different size circles on the floor. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_turn.png)

A simple way to describe rotational motion is as the movement around an axis. When a dancer spins, without moving around the stage, they are rotating around the axis of their body. 
There are special sensors in your SpinWheel, called gyroscopes, that allow it to detect rotational motion. 
We can use the output from these sensors to have the SpinWheel respond to spinning! 

![This picture demonstrates the three axes that the SpinWheel can detect rotation around. We'll dive into what this means more in the rest of the lesson! <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)

### Rotation Around One Axis

To begin, we can program the SpinWheel to light up when it detects rotation around one axis. 
This is similar to the dancer spinning in place where their body represents the axis of each turn. 
In this case, we're measuring the rotation around the SpinWhee's x-axis, which is stored in the variable `SpinWheel.gx`. 
As the sensor is very sensitive, we only want to change color if there is sufficient rotation. 
In this case, we will only have the color change `if` the absolute value of the rotation is greater than 1, `abs(SpinWheel.gx) > 1`. 
Below is the essential piece of code, where we tell the SpinWheel to light up only when motion is detected (`if (abs(SpinWheel.gx) > 1)` and to otherwise (`else`) turn off all of the LEDs.

```cpp
// if there is enough rotation, then light up the 
// LEDs a light blue
if (abs(SpinWheel.gx) > 1) {
  SpinWheel.setLargeLEDsUniform(0, 255, 255);
}
// otherwise, keep the LEDs turned off
else {
  SpinWheel.setLargeLEDsUniform(0,0,0);
}
```

To see your SpinWheel light up in response to rotional motion, upload the full sketch (`Examples → SpinWearables → Dancing_with_Color → 1D_Rotation_Light_Up_Basic`) to your SpinWheel and explore what happens when you rotate your SpinWheel. You can can also read more about what each command in [this 1D Rotation sketch](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Basic/1D_Rotation_Light_Up_Basic.ino.html) does.

If you prefer other colors to the light blue that we chose, then you can modify the code for this example to light up your SpinWheel a different color. 

::: further-reading
Looking for a refresher on how to customize the LEDs to light up your favorite color? In our [biology of sight adventure](/sight), we discuss how three light sources can be used to represent any color of the rainbow by taking advantage of how our eyes perceive color.
:::

Another modification you can make to the previous sketch is to have the LEDs change color based on the direction of rotation. We include the important new elements of the code below, including defining new variables `pos_spin` and `neg_spin` to store the direction that the SpinWheel is rotating around the x-axis.

```cpp
// If the x rotation (gx) is big enough, then 
// change the color of the big LEDs based on the
// direction of the spin
if (SpinWheel.gx > 1) {
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
```

In this script, the LEDs light up green up when the device is spun around the x-axis in one direction (`if (SpinWheel.gz > 1)`), and blue when spun in the other direction (`else if (SpinWheel.gx < -1)`). The `else` statment ensures that the SpinWheel's LEDs turn off when not enough rotation is detected. You can upload the sketch from: `Examples → SpinWearables → Dancing_with_Color → 1D_Rotation_Light_Up_Advanced` to give it a try on your own SpinWheel. 
For a more detailed explanation of this code, you can also check out [this script](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Advanced/1D_Rotation_Light_Up_Advanced.ino.html). 

::: further-reading
At this point you may want to check out [our lesson on rotation](/rotation) to learn more.
:::

### Rotation in 3D Space

In the two last sketches, the SpinWheel only changed color when its rotation was around the x-axis. It is also possible to measure and change the SpinWheel's LEDs color based on rotation around any axis in 3D space!

To start off, upload the [3D Rotation sketch](/codedoc/examples/Dancing_with_Color/3D_Rotation_Light_Up/3D_Rotation_Light_Up.ino.html) from here: `Examples → SpinWearables → Dancing_with_Color → 3D_Rotation_Light_Up`. If you read the [details about the code](/codedoc/examples/Dancing_with_Color/3D_Rotation_Light_Up/3D_Rotation_Light_Up.ino.html), you will see how you can code the red, green, and blue components of the LEDs to respond to the rotation around the x, y, and z axes. 
Rather than only modifying the large LEDs as in the earlier sketches, this sketch also has the small LEDs light up in response to the SpinWheel's rotational motion. Try rotating your SpinWheel in different directions to make it fully red, green or blue. Can you combine these rotations to make other colors? If the rotation is around two axis at the 
same time, both colors are shown, making yellow, purple or teal.

## Rotating Lights (or an LED "snake")

One of the programs that came preloaded on your SpinWheel was an LED "snake" that spins around the device like a dancer. 
We can change that basic snake code so that it only rotates colors when you rotate the SpinWheel. 

<video src="/images/behindthescenes/circling.mp4" muted autoplay playsinline loop></video>

To create this snake, we'll introduce a new function that lights up several LEDs (making a snake): `SpinWheel.snake(red, green, and blue)`. 
`Red`, `green`, and `blue` control the red, green, and blue components of the small LEDs. By changing these values, you can change the color that your LED "snake" lights up. To try modifying the snake on your SpinWheel, upload the example sketch from here: `Examples → SpinWearables → Dancing_with_Color → Motion_Snake`. You can also read more about our [motion snake script here](/codedoc/examples/Dancing_with_Color/Motion_Snake/Motion_Snake.ino.html) to learn more about how this script works.

You may have noticed that the "snake" currently only moves when you rotate along the x-axis. 
Can you have it respond to rotation around the other axes?  
What about making it respond to motion in all three directions? 
For a hint of how to do this with acceleration, you can check out the [code for the final example of this adventure](/codedoc/examples/Dancing_with_Color/Grand_Finale/Grand_Finale.ino.html).

The past few examples are all relying on the measurements from the gyroscope (sensing rotation). 
However, you could also have the snake (or any of the other sketches) respond to acceleration instead. You can modify the snake to respond to acceleration in one direction or even all three.


## The Grand Finale: Showing Off All Its Colors

You’ve explored both linear and rotational motion independently so far in this adventure. Using the above scripts as a starting point, you can modify the SpinWheel to respond to your motion however you see fit! 
We'll leave you with one final more complicated sketch to inspire your imagination. 
Here is a webpage with our [grand finale code and explaination](/codedoc/examples/Dancing_with_Color/Grand_Finale/Grand_Finale.ino.html). This script has the SpinWheel respond to both acceleration and rotation. To try this code on your SpinWheel or use it as a framework for your own creations, you can find it at `Examples → SpinWearables → Dancing_with_Color → Grand_Finale`.


To see even more dances mathematically, 
you can watch [this video](https://vimeo.com/400629616) below, created by Mariel Pettee, 
a physics graduate student who studies particle physics as well as physics and dance.

<figure><video src="/images/bookpics/mariel.mp4" controls></video><figcaption>A physicist's interpretation of a dance.</figcaption></figure>

::: further-reading
Mariel created this video using programming tools that she developed in a collaboration of dancers, physicists, and computer science researchers. You can watch more of her videos [here](https://vimeo.com/400641881) and read a [paper](https://arxiv.org/abs/1907.05297) on this research.
:::

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>