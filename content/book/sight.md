---
title: The Biology of Sight
keywords: sight, vision, color, biology, optical illusions
header-image: /images/banners/colors_and_eye.png 
---

::: intro-box
In this adventure, you'll trick your eyes into perceiving a rainbow of colors using only red, green, and blue LEDs. This lesson has two parts:
<ol>
<li><strong> Colors</strong>: learn more about how your eyes detect color and try programming a virtual SpinWheel</li>
<li><strong> Persistence of Vision</strong>: use the SpinWheel to explore a limitation of our eyes that animators take advantage of </li>
</ol>
:::

On one hand, the human eye is a spectacular sensor that, by far, outperforms all our other senses in the amount of information it gives us about our surroundings. On the other hand, it leaves much of the richness of color and light imperceptible to us. Here, we will explore the limitations of this important organ; we will even learn a few ways in which we can trick it into seeing colors that aren’t actually there.

## Part 1. Colors

When light comes from the Sun (or most other sources of illumination), we perceive it as lacking a hue (or being white). In reality, white light is a mixture of many colors. One way we can see this mixture is by using a prism. A prism works by bending (“refracting”) light at different angles depending on its color, allowing us to see all of the colors that make up white light. This is why if you let sunlight shine through a prism, you can see a rainbow.

![A prism forming a rainbow from sunlight.](/images/bookpics/prism_floor.jpg "Illustration of a rainbow forming from sunlight")

The light-sensing tissue in the back of our eyes (the retina) has small cells that respond to some of these colors. They are called “cone cells” and there are three separate groups of them classified by the color that they sense the best - red, green, or blue. For instance, the blue-sensing cones respond to blue light, but do not respond to red light, and vice versa. 

![An artistic rendering of a close-up of the back of the eye illustrating the rods (black rectangles) and cones (triangles colored by type).](/images/bookpics/rods_cones.png "Close-up cartoon of rods and cones in an eye")

This leads to a problem… If our eyes can sense only red, green, and blue, how come we can see yellow? Our eyes and brains have evolved so that our red- and green-sensing cones both respond slightly to yellow. If our brain detects that both groups of cones are activated, it knows to interpret the color as yellow. And similar compromises are made for the other colors we can detect, for instance, purple activates both the red- and blue-sensing cones. 

::: further-reading
There is an animal that can (unlike us) detect the difference between a true pure color, and a mixture of colors that fakes the presence of the given color. It is called a mantis shrimp and it has 12 different types of cone cells in its eye. The Oatmeal comics has [an informative and entertaining strip about it](https://theoatmeal.com/comics/mantis_shrimp).
:::

::: further-reading
You can learn more about the spectrum of light in the section on [light and color](/lightandcolor).
:::

We can exploit this imperfection of our eyes to make rich colorful displays (such as in a computer screen) while using only three colors. Since our eyes cannot distinguish between true purple and a mixture of blue and red, we don’t need a purple light source, only blue and red lights (and green for the other color combinations). If you look with a magnifying glass at a TV screen displaying a white page, you will see it is made out of red, blue, and green dots. Below you can move the sliders in order to see how all the colors of the rainbow can be made by mixing just red, green, and blue (or our eyes can be convinced of that, even if it is not true).

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

This will allow us to program the SpinWheel (or the SpinWheel animation below) to display beautiful colorful patterns (while using only a small set of hardware components). This is why the sliders go from 0 to 255 instead of a more obvious set of numbers like 0 to 100 - this is the range used by the SpinWheel for the minimum and maximum of red, green, and blue allowed in the mixture. 

Now let's start programming the SpinWheel to light up a specific color! You can use the code shown below. Pick a color you like by changing the sliders above (for instance, I like this purple `(195,0,255)`), and make the large LEDs on the SpinWheel show that color by editing the code and uploading it to the SpinWheel.

To experiment with this without having a SpinWheel, then you can try the code below here on our animated SpinWheel. By changing the value of `SpinWheel.setLargeLEDsUniform()` you can have the animation light up as you would the real SpinWheel. 

If you have trouble understanding the commands below, be sure to read our [quick start guide](/quickstart) and if necessary some of the Computer Science 101 sections. 

::: warning :
One more quick point: depending on how bright it is in the room where you are programming the SpinWheel, you may want to change the brightness of the LEDs. For instance, something that seems blinding when working on it under artificial lights will seem dim in full sunlight. If you'd like to change the brightness of the SpinWheel (for any reason!), you can add `SpinWheel.largeLEDs.setBrightness(X);` into the `setup` function, and change the value of X to any value you wish between 0 (off) and 255 (brightest).
:::

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Initialize all of the hardware on the SpinWheel.
  SpinWheel.begin();
  // Ask the SpinWheel to prepare all large LEDs to
  // show a particular color.
  SpinWheel.setLargeLEDsUniform(195, 0, 255);
  // Make the SpinWheel show the registered color.
  SpinWheel.drawFrame();
}

