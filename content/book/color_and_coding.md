---
title: Colors and Coding
keywords: sight, vision, color, biology, optical illusions
header-image: /images/banners/colors_and_eye.png
---

::: intro-box
Color mixing works differently if we are working with paint or LEDs. This short activity will give you a chance to see just how, as well as learn more about how your eye works! The first part will explore the phenomenon of "persistence of vision." Then we'll talk more about how our eyes perceive color. Finally, using a simulator you can run directly in your internet browser, you will be able to experiment with the code necessary for controlling the color of virtual LEDs. 

:::

## Persistence of Vision

Our eyes retain a visual impression for about 1/30th of a second. This seems pretty fast, but this retention of an image, or persistence of vision, affects how we perceive the world around us. It is how movies are able to be created from a series of still images. When you go to a movie theater, each image lasts 1/24 of a second, which is much faster than the refresh rate of our eyes. For this reason, we perceive a movie as smooth motion. This is also how flip books work! Even newer tv screens and computer monitors take advantage of this fact.

![With a slow shutter speed, we can capture an image that demonstrates the idea of persistence of vision.](/images/bookpics/fast_pov_streak.jpg "Picture of a fast-moving SpinWheel taken with a slow shutter speed.")

We're now going to do an activity where you will get to experience persistence of vision for yourself!

### Materials
You will need the following materials:
<ul>
<li> scissors </li>
<li> cardboard tube (mailing tube, paper towel tube, a couple toilet paper tubes) </li>
<li> Tape </li>
<li> Rubber band </li>
<li> Paper (dark colored or a marker to color it) </li>
<li> Ruler </li>
</ul>

![Image of the supplies needed for the experiment.](/images/bookpics/colors_supplies.jpg "Supplies necessary for the activity")

### Construction
Here are the steps to make the tube:
<ol>
<li> If you are using toilet paper rolls, tape two together. </li>
<li> Take the piece of paper and cut it into a roughly 4" square. </li>
<li> Fold the piece of paper in half length-wise and cut a 1" slit in the middle. </li>
<li> Using the rubber band, attach the piece of paper to one end of the tube. </li>
<li> You can now look through the end of the tube that you left open. </li>
</ol>

### Experiment
#### If you hold the tube still and look through it, what do you see?

#### How does what you are looking at change if you move your head quickly from right to left?

In the first, you should see a narrow image of the world. However, if you move your head quickly enough, you should begin to see an image of the world appear.

This is because as you are moving your head quickly, your eye and brain are retaining the visual impression of where the slit just was. If you move the tube fast enough, this allows you to see a wider image than if the tube is stationary!

#### How does the quality of the image change based on how much you move your head? 

#### Do you want to move your head in a large or a small angle?

::: further-reading
Images of the surface of Mars were created by the Viking 1 and 2 landers in a very similar way! The landers took dozens of narrow slit images and sent them back to earth. Then a computer stitched them together to create a final image of the surface. You can see some of those [images](http://solarviews.com/eng/marssurf.htm).
:::


## Seeing Color

Most of you have probably mixed colors in art class at some point. Perhaps in art class you have talked about the difference between primary and secondary colors. Primary colors can be used to make all other colors (secondary colors).

#### If you wanted to make green while painting, what colors would you use? 

#### What ink colors does a typical printer have?

However, when you want to make different colors with an LED display, things work a little bit differently. Notice how with all three slide bars at 255, the box at the right is white. By adjusting the relative amount of green, red, and blue using the slide bars, you can change the color displayed.  

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
  document.getElementById("redshow").style["background-color"]=`rgba(255,0,0,${r/255})`;
  document.getElementById("greenshow").innerHTML=g;
  document.getElementById("greenshow").style["background-color"]=`rgba(0,255,0,${g/255})`;
  document.getElementById("blueshow").innerHTML=b;
  document.getElementById("blueshow").style["background-color"]=`rgba(0,0,255,${b/255})`;
}
document.getElementById("red").oninput = changeColor;
document.getElementById("green").oninput = changeColor;
document.getElementById("blue").oninput = changeColor;
changeColor();
</script>
</div>

Take a moment to play around with these and see if you can make your favorite color!

Did you notice how if you put the amount of blue at 0, but left the red and green at 255 that you got yellow? If you are used to mixing with paint this may be surprising!

The reason it works has to do with how our eyes detect light and our brains turn that into the image of the world that we see. 

