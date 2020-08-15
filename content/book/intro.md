---
title: Getting Started
keywords: SpinWheel, getting started, experimenting
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
Before you dive into programming the SpinWheel, 
first give this adventure a try to learn more about what the SpinWheel is capable of.
We'll start with some simple animations
and end with some code that in later adventures you'll add to the SpinWheel itself.
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
You can have the LEDs make repeating patterns.
You can have the LEDs respond to the motion of the device.
You can light up all the LEDs in one color. 
As you go through the adventures and lessons in our [field guide](/book), 
you will learn how we did this and become comfortable to customize it further.

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

One of the simplest things to do with the SpinWheel 
is to turn on all of the large LEDs.
Using the sliders below you can try changing the colors
on the virtual SpinWheel below:

<!-- is there some way that we can hide the code and just have sliders for the colors?-->

::: further-reading
To learn why we are mixing colors using red, green, and blue,  
check out our [Biology of Sight] adventure.
On this page, you can try this out this on your own SpinWheel, 
as well as learn more about how our eyes work.
::: 

On your SpinWheel, rather than using sliders to change the color, 
you will instead use building blocks of code.
On the virtual SpinWheel below, you can see how the code that you
would run on your physical SpinWheel would change the LED display.
For now, focus only on the line `SpinWheel.setLargeLEDsUniform`.
It has three parameters that you can change using the numbers you tried 
with the sliders above. The first `50` represents the amount of red, 
the next `255` represents the amount of green, 
and the final `250` gives the amount of blue.
Try changing these numbers for yourself and see what happens.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
}
void loop() {
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
:::

It is also possible to specifically turn on just one large LED.

<!-- is there some way that we can hide the code and just have sliders for each LED where they can cahnge the colors?-->

Now lets try doing the same thing, 
but using the code you will put on your SpinWheel.
To start with, we are just turning on one LED.
However, you can copy this line and independently control each LED.
Try this for yourself below!

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
}
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 255, 255);
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
Like above the three numbers represent the red, green, and blue 
components of the color you want to make.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
}
void loop() {
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
Experiment with adding more lines to turn on more of the small LEDs.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
}
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLED(3, 255, 255, 255);
  SpinWheel.setSmallLED(8, 255, 255, 255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>


### Putting this together 

It is also possible to turn on both the large and small LEDs together:

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
}
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDs(255, 250, 0);
  SpinWheel.setSmallLED(1, 255, 0, 0);
  SpinWheel.setSmallLED(5, 255, 0, 0);
  SpinWheel.setSmallLED(7, 255, 0, 0);
  SpinWheel.setSmallLED(10, 255, 0, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

Experiment with this SpinWheel using the commands 
that were presented above to make new patterns.
Once you have some patterns that you are excited 
to try on your own SpinWheel, then proceed to the [initial setup guide](/quickstart)
that leads you through installing the computer program necessary to use the SpinWheel
and the [basic structure of a program](/basics) 
that will get you to the point where you can put your own program on the SpinWheel.

