---
title: Animations and patterns
keywords: animations, frames, timing
---

To create an animation or a video,
we need a rapid sequence of still images,
rapid enough that it looks like a smoothly changing pattern to our yes.
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
It does obey different constraints, and it requires a particular mindset,
but its beauty comes from the fact that you tell a computer how to create art on its own,
instead drawing the art yourself.
The creative element moves from your hands and eyes, to deeper into your imagination,
and it depends on your skill to instruct and teach a computer to do something.
We will explore this type of art here.
We will learn how to command a computer (the SpinWheel) to draw patterns of color that evolve in time.
Along the way we might even learn a bit about how to write programs by accident.

<!--TODO: some warning that you need to have done the quick start and have the Arduino software.-->

## Timing

Our first goal, before we are able to make something as advanced as the rainbow pattern above,
would be to simply make our device blink.

<!--VIDEO: Blinking animation.-->`blinking animation video goes here`

The first thing we need to consider is how we time the frames of our animation.
Thankfully our device has a built-in timer that can measure milliseconds (thousands of a second).
One of the first things we will need to do in our generative art program,
would be to ask for the time and save it for future calculations.
The necessary command that we need to write looks like

```c++
int time = millis();
```

Here, `millis()` is the <span class="footnote">command that reads the number of milliseconds since the device has started.
<span>
This command, together with many other useful commands comes built into the software we are using.
We will later even learn how to make commands of our own.
</span></span>
The rest of the small piece code depicted above ensures that the...
<!--TODO: Talk about variables-->
<!--FIGURE: An image showing the type and name on the lhs, and the expression on the rhs, stressing the rigidity of this syntax.-->
`talk about variables and have a figure about them`

The entirety of our animation will depend on the number stored in this `time` variable.
Based on that number, another piece of code will decide when to shine red or green,
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

The simplest way to do that is to subdivide the number of milliseconds into equal intervals,
and see how many milliseconds have passed since the start of the current interval.

```c++
int time_repeating = time % 2500;
```

<!--VIDEO: Video that shows the difference between time and time_repeating--> `add a video`
<!--TODO: More explanations about what this division with remainder is-->

### A picture that depends on time

Finally, we have all that we need.

```c++
int time = millis();
int time_repeating = time % 2500;
int brightness = time_repeating / 10;
SpinWheel.setSmallLEDsUniform(brightness, brightness, brightness);
```

<!--TODO: Finish the code, add a simulator-->`finish the code and add a simulator`


## More complicated patterns

Here are some built-in tools to consider:

<!--TODO: Write the code for all these examples-->

- Rainbow color based on a number
- Different brightness patterns based on a number (triangular wave, parabolic wave)

### Non-uniform patterns

There are a few built-in functions for non-uniform patterns. Explain them here.

### Accessing separate LEDs

Kinda like the thing used in the step counter

Changing the color ever so slightly between neighboring LEDs. Do it by hand and then do it with a loop. Add a warning that this is very advanced stuff.


<!--TODO: further reading-->
`links to dancing companion if we want to see how to incorporate not only time, but also sensor readings in our generative art`
