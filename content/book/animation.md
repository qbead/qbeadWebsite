---
title: Intro to Animation
keywords: animations, frames, timing
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
An animation is created by rapidly cycling through a series of still images.
You may be familiar with animations from watching cartoons, 
but we can also create animations with the SpinWheel's LEDs. 
In this lesson, you'll be able to try out doing just that. 
:::

::: warning :
If you haven't already done the [Initial Setup Guide](/quickstart) and the [Basic Structure of a Program lesson](/basics), then we recommend reading them before completing this lesson. They contain important information about downloading the software necessary to program the SpinWheel and other useful information about controlling the LEDs.
:::

To create an animation or a video,
we need a rapid sequence of still images, called frames.
The frames must be displayed rapidly enough that it looks like a smoothly changing pattern to our eyes.
This is true both for the computer screen playing a video
and for the SpinWheel lights changing their patterns.
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

![What if the computer itself created the images? This is called generative art and you'll be learning how to do this yourself in the rest of this adventure. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/generative_art.png)

However, there is another type of art, called *generative art*,
which does not have such taxing requirements.
It obeys different constraints, and it requires a particular mindset,
but its beauty comes from the fact that you tell a computer how to create art on its own,
instead of drawing the art yourself.
The creative element is deep in your imagination,
and it depends on your skill to instruct and teach a computer to do something.
We will explore this type of art here.
We will learn how to command a computer (the SpinWheel) to draw patterns of color that evolve in time.
Along the way we might even learn a bit about how to write programs.

::: warning :

Keep in mind that we will be learning a new language,
a language that lets us instruct a simple computer (the SpinWheel's brain) to do something.
Just like with any other language, at first you will not be able to understand all the words or the <span class="footnote">entire sentence.<span>In this metaphor a sentence is a computer program.</span></span>
As a new programmer, the important thing is to latch on to the words that mean something to you, even if you cannot understand the entire language.
:::

We have prepared many small example programs you can play with, before you start trying to modify them. All of these sketches are included in the SpinWearables library, which you downloaded while completing the [Initial Setup Guide](/quickstart). You should not need to type out any of the examples described here.
Simply attempt to upload them to the device and read through them, even if you are not changing them.


## Timing

Our first goal, before we are able to make something as advanced as the rainbow pattern above,
is to simply make our device blink.
Writing this code will give us the framework upon which to build more sophisticated animations.

<video src="/images/bookpics/simple_blink.mp4" muted autoplay playsinline loop></video>

To make our device blink, we need to tell it how long to be on or off.
This is the timing of our animation.
Thankfully our device has a built-in timer that can measure milliseconds (1 second equals 1000 milliseconds).
One of the first things we will need to do in our generative art program is to ask for the time and save it for future calculations.
The command that we need to write looks like:

```c++
int t = millis();
```

Shortly, we will see how this command can be woven in with others as part of a complete program.
Here, `millis()` is a
<span class="footnote">command that reads the number of milliseconds that have passed since the device was started.<span>This command, together with many other useful commands comes built into the software we are using.
Later, we will even learn how to make commands of our own.</span></span>
These commands are special directions that ask the computer to complete a task.
The rest of the small piece of code depicted above ensures that the number of milliseconds given by `millis()` is stored somewhere: in the variable we have named `t` (you can use more descriptive names if you wish). We also had to specify the type of the variable (`int` as in "integer") because otherwise our SpinWheel will get confused. If we put this line of code in the `loop` block of our code, the value of t will change every time the `loop` is repeated.

<!--FIGURE: An image showing the type and name on the lhs, and the expression on the rhs, stressing the rigidity of this syntax.-->

<figure><video src="/images/bookpics/time_loop.mp4" muted autoplay playsinline loop></video><figcaption> Every time the `loop()` block is run, `millis()` determines the number of milliseconds since `setup()` was run and stores it in the variable `t`. Think of it as if you are checking the time on a stopwatch. You hit 'start' right when the SpinWheel is initialized in `setup()` and then check how much time has passed at the start of each loop by using the `millis()` command.  </figcaption></figure>


The entirety of our animation will depend on the number stored in this `t` variable.
Based on that number, another piece of code can decide when to shine a given color,
when to be illuminating brightly or showing subdued colors,
when to alternate hues from one LED to the other,
and in this particular case, simply when to blink.

What follows is the most crucial concept in the construction of our animations.
If we want our animations to repeat,
we will need to turn this ever-growing counter `t`,
into a number that *wraps around*.
For instance,
if we want our animation to repeat every 2500 milliseconds (2.5 seconds),
then the number on which the animation depends
should itself repeat in the same manner.




The simplest way to do that is to subdivide time into intervals of the same length as our animation
and see how many milliseconds have passed since the start of the current interval.
We can do that by looking at the remainder after dividing time by the length of our repeating unit.
For example, if 5600 milliseconds have passed since the device was powered, then
$$ 5600\div 2500 = 2 \text{ with a remainder of } 600.$$
This means that  two full intervals of 2500 milliseconds have passed and we are 600 milliseconds into the third interval.

![Division of time into intervals of 2500. In this example, 5600 milliseconds have passed, which is 2 full cycles of 2500 milliseconds with a remainder of 600.](/images/Modular_division_timeline.png "Division of time (shown in blue) into intervals of 2500 (shown in orange)")

We can also consider intervals of different lengths,
but for now we will stick to 2.5 seconds. This interval is short enough for us to be able to see the animation we create without waiting an unnecessary amount of time,
and long enough that our eyes can capture how things change.

Lastly, we need to tell the computer that we want it to compute a division with a remainder for us.
Thankfully, we can find in our dictionary of programming languages that the notation `a % b` is <span class="footnote">frequently used<span>Programmers have the bad habit of taking established symbols like the percent sign and using it for unrelated concepts, like it is use here for division with remainder.</span></span> to mean "find the remainder of dividing `a` by `b`".
With all this knowledge, we now know how to measure time in repeating intervals of (for example) 2500 milliseconds. 

```c++
int t_repeating = t % 2500;
```
This command takes the time that we stored in `t` and uses the `%` notation to find the remainder when `t` is divided by 2500. The remainder is stored in a new variable, `t_repeating`.

<figure><video src="/images/bookpics/time_remainder.mp4" muted autoplay playsinline loop></video><figcaption>Using time to create a repeating pattern: the value returned by `millis()` (in blue) is divided into equal intervals. The remainder of that division (in orange) provides a steady repeating sequence of numbers on which we can base a repeating animation.</figcaption></figure>

### A picture that depends on time

Finally, we have all that we need to create our first animation. We will use the timing variable we have created, `t_repeating`, and based on its value we will calculate a brightness value `b`.
We will use this brightness variable to set all of the large LEDs (and each of their red, green, and blue colors) to the same time-dependent value. The maximal permitted brightness value of our software is `255`. Because `t_repeating` can have any value between 0 and 2500, we have to divide `t_repeating` by 10 to keep `b` from going beyond `255`.

The <span class="footnote"> important part of the necessary code<span>We skip the setup code for the sake of space</span></span> is shown in the SpinWheel simulator below.<span class="footnote"> Try to explain in the words of your own language what every single line of the computer programming language says.<span>You will frequently hear programmers talk about the "story" that their code tells. Being able to retell the instructions of a piece of computer code in the form of a human-language story is a sure sign you are starting to understand a piece of code.</span></span>
As a hint, we will mention that `setLargeLEDsUniform` is used to set all large LEDs to the same uniform color (specified by three numbers, corresponding to the red, green, and blue components of the color).

Now let's put all of this together and see what happens by clicking run on the virtual SpinWheel.

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

At this point, you might be wondering whether you can <span class="footnote"> modify the color <span>Try modifying other lines above to see what happens as well! </span></span> of the LEDs in the above sketch. By changing the line `SpinWheel.setLargeLEDsUniform(b, b, b)`, you can do just that! For instance, to make the LEDs teal instead of white, change that line to be `SpinWheel.setLargeLEDsUniform(0, b, b)`. What about making the LEDs light up yellow? To experiment more quickly, first try this in the virtual SpinWheel above. Then, when you have some modifications that you are interested in trying out on your SpinWheel, you can make the same changes in the example sketch in the Arduino software. 

::: further-reading
Feeling stumped on how to make a different color? In our [Biology of Sight](/sight) adventure you will have the opportunity to try mixing colors with red, green, and blue light. The [Color Theory](/colortheory) lesson provides more information about why we can use red, green, and blue LEDs to represent all the colors of the rainbow.
:::

Now let us upload this code to the SpinWheel device itself. Make sure that the SpinWheel's switch is on `USB` and then connect your device with a micro USB cable to your computer.
To run this code on your SpinWheel, navigate to `Examples → SpinWearables → Animations_and_Patterns → Simple_Blink` in the Arduino software and open the file and upload it to your SpinWheel. If you simply copy the above code, it will not run because it is missing the important setup information. The file in `Examples` contains the entirety of the necessary code.

::: further-reading
If you want a reminder about why the above code will not work if you run it on your SpinWheel, check out the [Basic Structure of a Program lesson](/basics). 
:::

So far in this lesson, we have discussed certain building blocks of the above code (like `millis()`), 
but we have yet to dive into what every line means. 
When you uploaded the code onto your SpinWheel, 
you may have noticed that the sketch had many more comments 
than the code for the virtual SpinWheel. 
These comments provide more in-depth explanations of the code. 
We have also provided a [webpage with a detailed explanation of the sketch](/codedoc/examples/Animations_and_Patterns/Simple_Blink) where you can read more.

![Check out our lesson on the building blocks of coding to learn more about the essential pieces of writing a sketch. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/creating_own_functions.png)

By learning to control the SpinWheel's LEDs, you are already learning some basic coding concepts. To expand on this, we have also put together a reference guide that introduces [some of the most important building blocks in programming](/progpatterns). We recommend checking this out now and also referring back to it as you move onto the more advanced adventures.   

If you are excited about making more complicated animations on your SpinWheel, 
then we invite you to dive into the [Animations and Patterns adventure](/animation2) next. 
We will modify this sketch and introduce how to make the color (rather than simply the brightness) change with time. 
If you are already accustomed to programming and want to simply see the list of available commands,
[check out our function documentation](/allcommands) and let your inmagination run wild.