void loop() {
}
```

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  int t = millis();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform((t/10)%255, 0, (t/10)%255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Part 2. Persistence of Vision

Our eyes have another imperfection we can take advantage of while programming the SpinWheel: they are rather slow. Consider the example below, where you can select the speed at which a shade of blue and a shade of red switch between each other.

<style>
#povtests {
  font-size: 2rem;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
}
#povtests input {
  width: 30%;
  margin: 0;
}
#povtests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
#povtests .vis {
  width: 30%;
  height: 2em;
  line-height: 2em;
}
#povshow {
  background-color: red;
  animation-name: flicker;
  animation-duration: 1s;
  animation-iteration-count: infinite;
  animation-timing-function: step-start;
  animation-play-state: paused;
}
@keyframes flicker {
  0%   {background-color: red;}
  50% {background-color: blue;}
}
</style>
<div id="povtests">
<div><input type="range" min="80" max="2000" value="1000" id="time"><span class="vis" id="timeshow"></span><span class="vis" id="povshow">&nbsp;</span></div>
<button id="start">Start</button>
<button id="stop">Stop</button>
<script>
var t = document.getElementById("time").value;
var squarestyle = document.getElementById("povshow").style;
function getT(){
  t = document.getElementById("time").value;
  document.getElementById("timeshow").innerHTML = `${t}ms`;
  squarestyle["animation-duration"] = `${t/1000}s`;
}
function startCycle(){
  squarestyle["animation-play-state"]="running";
}
function stopCycle(){
  squarestyle["animation-play-state"]="paused";
}
document.getElementById("time").oninput = getT;
document.getElementById("start").onclick = startCycle;
document.getElementById("stop").onclick = stopCycle;
getT();
</script>
</div>

Since web browsers are not particularly well adapted to this type of rapid color change, the flicker at high speeds is rather unpleasant. However at these speeds, you will start to see purple and the red and blue will become less clearly noticeable. Unlike web browsers, the SpinWheel is up to this task, though. The following program will cycle between red and blue at variable delays. Experiment with the value for the delay. At what delay do you stop distinguishing the two colors and start seeing only purple?

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Initialize all of the hardware on the SpinWheel.
  SpinWheel.begin();
}

// CHANGE THIS VALUE! EXPERIMENT!
int delay_time_in_milliseconds = 500;

void loop() {
  // Show red...
  SpinWheel.setLargeLEDsUniform(255, 0, 0);
  SpinWheel.drawFrame();
  // Wait...
  delay(delay_time_in_milliseconds);
  // Show blue...
  SpinWheel.setLargeLEDsUniform(0, 0, 255);
  SpinWheel.drawFrame();
  // Wait...
  delay(delay_time_in_milliseconds);  
}
```

Right at the point where the red and blue stop being observable on their own, you can perform another experiment that showcases the persistence of vision effect. Instead of keeping the SpinWheel immobile, start shaking it back and forth rapidly. Now the light emitters will be in different locations when they emit red and blue, and this will let you again distinguish the two colors. But once you stop shaking the device, it will once again look purple.

![If you move the SpinWheel rapidly in front of your eyes, you will see the purple color separate in two distinct streaks of red and blue.](/images/bookpics/fast_pov_streak.jpg "Picture of a fast-moving SpinWheel")

These two tools--faking rich colors by combining just red, green, and blue and faking a complete static image by very rapidly cycling through incomplete images--are the basis for many technologies, and are tools we’ll keep using as we program the SpinWheel in more complicated ways.

::: further-reading
To keep exploring, you can try other color combinations! 
<ul>
<li>For instance, what happens if you mix red and green? </li>
<li>Can you make orange?</li>
</ul>
:::