When light comes from the Sun (or most other sources of illumination), we perceive it as lacking a hue (or being white). In reality, white light is a mixture of many colors of light. This mixture can be seen by using a prism to split out the different colors that make up the mixture. 

A prism works by bending, or “refracting”, light at different angles depending on its color, thereby allowing us to see all of the colors that make up white light. This is why if you let sunlight shine through a prism, you can see a rainbow.

![A prism forming a rainbow from sunlight.](/images/bookpics/prism_floor.jpg "Illustration of a rainbow forming from sunlight")

The light-sensing tissue in the back of our eyes, the retina, has small "sensors" that respond to some of these colors. They are called “cone cells” and are classified into three separate groups by the color that they sense the best: red, green, or blue. Each of these cells responds only to one of these three colors, but not the others. For instance, the blue-sensing cones respond to blue light, but do not respond to red light, and vice versa.

![An artistic rendering of a close-up of the back of the eye illustrating the rods (black rectangles) and cones (triangles colored by type).](/images/bookpics/rods_cones.png "Close-up cartoon of rods and cones in an eye")

#### This leads to a problem… If our eyes can sense only red, green, and blue, how come we can see yellow? 

Our eyes and brains have evolved so that our red- and green-sensing cones both respond slightly to yellow. If our brain detects that both groups of cones are activated, it knows to interpret the color as yellow. And similar compromises are made for the other colors we can detect. For instance, purple activates both the red- and blue-sensing cones.

::: further-reading
There is an animal that can (unlike us) detect the difference between a true pure color, and a mixture of colors that fakes the presence of the given color. This animal is a mantis shrimp, and it has 12 different types of cone cells in its eye. The Oatmeal comics has [an informative and entertaining strip about it](https://theoatmeal.com/comics/mantis_shrimp).
:::

We can exploit this imperfection of our eyes to make rich colorful displays (such as the screen you are viewing this on!) while using only three colors. In a sense, we are reverse-engineering colors! Since our eyes cannot distinguish between true purple and a mixture of blue and red, we don’t need a purple light source, only blue and red lights (and green for the other color combinations). If you look with a magnifying glass at a TV screen displaying a white page, you will see it is made out of red, blue, and green dots. 

![An artistic rendering of a close-up of computer screen illustrating how it is only made up of red, blue, and green light sources.](/images/bookpics/screens_closeup.png "Close-up cartoon of an LED screen")


## Coding the SpinWheel Simulator

Now let's start programming the SpinWheel simulator below to light up a specific color! You can use the code shown below. First, pick a color you like by changing the sliders above (for instance, I like this teal `(67,255,198)`), and you can make the large LEDs on the SpinWheel show that color by editing the code and running it on the virtual SpinWheel below (or uploading it to a physical SpinWheel). 

::: further-reading
0-255 is the range used by the SpinWheel for the minimum and maximum of red, green, and blue allowed in the mixture. While these numbers look strange to a human, computers use only 1's and 0's, where 0-255 is a nice, round number!
:::

#### You can use the small simulators below to directly see how the SpinWheel would respond if you run the code. 

We'll start out by just modifying the code to have all the large LEDs light up in the color we would like. By changing the values in `SpinWheel.setLargeLEDsUniform(...)` you can have the animation light up in the desired color. By modifying that line of code, you can change the brightness of each of the red, green, and blue components of the SpinWheel's lights.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(67, 255, 98);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

In the above example, we just turned on all of the large LEDs together. It is also possible to do the same with the small LEDs.


<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(67, 255, 98);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>


This small simulator also lets us change the color of each LED separately. You can also turn on just one large LED using the code below.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setLargeLED(0, 67, 255, 98);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

Right now we have just lit up the top LED in the inner loop. Play around with the LED number that is the first input into the code above to control which LED is lit up. 

#### Can you change the code to have two LEDs light up in two different colors using the above code? 

You can use a slightly different piece of code to light up an individual small LED.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.clearAllLEDs();
  SpinWheel.setSmallLED(4, 67, 255, 98);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>


If you are interested in experimenting with these simulators more, you can also control each of the LEDs separately.


<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

If after playing with these SpinWheel simulations, you are interested in learning more about coding in Arduino, then check out our lesson on [basic coding building blocks](/progpatterns).

If you are interested in trying this out on a physical SpinWheel, then you can read more about the SpinWheel and our project at [our website](/). We're selling the SpinWheel on the crowdfunding site [Kickstarter](https://www.kickstarter.com/projects/spinwheel/the-spinwheel-the-colorful-wearable-programming-kit) until April 30. 


