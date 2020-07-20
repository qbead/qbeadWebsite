---
title: Animations and patterns
keywords: animations, frames, timing
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>


To create an animation or a video,
we need a rapid sequence of still images, called frames.
The frames must be displayed rapidly enough that it looks like a smoothly changing pattern to our eyes.
This is true both for the computer screen playing a video
and for the SpinWheel lights, changing their light patterns.
For example, this is a short repeating animation of a rainbow pattern playing on the LEDs.

<video src="/images/behindthescenes/pretty_device.mp4" muted autoplay playsinline loop></video>

There are two ways such a pattern can be animated on a given device or screen.
The first approach is to just draw every single frame by hand,
save that large collection of images,
and display them one by one in a rapid succession.
Frequently, this is the only possible way.
For instance, in an animated movie,
the majority of the frames are drawn by an artist,
even if they use modern computer graphics technologies to automate some of their work.
This method requires a lot of manual work,
and a lot of computer memory to store the artwork.

However, there is another type of art, called *generative art*,
which does not have such taxing requirements.
It obeys different constraints, and it requires a particular mindset,
but its beauty comes from the fact that you tell a computer how to create art on its own,
instead of drawing the art yourself.
The creative element moves from your hands and eyes, to deeper into your imagination,
and it depends on your skill to instruct and teach a computer to do something.
We will explore this type of art here.
We will learn how to command a computer (the SpinWheel) to draw patterns of color that evolve in time.
Along the way we might even learn a bit about how to write programs.

::: warning :
If you haven't already done the [quickstart guide](/quickstart), then we recommend reading it before finishing the rest of the lesson. It contains important information about downloading the software necessary to program the SpinWheel and other useful information.
:::


## Timing

Our first goal, before we are able to make something as advanced as the rainbow pattern above,
is to simply make our device blink.

<video src="/images/bookpics/simple_blink.mp4" muted autoplay playsinline loop></video>

To make our device blink, we need to tell it how long to be on or off.
This is the timing of our animation.
Thankfully our device has a built-in timer that can measure milliseconds (thousands of a second).
One of the first things we will need to do in our generative art program,
would be to ask for the time and save it for future calculations.
The necessary command that we need to write looks like

```c++
int t = millis();
```

Here, `millis()` is a <span class="footnote"> command that reads the number of milliseconds since the device has started. 
<span>.
This command, together with many other useful commands comes built into the software we are using.
We will later even learn how to make commands of our own.
</span></span>
Commands are special directions that ask the computer to complete a task.
The rest of the small piece code depicted above ensures that the number of milliseconds given by `millis()` is stored somewhere: in the variable we have named `t` (you can use more descriptive names if you wish). We also had to specify the type of the variable (`int` as in "integer") because otherwise our computer will get confused.

<!--FIGURE: An image showing the type and name on the lhs, and the expression on the rhs, stressing the rigidity of this syntax.-->

The entirety of our animation will depend on the number stored in this `time` variable.
Based on that number, another piece of code can decide when to shine a given color,
when to be illuminating brightly or showing subdued colors,
when to alternate hues from one LED to the other,
and in this particular case, simply when to blink.

### Repeating patterns and division with remainder

What follows is the most crucial concepts in the construction of our animations.
If we want our animations to repeat,
we will need to turn this ever-growing counter `time`,
into a number that *wraps around*.
For instance,
if we want our animation to repeat every 2500 milliseconds (2.5 seconds),
then the number on which the animation depends,
should itself repeat in the same manner.

*Add animation or figure showing time being divided into intervals*
<!--FIGURE: Figure or Animation showing subdividing time into equal intervals. -->


The simplest way to do that is to subdivide the number of milliseconds into equal intervals,
and see how many milliseconds have passed since the start of the current interval.
We can do that by dividing the number of seconds and looking at the remainder. For example, if 5600 milliseconds have passed since the deviced was powered, then two full intervals of 2500 milliseconds have passed and we are 600 milliseconds into the third interval:

$$5600 = 2\times2500 + 600.$$
*Show in an image*

We can also consider different length intervals, but for now we will stick to 2.5 seconds as it is short enough for us to be able to see the animation we create without waiting too much, and long enough that our eyes can capture how things change during this interval.

Lastly, we need to find how to tell the computer that we want it to compute a division with reminder for us. Thankfully, we can find in our dictionary of programming languages that the notation `a % b` is <span class="footnote">frequently used<span>Programmers have the bad habbit of taking established symbols like the percentage sign and using it for unrelated concepts, like its use here for division with remainder.</span></span> to mean "find the reminder of dividing `a` by `b`". With all this knowledge, we now know how to store a new variable `t_repeat` which measures time in repeating intervals of (for example) 2500 milliseconds.

```c++
int t_repeat = t % 2500;
```

