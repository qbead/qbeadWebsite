---
title: Animating with Code
keywords: color, animation, programming
---

Based on the [Intro to Animation](/animation) and [Animations and Patterns](/animation2) pages.

# Intro to Animation

How to use code to light up the display and make properly timed animation frames.

---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

<video src="/images/behindthescenes/pretty_device.mp4" muted autoplay playsinline loop></video>

---

![We will create "generative" art. Instead of having pre-drawn animation frames, we will let the computer generate them from scratch. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/generative_art.png)

---

## Timing

<video src="/images/bookpics/simple_blink.mp4" muted autoplay playsinline loop></video>

How does the computer keep time so that it knows when to change a frame?

---

## Timing

```c++
int t = millis();
```

`millis()` gives the number of milliseconds since the device was turned on. 

---

<figure><video src="/images/bookpics/time_loop.mp4" muted playsinline loop></video><figcaption> Every time the `loop()` block is run, `millis()` determines the number of milliseconds since `setup()` was run and stores it in the variable `t`.</figcaption></figure>

---

![Division of time into intervals of 2500. In this example, 5600 milliseconds have passed, which is 2 full cycles of 2500 milliseconds with a remainder of 600.](/images/Modular_division_timeline.png "Division of time (shown in blue) into intervals of 2500 (shown in orange)")

```c++
int t_repeating = t % 2500;
```

---

```c++
int t_repeating = t % 2500;
```

<figure><video src="/images/bookpics/time_remainder.mp4" muted autoplay playsinline loop></video><figcaption>Using time to create a repeating pattern: the value returned by `millis()` (in blue) is divided into equal intervals. The remainder of that division (in orange) provides a steady repeating sequence of numbers on which we can base a repeating animation.</figcaption></figure>

---

## A picture that depends on time

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  int t = millis();
  int t_repeating = t % 2500;
  int b = t_repeating / 10;
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(b, b, b);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

---

![Check out our lesson on the building blocks of coding to learn more about the essential pieces of writing a sketch. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/creating_own_functions.png)


# Animations and Patterns

Common tools for more pleasant animations

---

## Smoother pulsing

<figure><video src="/images/bookpics/triangular_wave.mp4" muted autoplay playsinline loop></video><figcaption>Instead of the pattern of brightness that abruptly dropped to zero that we saw previously, we can employ a pattern that also decreases steadily, making for a more pleasant pulsing light.</figcaption></figure>

---

[`Examples → SpinWearables → Animations_and_Patterns → Smoother_Blink`](/codedoc/examples/Animations_and_Patterns/Smoother_Blink)

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeating = t % 2500;
  int b = triangularWave(t_repeating / 10);
  // The next function takes three arguments:
  // The red, green, and blue components of the color we desire.
  // We are mixing only red and blue, setting green to zero.
  SpinWheel.setLargeLEDsUniform(b, 0, b);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

---

## The color wheel

![The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number. The red, blue and green components of the colors in the color wheel are shown in the plot on the right.](/images/bookpics/colorwheel.png "The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number.")

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeating = t % 2500;
  int s = t_repeating/10;
  SpinWheel.setLargeLEDsUniform(colorWheel(s));
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

[`Animations_and_Patterns → Color_Wheel`](/codedoc/examples/Animations_and_Patterns/Color_Wheel)

---

## Non-uniform patterns and accessing separate LEDs

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeating = t % 2500;
  int w = triangularWave(t_repeating/10);
  // The next line sets the intensity of the 2nd LED 
  // to be opposite of the value in w
  int w_opposite = 255 - w;
  SpinWheel.setLargeLED(0, w, 0, 0);
  SpinWheel.setLargeLED(2, 0, w_opposite, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

[`Railroad_Signal`](/codedoc/examples/Animations_and_Patterns/Railroad_Signal)

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_delay = 200; // Change this number! What happens?
  int t0 = (t % 2500) / 10;
  int t1 = ((t+t_delay) % 2500) / 10;
  int t2 = ((t+2*t_delay) % 2500) / 10;
  int t3 = ((t+3*t_delay) % 2500) / 10;
  SpinWheel.setLargeLED(0, colorWheel(t0));
  SpinWheel.setLargeLED(1, colorWheel(t1));
  SpinWheel.setLargeLED(2, colorWheel(t2));
  SpinWheel.setLargeLED(3, colorWheel(t3));
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

[`Rainbow_Chase`](/codedoc/examples/Animations_and_Patterns/Rainbow_Chase)

---

Overwhelmed by the possibilities of how you can modify the above sketches? Here are some suggestions: 
<ul>
<li> Try to add more LEDs to your patterns. </li>
<li> Try to have some of them (e.g. the small ones) have varying brightness, 
while others (e.g. the large ones) have changing colors. </li>
<li> Mix and match code from the previous examples. </li>
</ul>
Let your creativity sing through the code!

