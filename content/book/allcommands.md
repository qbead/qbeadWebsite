---
title: SpinWheel Functionss Appendix
keywords: SpinWheel, arduino, setup
toc: yes
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
This document lists some of the most important functions available with the SpinWheel code library.
With these functions you can detect motion and set the LEDs to different color patterns.
If you have never programmed with Arduino before, be sure to read our [quick start guide](/quickstart)
and [SpinWheel basic programming page](/basics).
To learn more about the building blocks of coding, check out the [programming patterns page](/progpatterns). 
For more details you can consult the [annotated source code](/codedoc/SpinWearables.h.html),
listing everything available in the library. This will serve as a reference as you code the SpinWheel in whatever designs you imagine.
:::

You can use the virtual SpinWheel simulator to test each of these functions.
If a function involves the motion sensor,
you can grab the virtual device with your mouse and shake it,
simulating how the physical sensor would respond to real motion.

## LED Manipulation

There are a number of functions that let you manipulate the state of the LEDs,
however, for the LEDs to actually respond to these manipulations,
you also need to call `SpinWheel.drawFrame()` when you are done.
That way you can make multiple modifications, preparing the final image,
without the intermediate unfinished images showing up.

If you want to reset the image, you can call `SpinWheel.clearAllLEDs()`,
which will set all LEDs to be dark,
deleting any color information that they were previously set to.

### Turn on all the Large LEDs with `setLargeLEDsUniform`

`setLargeLEDsUniform` takes three arguments, the red, green, and blue components of the desired color.
Their range is between 0 and 255 (one byte).

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(255, 0, 155);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Turn on all the Small LEDs with `setSmallLEDsUniform`

`setSmallLEDsUniform`, same as `setLargeLEDsUniform`, takes three arguments, the red, green, and blue components of the desired color.
Their range is between 0 and 255 (one byte).

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(255, 255, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Control a Specific Large LED with `setLargeLED`

The first argument of `setLargeLED` is a number between 0 and 7, denoting which of the 8 LEDs is to be turned on. The other three arguments are the red, green, and blue components of the color.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setLargeLED(4, 255, 155, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Control a Specific Small LED with `setSmallLED`

The first argument of `setSmallLED` is a number between 0 and 11, denoting which of the 12 LEDs is to be turned on. The other three arguments are the red, green, and blue components of the color.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setSmallLED(4, 155, 255, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Turn on a range of Large LEDs with `setLargeLEDs`

The first and second arguments of `setLargeLEDs` are numbers between 0 and 7, denoting what range of the 8 LEDs is to be turned on. The other three arguments are the red, green, and blue components of the color.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setLargeLEDs(0, 3, 255, 0, 255);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Turn on a range of Small LEDs with `setSmallLEDs`

The first and second arguments of `setSmallLEDs` are numbers between 0 and 11, denoting what range of the 12 LEDs is to be turned on. The other three arguments are the red, green, and blue components of the color.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setSmallLEDs(2, 7, 255, 255, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

### Set overall brightness with `setBrightness`

This function takes only one argument, between 0 and 255, that sets the brightness of the LEDs.
At maximal settings the large LEDs are blindingly bright and pull a total current of 480 mAh,
which would deplete our battery in less than 10 minutes.
Using the maximal setting would cause the battery to wear out much quicker and would cause significant heating.

## Advanced LED Manipulation

<!--TODO: expand this section and implement as necessary-->

There are some undocumented and unfinished functions, among them: `setSmallLEDsPointer` and `setSmallLEDsProgress` and the unfinished `setSmallLEDsRainbow` and `setLargeLEDsRainbow`.

## Color and Brightness Helpers

<!--TODO: expand this section and implement as necessary-->

The `colorWheel` function turns a single number representing an angle into a color from the color wheel.

The `triangularWave` and `parabolaWave` functions provide for convenient periodic patterns, useful in animations.

The `faston_slowoff` function can be used to pleasantly filter time-dependent measurements. For instance, it can be used to rapidly brighten an LED when a motion is detected and then slowly let the light decay after the motion stops.

## Motion Sensing and Compass

<!--TODO: expand this section and implement as necessary-->

To request measurements from the sensor you need to call `SpinWearables.readIMU`. Then the measurement data will be available in `ax,ay,az,gx,gy,gz,mx,my,mz` in some units. There is also a temperature sensor.
