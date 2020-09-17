---
title: Dancing with Color<br>-Linear Motion-
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
In this adventure, you will explore the ways we can describe motion mathematically and code the SpinWheel to light up based on simple linear dance motions. This is part one of the Dancing with Color series that turns the SpinWheel into an accessory that responds to your motions while dancing.
:::

Whether you’ve watched a dance, or are a dancer yourself, you know dancing is all about movement. Be it a pirouette, a leap, or chasse, dancers gracefully move through space in exciting ways. In this lesson, we will write programs that light up the SpinWheel in different ways to different motions!

## A Line Dance

The first type of motion we will explore is moving along a line. We can move back and forth on a line but in no other direction. This is called one dimensional motion. Below you can use your mouse to drag the circle along one dimension. Think of this like a dancer moving back and forth across the stage. 


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

As you can see, when you drag the mouse faster, the color gets brighter! How fast or slow the mouse is moving is called speed. Now, did you also notice that if you dragged the mouse to the left, then to the right, the color changes? The color represents the direction of our speed. When scientists care about the direction, we call it velocity! The color of the box becomes blue when we drag the slider to the right and red when we drag the slider to the left. The color tells us the direction we are moving (right or left). When we represent velocity with numbers, we call motion in one direction positive and motion in the opposite direction negative.

::: further-reading
We discuss the idea of velocity more in our lesson on [Vectors and Motion](/vectors). Check it out if you want to learn more about velocity (and acceleration).
:::

## Dancing in Three Dimensions

We’ve talked about motion in one dimension (1D), but we don’t live and move and dance on a single line. We’re free to go forwards and back, left and right, up and down, and even along curves. Instead of one line, we can represent our everyday motions as the movement along three lines. We call this three dimensional (3D) motion. When we move, or when the SpinWheel moves, we
are travelling in 3D space. Inside your SpinWheel is a motion sensor that can tell when the SpinWheel accelerates (increases in speed) or deaccelerates (decreases in speed). 

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
  SpinWheel.setLargeLEDsUniform(ax, ay, 0);
  SpinWheel.drawFrame();
}
</pre>
</div>

If you are interested in reading a more detailed explanation of what each line of the above sketch does, then check out [this annotated script](/codedoc/examples/Dancing_with_Color/Acceleration_Light_Up_Basic/Acceleration_Light_Up_Basic.ino.html). 

The ways the SpinWheel changes with motion is easier to see if you upload the sketch directly onto your SpinWheel: `Examples → SpinWearables → Dancing_with_Color → Acceleration_Light_Up_Basic`. After you open the file, you can upload this sketch to your SpinWheel and explore how the LEDs change as you shake the SpinWheel.
To see these colors clearly, place your SpinWheel on a table, oriented to match the virtual SpinWheel. Try moving the SpinWheel left and right, up and down, while keeping it on the  table. 

The virtual SpinWheel can only move in two dimensions as it is trapped in the plane of your computer screen. For this reason, the code above and that you just uploaded onto your SpinWheel only shows the motion in two dimensions. Acceleration to the left and right (`ax`) controls the red component of the LEDs, while acceleration up and down (`ay`) controls the green component of the LEDs. The SpinWheel flashes yellow when it moves at an angle instead of straight up and down because then there is acceleration in both the horizontal and vertical directions. If you carefully lift your SpinWheel from the table, you'll notice that the color does not change. This is because movement in the z direction isn't included in this code.

![This picture demonstrates the three axes that the SpinWheel can detect rotation around. We'll dive into what this means more in the rest of the lesson! <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)

Did how you moved your SpinWheel change the brightness? With a faster acceleration, you may have noticed that the SpinWheel's LEDs lit up more brightly. You may have also noticed that if you move the SpinWheel with constant speed, the LEDs don't light up. Since the SpinWheel only responds to acceleration, it only lights up when the speed is increasing (accelerating) or slowing down (deaccelerating).

::: further-reading
To learn more about modifying the SpinWheel's LED display with the output from the SpinWheel's motion sensors, check out the [Step Counter](/stepcounter) adventure. This lesson will teach you to access the output from the motion sensors, monitor it on your computer, and use this to turn your SpinWheel into a step counter. 
:::

To have the SpinWheel instead respond to motion in all three dimensions, you can modify the code to also measure the acceleration in z direction. You can modify the `Acceleration_Light_Up_Basic` sketch by adding the following line after the lines storing the acceleration in the y direction, `float ay = abs(SpinWheel.ay)*100;`: 

```cpp
float az = abs(SpinWheel.az)*100;
```

and replacing the `SpinWheel.setLargeLEDsUniform(ax, ay, 0);` line with:

```cpp
SpinWheel.setLargeLEDsUniform(ax, ay, az);
```

Now if you lift the SpinWheel horizontally up off the table it will light up blue. Try disconnecting the SpinWheel from your computer (switch it to `BAT` to light up again) and shaking it in different ways. What colors can you create?

::: further-reading
You may notice that the LEDs always light up one color, even though the SpinWheel remains still. The reason for this is that the SpinWheel's acceleration sensor can't tell the difference between acceleration when you shake it and the force of gravity. If you hold the SpinWheel by the keyring, it will light of green because it experiences gravity along the y-dimension. If instead you hold the SpinWheel horizontal, it will light up blue. By changing the angle of the SpinWheel, the SpinWheel will light up other colors. This becomes important in the [Step Counter](/stepcounter) adventure, so we will learn how to adjust for the effect of gravity there.
:::

To wrap up this adventure, 
we'll leave you with [this video](https://vimeo.com/400629616) that illustrates another way math, physics, and art can be combined.
This animation was created by Mariel Pettee, 
a physics graduate student who studies particle physics as well as physics and dance.

<figure><video src="/images/bookpics/mariel.mp4" controls></video><figcaption>A physicist's interpretation of a dance.</figcaption></figure>

::: further-reading
Mariel created this video using programming tools that she developed in collaboration with dancers, physicists, and computer science researchers. You can watch more of her videos [here](https://vimeo.com/400641881) and read a [paper](https://arxiv.org/abs/1907.05297) on this research.
:::

If you are excited about having your SpinWheel respond to rotational motion, continue on to [part 2 of the Dancing with Color](/dancing2) series of adventures.


<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
