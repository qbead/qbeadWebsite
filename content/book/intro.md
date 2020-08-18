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
This page is the first of many adventures and lessons we have written
to empower you create exciting new programs on your SpinWheel.
If you have never programmed before, 
we hope that this lesson will help you become more comfortable 
with looking at new code and figuring out what it might do.
If you already have coding experience, 
then you may prefer jumping to the [initial setup guide](/quickstart)
and then continuing into the other adventures.


## The SpinWheel

When you pulled the SpinWheel out of the box and turned it on for the first time,
the first thing you may have noticed is its LEDs. 
As you toggle between the programs on the SpinWheel using the button on the back,
you can see some of the many things that the SpinWheel can do.
You can program the LEDs to make repeating patterns or respond to the motion of the device.
You can also light up all the LEDs in one color. 
As you go through the adventures and lessons in our [field guide](/book), 
you will learn how these animations were written and become comfortable customizing it further.

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
Using the sliders, you can change the colors
on the virtual SpinWheel below:

<!--WARNING: This really abuses the virtual spinwheel code. Here be dragons... and bugs...-->
<style>
.colortests {
  font-size: 2rem;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
}
.colortests input {
  width: 80%;
  margin: 0;
}
.colortests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
.colortests .vis {
  width: 80%;
  height: 2em;
  line-height: 2em;
  border: solid 1px;
}
.redshow {border-color: red !important;}
.greenshow {border-color: green !important;}
.blueshow {border-color: blue !important;}
</style>
<div id="first-color" class="ssw-container ssw-skip">
<div class="ssw-code">
<div class="colortests">
<div><input type="range" min="0" max="255" value="0" class="red"><br><span class="vis redshow">0</span><br><br><input type="range" min="0" max="255" value="0" class="green"><br><span class="vis greenshow">0</span><br><br><input type="range" min="0" max="255" value="0" class="blue"><br><span class="vis blueshow">0</span></div>
<script>
var firstcolornode = document.getElementById("first-color");
function changeColor(){
  var r = firstcolornode.getElementsByClassName("red")[0].value;
  var g = firstcolornode.getElementsByClassName("green")[0].value;
  var b = firstcolornode.getElementsByClassName("blue")[0].value;
  var col =`rgb(${r},${g},${b})`;
  for (let led of firstcolornode.getElementsByClassName("ssw-large-led")) {
    led.style["background-color"]=col;
  }
  firstcolornode.getElementsByClassName("redshow")[0].innerHTML=r;
  firstcolornode.getElementsByClassName("redshow")[0].style["background-color"]=`rgb(${r},0,0)`;
  firstcolornode.getElementsByClassName("greenshow")[0].innerHTML=g;
  firstcolornode.getElementsByClassName("greenshow")[0].style["background-color"]=`rgb(0,${g},0)`;
  firstcolornode.getElementsByClassName("blueshow")[0].innerHTML=b;
  firstcolornode.getElementsByClassName("blueshow")[0].style["background-color"]=`rgb(0,0,${b})`;
}
firstcolornode.getElementsByClassName("red")[0].oninput = changeColor;
firstcolornode.getElementsByClassName("green")[0].oninput = changeColor;
firstcolornode.getElementsByClassName("blue")[0].oninput = changeColor;
changeColor();
</script>
</div>
</div>
<div class="ssw-vis-out" style="width: 200px;">
<div class="ssw-vis">
<div>
<img src="/simspinwheel/spinwheel_invertgray.png">
<div class="ssw-large-led ssw-large-led0"></div>
<div class="ssw-large-led ssw-large-led1"></div>
<div class="ssw-large-led ssw-large-led2"></div>
<div class="ssw-large-led ssw-large-led3"></div>
<div class="ssw-large-led ssw-large-led4"></div>
<div class="ssw-large-led ssw-large-led5"></div>
<div class="ssw-large-led ssw-large-led6"></div>
<div class="ssw-large-led ssw-large-led7"></div>
<div class="ssw-small-led ssw-small-led0"></div>
<div class="ssw-small-led ssw-small-led1"></div>
<div class="ssw-small-led ssw-small-led2"></div>
<div class="ssw-small-led ssw-small-led3"></div>
<div class="ssw-small-led ssw-small-led4"></div>
<div class="ssw-small-led ssw-small-led5"></div>
<div class="ssw-small-led ssw-small-led6"></div>
<div class="ssw-small-led ssw-small-led7"></div>
<div class="ssw-small-led ssw-small-led8"></div>
<div class="ssw-small-led ssw-small-led9"></div>
<div class="ssw-small-led ssw-small-led10"></div>
<div class="ssw-small-led ssw-small-led11"></div>
</div>
</div>
</div>
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
For now, focus only on the line `SpinWheel.setLargeLEDsUniform(50, 255, 250)`.
It has three numbers that you can change to control the color of the SpinWheel LEDs. 
Like with the sliders, where you created colors by mixing red, green, and blue together,
the first number, `50`, represents the amount of red, 
the next, `255`, represents the amount of green, 
and the final, `250`, gives the amount of blue.
These combinations give a bright blue color.
Try changing these numbers for yourself 
and then press the "Run for 10 seconds" button to see what happens.

<!-- fast timer -->
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

It is also possible to specifically control each large LED. With the first slider, you can select the LED that you want to change the color of. Then, using the other sliders, you can adjust the color of that LED. Repeat this process for each LED you want to change the color of. If you move all three sliders for a given LED to zero, then that will turn the LED "off" again. Experiment with the LED number slider to see how the numbering of the LEDs works (or check out the diagram at the bottom of this section).

