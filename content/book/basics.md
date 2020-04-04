---
title: Basic SpinWheel Commands
keywords: SpinWheel, arduino, setup
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
This adventure is an introduction to programming the SpinWheel that will teach you what you need to know to begin customizing the LED lattice however you imagine.
:::

If you have never programmed with Arduino before, be sure to read our [quick start guide](/quickstart) and if necessary some of the [Computer Science 101 sections](/progpatterns). 


## Turn on all the Large LEDs
In this section, we will teach you how to control all of the large LEDs together.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(255, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Turn on all the Small LEDs
In this section, we will teach you how to control all of the small LEDs together.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(255, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Control a Specific Large LED
Learn how to turn on just one large LED at a time.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setLargeLED(4, 255, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Control a Specific Small LED
Learn how to turn on just one small LED at a time.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setSmallLED(4, 255, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Customize Each LED!
We'll walk you through a more complicated example using what we learned above. Using this knowledge you can control the interface.

```cpp
something more complicated!
```

Later lessons will explore how to have the LED display change in response to the device's motion! For instance, you can even [turn the SpinWheel into a step counter](/stepcounter)

