---
title: Color Coding
keywords: SpinWheel, getting started, experimenting
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
Before you dive into programming the SpinWheel, 
first give this adventure a try to learn more about what the SpinWheel is capable of.
We'll start with some simple animations
and end with some code that you'll add to the SpinWheel itself in later adventures.
:::

Welcome to the SpinWheel educational materials! 
This page is the first of many adventures and lessons that we have written
to empower you to begin coding the SpinWheel for yourself.
If you have never programmed before, 
we hope that this lesson will help you become more comfortable 
with looking at code and guessing what it might do.
If you already have coding experience, 
then you may prefer to complete the [initial setup guide](/quickstart)
and then jump into the later adventures.


## The SpinWheel

When you pulled the SpinWheel out of the box and turned it on for the first time,
the first thing you may have noticed is its LEDs. 
As you toggle between the programs on the SpinWheel using the button on the back,
you can see some of the many things that the SpinWheel can do.
You can program the LEDs to make repeating patterns or respond to the motion of the device.
You can also light up all the LEDs in one color. 
As you go through the adventures and lessons in our [field guide](/book), 
you will learn how we did this and become comfortable customizing it further.

## Controlling the SpinWheel

Before you start programming your SpinWheel, 
we will start by experimenting with some virtual SpinWheels
right here in your internet window.
Do not worry at this point about understanding fully what 
every line of code does.
We encourage you to experiment with changing the parameters
and then observing what happens.
This may feel uncomfortable at first,
but keep trying and don't be afraid if you don't understand
everything the first time you read it.

### Turning on the Large LEDs

To start with, let's try turning on all of the big LEDs.
Using the sliders you can try changing the colors
on the virtual SpinWheel below:

#### this will be updated to have a virtual SpinWheel whose large LEDs change instead of just a box that shows the color 
<!--TODO: is there some way that we can instead have the sliders control the color on a virtual SpinWheel?-->
<style>
#colortests {
  font-size: 2rem;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
}
#colortests input {
  width: 20%;
  margin: 0;
}
#colortests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
#colortests .spacer {
  width:5%;
}
#colortests .vis {
  width: 20%;
  height: 2em;
  line-height: 2em;
  border: solid 1px;
}
#redshow {border-color: red !important;}
#greenshow {border-color: green !important;}
#blueshow {border-color: blue !important;}
</style>
<div id="colortests">
<div><input type="range" min="0" max="255" value="255" id="red"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="green"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="blue"></div>
<div><span class="vis" id="redshow">255</span><span class="spacer">+</span><span class="vis" id="greenshow">255</span><span class="spacer">+</span><span class="vis" id="blueshow">255</span><span class="spacer">=</span><span class="vis" id="rgbshow">&nbsp;</span></div>
<script>
function changeColor(){
  var r = document.getElementById("red").value;
  var g = document.getElementById("green").value;
  var b = document.getElementById("blue").value;
  document.getElementById("rgbshow").style["background-color"]=`rgb(${r},${g},${b})`;
  document.getElementById("redshow").innerHTML=r;
  document.getElementById("redshow").style["background-color"]=`rgb(${r},0,0)`;
  document.getElementById("greenshow").innerHTML=g;
  document.getElementById("greenshow").style["background-color"]=`rgb(0,${g},0)`;
  document.getElementById("blueshow").innerHTML=b;
  document.getElementById("blueshow").style["background-color"]=`rgb(0,0,${b})`;
}
document.getElementById("red").oninput = changeColor;
document.getElementById("green").oninput = changeColor;
document.getElementById("blue").oninput = changeColor;
changeColor();
</script>
</div>



::: further-reading
To learn why we are mixing colors using red, green, and blue,  
check out our [Biology of Sight](/sight) adventure.
On this page, you can try this out this on your own SpinWheel, 
as well as learn more about how our eyes work.
::: 

