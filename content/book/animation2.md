---
title: Animations and patterns
keywords: animations, frames, timing
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
This adventure builds on what you learned in the Intro to Animation adventure,
empowering you to make some more sophisticated patterns. 
:::


To create an animation or a video,
we need a rapid sequence of still images, called frames.
The frames must be displayed rapidly enough that it looks like a smoothly changing pattern to our eyes.
This is true both for the computer screen playing a video
and for the SpinWheel lights changing their patterns.
For example, this is a short repeating animation that you learned how to make in the [Intro to Animation](/animation) adventure.

<video src="/images/bookpics/simple_blink.mp4" muted autoplay playsinline loop></video>

::: warning :
If you haven't already done the [Intro to Animation](/animation) adventure, we recommend looking it over before starting this lesson. 
:::

There is a whole universe of patterns you can create with the SpinWheel:
simply grab a piece of paper,
draw the pattern you desire,
and translate it into an expression of code and math that implements it.
However, that much freedom can be daunting at first.
Here we will start by modifying the animation that you created in the [intro adventure on animation](/animation).
Then we will present some additional sketches that allow you to create animations with changing colors and where you can control each LED separately.
We invite you upload these sketches from `Examples → SpinWearables → Animations_and_Patterns` to see what they do on your SpinWheel and then experiment with modifying them.


### Smoother pulsing

You may have noticed that the brightness of the LEDs in the [sketch we present in the intro to animation](/codedoc/examples/Animations_and_Patterns/Simple_Blink) was abruptly cut off.
Wouldn't it be prettier if we gently turned off the LEDs, similarly to how gently we are ramping them up?
We can implement this by writing a function that first goes up and then slowly goes back down.
We have already written such a function for you to use
and called it [`triangularWave`](/codedoc/SpinWearables.h.html#triangular-wave),
because when you plot it, it looks like a series of triangles.

<figure><video src="/images/bookpics/triangular_wave.mp4" muted autoplay playsinline loop></video><figcaption>Instead of the pattern of brightness that abruptly dropped to zero that we saw previously, we can employ a pattern that also decreases steadily, making for a more pleasant pulsing light.</figcaption></figure>

Below you can see a small modification of our previous example that employs such triangular waves.
In order to also show some color, instead of purely white LEDs,
we will [mix only red and blue, and leave the green set to zero](/colortheory).
[You can peruse the entirety of the code online](/codedoc/examples/Animations_and_Patterns/Smoother_Blink),
or access it directly from the Arduino software from 
`Examples → SpinWearables → Animations_and_Patterns → Smoother_Blink`.

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

::: further-reading
If you want to learn more about controlling the SpinWheel's LEDs, then try out our [Biology of Sight](/sight) Adventure. The [color theory](/colortheory) lesson provides more information about why we can use red, green, and blue LEDs to represent all the colors of the rainbow.
:::

### The color wheel

Up until now we have discussed how to turn a time-dependent number into a brightness.
However, instead of having time-dependent intensity of light,
we might be more interested in a time-dependent hue.
One particularly lovely way to achieve this is to use a color wheel,
where we assign a color to each point of a circle,
and use it as a reference when turning numbers into colors.
We provide you with a function, `colorWheel()`, that converts the numbers between 0 and 255
to a color as seen in the image below. For each input number, the appropriate red,
blue and green components of a color from the colorWheel are calculated
and used to color our LED lights.

![The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number. The red, blue and green components of the colors in the color wheel are shown in the plot on the right.](/images/bookpics/colorwheel.png "The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number.")

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

In this case, rather than independently controlling the red, green, and blue components of each LED, you are providing one number that represents the color. In the color wheel diagram above, you can see on the right the relative amounts of red, green, and blue light that go into each color on the left. As usual, [the entirety of the code is documented on its own page](/codedoc/examples/Animations_and_Patterns/Color_Wheel), and in the Arduino examples menu under `Animations_and_Patterns → Color_Wheel`


### Non-uniform patterns and accessing separate LEDs

Lastly, we would like to have a pattern that illuminates different LEDs differently.
To set the color of all of the larger LEDs to a single uniform color,
we have already seen that we need to use `SpinWheel.setLargeLEDsUniform(r,g,b)`,
where `r`, `g`, and `b` are the red, green, and blue components of the color we desire.
They need to be between 0 (turned off) and 255 (maximum intensity).
To do the same to the smaller LEDs, we can use `SpinWheel.setSmallLEDsUniform(r,g,b)`.


If we want to illuminate a single large LED (numbered from 0 to 7),
we can use `SpinWheel.setLargeLED(i,r,g,b)`,
where the first argument `i` is the number of the LED we want to change.
Similarly, we use `SpinWheel.setSmallLED(i,r,g,b)` to do the same for the smaller LEDs.

::: further-reading
For a refresher on how to control individual LEDs and a reminder of the number that corresponds to each LED, you can refer back to our [basic structure of a program guide](/basics).
:::

By accessing individual LEDs, we can create an interesting time-dependent pattern
where different LEDs show different colors and intensities.
Consider this case, in which only two of the LEDs (number 0 and number 2) are enabled,
but with different patterns.

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

In this code, the lights are given opposite intensities and set to different colors. The code above can be opened from the examples folder, under the name `Railroad_Signal` or [viewed online](/codedoc/examples/Animations_and_Patterns/Railroad_Signal).

Another cool pattern can be created with a particularly useful trick that adds a "delay" between the time-dependent numbers controlling the color of each LED.
This creates the illusion that the LEDs are following each other. 

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

This code is [in the `Rainbow_Chase` example](/codedoc/examples/Animations_and_Patterns/Rainbow_Chase).

You now have the tools you need to control each LED of the SpinWheel
and create a time dependent color or brightness. 
Use these sketches and the building blocks introduced in them to create new and exciting patterns on your SpinWheel! 
We have created a [reference](/allcommands) with the various commands (like `setLargeLED()` and `setSmallLEDsUniform()`), that we introduced above, as well as some new ones for programming the SpinWheel in even more ways. 
As you try out the other adventures and begin to program the SpinWheel for yourself, 
we hope that you will find these functions useful. 
These functions also have virtual SpinWheels embedded in the page to allow you to experiment with the code and see how they work more easily!

::: further-reading
If you are interested in learning more about mixing of colors with LEDs and how the human eye works, then check out our [adventure on the biology of the human eye](/sight).
You can also delve deeper into [the tools that this programming language provides](/progpatterns),
which could enable you to write more sophisticated programs and patterns.
:::

Overwhelmed by the possibilities of how you can modify the above sketches? Here are some suggestions: 
<ul>
<li> Try to add more LEDs to your patterns. </li>
<li> Try to have some of them (e.g. the small ones) have varying brightness, 
while others (e.g. the large ones) have changing colors. </li>
<li> Mix and match code from the previous examples. </li>
</ul>
Let your creativity sing through the code!



::: further-reading
You might have noticed that many of the functions and commands we have used are set to repeat themselves when their input passes through 255. There is a reason for this. There are 256 numbers from 0 to 255. And 256 is exactly how many different values can be stored in one byte. One byte is how much space is dedicated to many typical variables in the language used by the Arduino software, hence, many of its functions are written to expect numerical values on that scale.
:::