<!--WARNING: This really abuses the virtual spinwheel code. Here be dragons... and bugs...-->
<div id="second-color" class="ssw-container ssw-skip">
<div class="ssw-code">
<div class="colortests">
<div><input type="range" min="0" max="7" value="0" class="number"><br>LED Number <span class="numshow">0</span><br><br><input type="range" min="0" max="255" value="255" class="red"><br><span class="vis redshow">255</span><br><br><input type="range" min="0" max="255" value="255" class="green"><br><span class="vis greenshow">255</span><br><br><input type="range" min="0" max="255" value="255" class="blue"><br><span class="vis blueshow">255</span></div>
<script>
var secondcolornode = document.getElementById("second-color");
function changeSingleColor(){
  var n = secondcolornode.getElementsByClassName("number")[0].value;
  var r = secondcolornode.getElementsByClassName("red")[0].value;
  var g = secondcolornode.getElementsByClassName("green")[0].value;
  var b = secondcolornode.getElementsByClassName("blue")[0].value;
  var col =`rgb(${r},${g},${b})`;
  secondcolornode.getElementsByClassName(`ssw-large-led${n}`)[0].style["background-color"]=col;
  secondcolornode.getElementsByClassName("numshow")[0].innerHTML=n;
  secondcolornode.getElementsByClassName("redshow")[0].innerHTML=r;
  secondcolornode.getElementsByClassName("redshow")[0].style["background-color"]=`rgb(${r},0,0)`;
  secondcolornode.getElementsByClassName("greenshow")[0].innerHTML=g;
  secondcolornode.getElementsByClassName("greenshow")[0].style["background-color"]=`rgb(0,${g},0)`;
  secondcolornode.getElementsByClassName("blueshow")[0].innerHTML=b;
  secondcolornode.getElementsByClassName("blueshow")[0].style["background-color"]=`rgb(0,0,${b})`;
}
function changeSingleColorNumber(){
  var n = secondcolornode.getElementsByClassName("number")[0].value;
  secondcolornode.getElementsByClassName("numshow")[0].innerHTML=n;
}
secondcolornode.getElementsByClassName("number")[0].oninput = changeSingleColorNumber;
secondcolornode.getElementsByClassName("red")[0].oninput = changeSingleColor;
secondcolornode.getElementsByClassName("green")[0].oninput = changeSingleColor;
secondcolornode.getElementsByClassName("blue")[0].oninput = changeSingleColor;
changeSingleColor();
</script>
</div>
</div>
<div class="ssw-vis-out" style="width: 200px;">
<div class="ssw-vis">
<div>
<img src="/simspinwheel/spinwheel_invertgray.png">
<div class="ssw-large-led ssw-large-led0"></div>
<div class="ssw-large-led ssw-large-led1"></div>
<div class="ssw-large-led ssw-large-led2"></div>
<div class="ssw-large-led ssw-large-led3"></div>
<div class="ssw-large-led ssw-large-led4"></div>
<div class="ssw-large-led ssw-large-led5"></div>
<div class="ssw-large-led ssw-large-led6"></div>
<div class="ssw-large-led ssw-large-led7"></div>
<div class="ssw-small-led ssw-small-led0"></div>
<div class="ssw-small-led ssw-small-led1"></div>
<div class="ssw-small-led ssw-small-led2"></div>
<div class="ssw-small-led ssw-small-led3"></div>
<div class="ssw-small-led ssw-small-led4"></div>
<div class="ssw-small-led ssw-small-led5"></div>
<div class="ssw-small-led ssw-small-led6"></div>
<div class="ssw-small-led ssw-small-led7"></div>
<div class="ssw-small-led ssw-small-led8"></div>
<div class="ssw-small-led ssw-small-led9"></div>
<div class="ssw-small-led ssw-small-led10"></div>
<div class="ssw-small-led ssw-small-led11"></div>
</div>
</div>
</div>
</div>

Now let's try doing the same thing, 
but using the code you will put on your SpinWheel.
To start with, we are just turning on one LED.

<!-- fast timer -->
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

You can also copy this line and independently control each large LED.
This is similar to how above you could change the color of each LED.
Rather than adjusting sliders, copy the `SpinWheel.setLargeLED` line 
and change the first number. For instance, to light up the very top large LED
in the same color, add `SpinWheel.setLarge(4, 255, 0, 100);`.
This command takes the form, 
`SpinWheel.setLarge(led to light up, amount of red, amount of green, amount of blue)`.
Try adding more LEDs or changing the color yourself on the SpinWheel!

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

### Turning on the Small LEDs

You can also turn on all of the small LEDs.
To do this, instead of using `SpinWheel.setLargeLEDsUniform`, 
you can use the line  
`SpinWheel.setSmallLEDsUniform`.
Like above, the three numbers represent the red, green, and blue 
components of the color you want to make.

<!-- fast timer -->
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(0, 200, 255);
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

<!-- fast timer -->
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

<!-- fast timer -->
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
to try on your own SpinWheel, proceed to the [initial setup guide](/quickstart)
that leads you through installing the computer program necessary to communicate with the SpinWheel.
Then work through the [basic structure of a program](/basics) 
that will get you to the point where you can put the code that you wrote above
onto your own SpinWheel.