On your SpinWheel, rather than using sliders to change the color, 
you will instead use building blocks of code.
On the virtual SpinWheel below, you can see how the code that you
would run on your physical SpinWheel would change the LED display.
For now, focus only on the line `SpinWheel.setLargeLEDsUniform(50, 255, 225)`.
It has three numbers that you can change to control the color that the SpinWheel lights up. 
Like with the sliders, where you created colors by mixing red, green, and blue together,
the first number, `50`, represents the amount of red, 
the next, `255`, represents the amount of green, 
and the final, `225`, gives the amount of blue.
These combinations give a bright blue color.
Try changing these numbers for yourself 
and then press "Run for 10 seconds" button to see what happens.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(50, 255, 250);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

::: further-reading
If you are really curious about what those other lines mean, 
we explain them more in our [basic structure of a program](basics) adventure.
We recommend doing that page after the [initial setup guide](/quickstart).
:::

It is also possible to specifically turn on just one large LED.


#### an interactive widget will be added here to allow students to try controlling each large LED's color independently of the others 
<!-- is there some way that we can hide the code and just have sliders for each LED where they can cahnge the colors?-->
<!-- in this widget, it should be very clear which number corresponds to which LED on the device, maybe having numbering directly on the SpinWheel. -->

Now let's try doing the same thing, 
but using the code you will put on your SpinWheel.
To start with, we are just turning on one LED.
However, you can copy this line and independently control each large LED.
Try this for yourself below!

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 0, 100);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

### Turning on the Small LEDs

You can also turn on only the small LEDs.
To do this, rather than using `SpinWheel.setLargeLEDsUniform`,
you instead can use the line `SpinWheel.setSmallLEDsUniform`.
Like above, the three numbers represent the red, green, and blue 
components of the color you want to make.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(255, 255, 255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

In the same way that you used `SpinWheel.setLargeLED`, 
you can also use `SpinWheel.setSmallLED` to control 
each of the 12 small LEDs on their own.
Experiment with adding more lines to turn on more of the small LEDs
or create a completely different pattern.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLED(2, 0, 255, 0);
  SpinWheel.setSmallLED(5, 0, 255, 0);
  SpinWheel.setSmallLED(8, 0, 255, 0);
  SpinWheel.setSmallLED(11, 0, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>


### Controlling all of the LEDs 

It is also possible to control each large and small LED independently,
below we turn on all of the LEDs together:

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 250, 0);
  SpinWheel.setLargeLED(2, 255, 250, 0);
  SpinWheel.setLargeLED(5, 255, 250, 0);
  SpinWheel.setLargeLED(7, 255, 250, 0);

  SpinWheel.setLargeLED(1, 255, 0, 0);
  SpinWheel.setLargeLED(3, 255, 0, 0);
  SpinWheel.setLargeLED(4, 255, 0, 0);
  SpinWheel.setLargeLED(6, 255, 0, 0);

  SpinWheel.setSmallLED(0, 255, 70, 0);
  SpinWheel.setSmallLED(1, 255, 100, 0);
  SpinWheel.setSmallLED(2, 255, 200, 0);

  SpinWheel.setSmallLED(3, 255, 200, 0);
  SpinWheel.setSmallLED(4, 255, 100, 0);
  SpinWheel.setSmallLED(5, 255, 70, 0);

  SpinWheel.setSmallLED(6, 255, 70, 0);
  SpinWheel.setSmallLED(7, 255, 100, 0);
  SpinWheel.setSmallLED(8, 255, 200, 0);

  SpinWheel.setSmallLED(9, 255, 200, 0);
  SpinWheel.setSmallLED(10, 255, 100, 0);
  SpinWheel.setSmallLED(11, 255, 70, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

At this point, you can modify the code above to create your own pattern
that uses all of the LEDs.
We encourage you to take some time to experiment with this to create your own designs.
Once you have some patterns that you are excited 
to try on your own SpinWheel, then proceed to the [initial setup guide](/quickstart)
that leads you through installing the computer program necessary to use the SpinWheel
and the [basic structure of a program](/basics) 
that will get you to the point where you can put the code that you wrote above
onto your own SpinWheel.

