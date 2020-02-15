---
title: The Science of Vision
keywords: sight, vision, color
header-image: /images/banners/colors_and_eye.png 
---

The human eye is a fairly special organ. On one hand, it is already a spectacular sensor that, by far, outperform all the other senses in the amount of information it gives us about our surroundings. On the other hand, it is a hacked together compromise that leaves so much of the richness of color and light imperceptible to us. Here we will explore the limitations of this important sensor and we will even find out a few ways in which we can trick that sensor into believing things that are not there.

## Colors

Light, as it is coming from the Sun or most other source of illumination, is a mixture of all colors. We perceive that mixture as lacking a hue, i.e. as being white. There are tools we can use to split all the colored rays in a beam of white light: for instance we can use a prism that changes the direction in which light goes depending on its color, hence turning the white beam on one side into a spread-out rainbow on the other side.

The light-sensing tissue in the back of our eyes, the retina, has small cells that respond to some of these colors. They are called "cone cells" and there are three separate groups of them, sensing predominantly three different groups of colors: roughly separated in the red, green, and blue hues. For instance, the blue-sensing cones do not respond to red light, and vice versa. And our eyes do not really have the space to put any other types of cones in. This leads to a problem... If our eyes can sense only red, green, and blue, how come we can see yellow. The workaround that evolution has reached is to have both the "predominantly red" and "predominantly green" cones respond slightly to yellow. If our brain detects that both groups of cones are activated, it knows to interpret the color as yellow. And similar compromises are made for the other colors we can detect, e.g. purple activates both the red- and blue-sensing cones.

::: further-reading
There is an animal that can, unlike us, detect the difference between a true pure color, and a mixture of colors that fakes the presence of the given color. It is called a mantis shrimp and it has 12 different types of cone cells in its eye. The Oatmeal comics has [an informative and entertaining strip about it](https://theoatmeal.com/comics/mantis_shrimp).
:::

::: further-reading
You can learn more about the spectrum of light in the section on [light and color](/lightandcolor).
:::

We can exploit this imperfection of our eyes to make rich colorful displays while using only three colors. If our eyes can not distinguish between true purple and a mixture of blue and red, then we do not need a purple light source, rather only blue and red (and green for the other color combinations). If you look with a magnifying glass at a TV screen displaying a white page, you will see it is made out of red, blue, and green dots. Below you can move the sliders in order to see how all the colors of the rainbow can be made by mixing just red, green, and blue (or at our eyes can be convinced of that, even if it is not true).

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

This however, is good enough for our purposes, which are to create beautiful colorful patterns while using only a small set of hardware components. We can try to do that directly on the SpinWheel now. This is why we had chosen the sliders to go from 0 to 255 instead a more obvious set of numbers like 0 to 100 - it is the representation used by the SpinWheel.

If you have trouble understanding the commands below, be sure to read our [quick start guide](/quickstart) and if necessary some of the Computer Science 101 sections. Pick a color you like by changing the sliders above (for instance, I like purple like `(195,0,255)`), and make the large LEDs on the SpinWheel show that color.

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

## Persistence of Vision

There is another imperfection about our eyes. They are rather slow. And again, this leads to tricks we can employ in order to make interesting effects without using complicated hardware. Consider the example below, where you can select the speed at which a shade of blue and a shade of red switch between each other.

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

The flicker at high speeds is rather unpleasant, but you can start seeing the purple color emerging and the red and blue being less clearly noticeable. Web browsers are not particularly well adapted to this type of rapid color changes. On the other hand, the SpinWheel is very much up to the task. The following program will cycle between red and blue at variable delays. Experiment with the value for the delay and observer at what delay you stop distinguishing the two colors and start seeing only the purple?

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

Right at the point where the red and blue stop being observable on their own, you can perform another experiment that showcases the persistence of vision effect. Instead of keeping the SpinWheel immobile, start shaking it back and forth rapidly. Now the light emitters will be in different locations when they emit red and when they emit blue, and this will let you again distinguish the two colors. But once you stop shaking the device, it will once again look purple.

![If you move the SpinWheel rapidly in front of your eyes, you will see the purple color separete in two distinct streaks of red an blue.](/images/bookpics/fast_pov_streak.jpg "Picture of a fast-moving SpinWheel")

These two tools, of faking rich colors by combining just red, green, and blue, and of faking static images by very rapidly cycling through partial frames, are the basis for many of our technologies, and are indeed the tools used in the SpinWheel as well.