<video src="/images/bookpics/time_remainder.mp4" muted autoplay playsinline loop></video>

<!--TODO: More explanations about what this division with remainder is-->

### A picture that depends on time

Finally, we have all that we need to create our first animation. We will use the timing variable we have created `t_repeat`, and based on its value we will calculate a brightness value `b`. We will use this brightness variable to set all of the large LEDs (and each of their red, green, and blue colors) to the same time-dependent value. We had to divide `t_repeat`, because otherwise `b` will go beyond `255`, which is the maximal permitted brightness value for our software. You can see the full code in the simulator below, or you can find it in the Arduino software by navigating to `Examples → Animations_and_Patterns → Simple_Blink`. We also have a [webpage with detailed explanation of the code](/codedoc/examples/Animations_and_Patterns/Simple_Blink/Simple_Blink.ino.html) if you prefer to copy it from there. 

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeat = t % 2500;
  int b = t_repeat / 10;
  SpinWheel.setLargeLEDsUniform(b, b, b);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

By learning to control the SpinWheel's LEDs, you are learning some basic coding concepts. To expand on this, we have also put together a refernce guide that introduces [some of the most important patterns for learning programming](/progpatterns).   

## More sophisticated patterns

There is a whole universe of patterns to explore:
simply pick a piece of paper,
draw the pattern you desire,
and translate it to an expression of code and math that implements it.
However, that much freedom can be paralysing at first.
Here we will see two more functions that can give us ideas upon which to build.

First, notice that the brightness of the LEDs in our previous examples was abruptly cut off.
Would it not be prettier if we gently turn off the LEDs, similarly to how gently we are ramping them up?
We can perform this by writing a function that first goes up and then slowly turns back down.
We have already written such a function for you to use
and called it [`triangularWave`](/codedoc/SpinWearables.h.html#triangular-wave),
because when you plot it, it looks like a series of triangles.
Below you can see and a small modification of our previous example that employs such triangular waves.
In order to also show some color, instead of purely white LEDs,
we will [mix only red and blue, and leave the green set to zero](/colortheory).

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeat = t % 2500;
  int b = triangularWave(t_repeat / 10);
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

Up to now we have discussed how to turn a time-dependent number into a brightness.
However, instead of having time-dependent intensity of light,
we might be more interested in a time-dependent hue.
One particularly lovely way to achieve this is to use a color wheel,
where we assign a color to each point of a circle,
and use it as a reference when turning numbers into colors.

![The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number.](/images/bookpics/colorwheel.png "The color wheel lets you generate a color based on a single continuously changing (maybe time-dependent) number.")

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeat = t % 2500;
  int s = t_repeat/10;
  SpinWheel.setLargeLEDsUniform(colorWheel(s));
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>


### Non-uniform patterns and accessing separate LEDs

Lastly, we would like to have a pattern that illuminates different LEDs differently.
To set the color of all of the larger LEDs to a single uniform color,
we have already seen that we need to use `SpinWheel.setLargeLEDsUniform(r,g,b)`,
where `r`, `g`, and `b` are the red, green, and blue components of the color we desire.
They need to be between 0 (turned off) and 255 (maximum intensity).
To do the same to the smaller LEDs, we can use `SpinWheel.setSmallLEDsUniform(r,g,b)`.
To illuminate a single large LEDs (enumerate from 0 to 7),
we can use `SpinWheel.setLargeLED(i,r,g,b)`,
where the first argument `i` is the number of the LED we want to change.
Similarly, we use `SpinWheel.setSmallLED(i,r,g,b)` to do the same for the smaller LEDs.

Now we will introduce the last conceptual tool we will need.
To create an interesting time-dependent pattern
where different LEDs show different colors and intensities,
we simply need to control each of them separately.
Consider this case, in which only two of the LEDs (number 0 and number 2) are enabled,
but with different patterns.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int t_repeat = t % 2500;
  int w = triangularWave(t_repeat/10);
  int w_oposite = 255 - w;
  SpinWheel.setLargeLED(0, w, 0, 0);
  SpinWheel.setLargeLED(2, 0, w_oposite, 0);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

A particularly useful trick is to add "delay" between the time-dependent numbers controlling the color of each LED.
This creates the illusion that the LEDs are following each other.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  int t = millis();
  int delay = 200; // Change this number! What happens?
  int t0 = (t % 2500) / 10;
  int t1 = ((t+delay) % 2500) / 10;
  int t2 = ((t+2*delay) % 2500) / 10;
  int t3 = ((t+3*delay) % 2500) / 10;
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

With these tools mastered,
you might want to peruse the [list of available functions](/basics),
or learn more about [mixing of colors](/sight).
You can also delve deeper in [the tools that this programming language provides](/progpatterns),
which could enable you to write more sophisticated programs and patterns.

