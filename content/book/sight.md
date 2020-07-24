---
title: The Biology of Sight
keywords: sight, vision, color, biology, optical illusions
header-image: /images/banners/colors_and_eye.png
---

::: intro-box
You'll will learn how to trick your eyes into perceiving a rainbow of colors using only red, green, and blue LEDs. This lesson has two parts:

1. <strong> Colors</strong>: Learn more about how your eyes detect color and program the SpinWheel to mimic arbitrary colors.
2. <strong> Persistence of Vision</strong>: Use the SpinWheel to explore a limitation of our eyes that animators take advantage of.
:::

::: warning
<strong> WARNING: PHOTOSENSITIVITY/EPILEPSY SEIZURES </strong>

Some activities on this page involve flashing colors. If you (or a family member) have epilepsy, please talk to a parent or teacher before continuing.
:::

On one hand, the human eye is a spectacular sensor that far outperforms all our other senses in the amount of information it gives us about our surroundings. On the other hand, it leaves much of the richness of color and light imperceptible to us. Here, we will explore the limitations of this important organ; we will even learn a few ways in which we can trick it into seeing colors that aren’t actually there.

## Colors

When light comes from the Sun (or most other sources of illumination), we perceive it as lacking a hue (or, white light). In reality, white light is a mixture of many colors. This mixture can be seen by using a prism to separate the components of the mixture. A prism works by bending, or “refracting”, light at different angles depending on its color, thereby allowing us to see all of the colors that make up white light. This is why if you let sunlight shine through a prism, you can see a rainbow.

![White light being split into colors by a prism. The white light shines on the prism from the bottom left, and a big part of it is refracted and split as it passes through the prism. <a class="imagecredit" href="https://www.pexels.com/photo/optical-glass-triangular-prism-3845161/">image credit Pexels</a>](/images/bookpics/optical_glass_triangular_prism.jpg "Picture of a white light being split into colors by a prism")

The light-sensing tissue in the back of our eyes, the retina, has small cells that respond to some of these colors. They are called “cone cells” and are classified into three separate groups by the color that they sense the best: red, green, or blue. Each of these cells responds only to one of these three colors, but not the others. For instance, the blue-sensing cones respond to blue light, but do not respond to red light, and vice versa.

![An artistic rendering of a close-up of the back of the eye illustrating the rods (black) and cones (triangles colored by type).](/images/bookpics/rods_cones.png "Close-up cartoon of rods and cones in an eye")

This leads to a problem… If our eyes can sense only red, green, and blue, how come we can see yellow? Our eyes and brains have evolved so that our red- and green-sensing cones both respond slightly to yellow. If our brain detects that both groups of cones are activated, it knows to interpret the color as yellow. And similar compromises are made for the other colors we can detect. For instance, purple activates both red- and blue-sensing cones.

::: further-reading
There is an animal that can (unlike us) detect the difference between a true pure color, and a mixture of colors that fakes the presence of the given color (for humans, the true pure colors we can see are red, green, and blue). This animal is a mantis shrimp, and it has 12 different types of cone cells in its eye. The Oatmeal comic has [an informative and entertaining strip about it](https://theoatmeal.com/comics/mantis_shrimp).
:::


We can exploit this imperfection of our eyes to make rich colorful displays (such as the screen you are viewing this on!) while using only three colors. For instance, since our eyes cannot distinguish between true purple and a mixture of blue and red, we don’t need a purple light source, only blue and red lights (and green for the other color combinations).

If you look at a TV screen displaying a white page with a magnifying glass, you will see that it is made out of red, blue, and green dots. Combinations of these red, blue, and green dots make up the colorful displays you are looking at on your screen.

![An up-close picture of a computer screen, showing the red, green, and blue subpixels, making up the white background. (image credit to Wikimedia)](/images/bookpics/lcd_pixels_macro.jpg "An up-close picture of a computer screen, showing the red, green, and blue subpixels, making up the white background")

The SpinWheel produces colorful displays using a similar method. If you look closely at
a LED light on the SpinWheel, you can see that it contain 3 small light sources: one red, one green and one blue. Combining these lights in different intensities allows for a wide variety of colors to be displayed on the LEDs.
This will allow us to program the SpinWheel to display beautiful colorful patterns (while using only a small set of hardware components). 0-255 is the range used by the SpinWheel for the minimum and maximum of red, green, and blue allowed in the mixture (while these numbers look strange to a human, who would probably prefer the range 0-100, computers use binary numbers and it is more efficient to use ranges that are powers of 2, as in $256=2^8$). 

Below, you can move the sliders to see how all the colors of the rainbow can be made by mixing just red, green, and blue (or our eyes can be convinced of this, even if it is not true).

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
  document.getElementById("redshow").style["background-color"]=`rgb(${r},0,0)`;
  document.getElementById("greenshow").innerHTML=g;
  document.getElementById("greenshow").style["background-color"]=`rgb(0,${g},0)`;
  document.getElementById("blueshow").innerHTML=b;
  document.getElementById("blueshow").style["background-color"]=`rgb(0,0,${b})`;
}
document.getElementById("red").oninput = changeColor;
document.getElementById("green").oninput = changeColor;
document.getElementById("blue").oninput = changeColor;
changeColor();
</script>
</div>

::: further-reading
You can learn more about the spectrum of light and the physics behind it in the section on
[Light and Color](/lightandcolor).
Or if you are interested in the study of color as perceived by humans,
and how this informs the choice of pigments and colored lights,
see the section on [Color Theory](/colortheory).
:::

Now let us start programming the SpinWheel to light up in a specific color! First, copy the code shown here to a new sketch in the Arduino software. Pick a color you like by changing the sliders above (for instance, we like this purple `(195,0,255)`)
You can make the large LEDs on the SpinWheel display that color by changing the values in `SpinWheel.setLargeLEDsUniform(...)` . For example, to create our pretty purple color, we would change `SpinWheel.setLargeLEDsUniform(0, 0, 0)` to `SpinWheel.setLargeLEDsUniform(195,0,255)`. Finally, save the sketch and upload it to your SpinWheel. If you do not have a SpinWheel at hand, you can program the virtual one further down on this page. 

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Initialize all of the hardware on the SpinWheel.
  SpinWheel.begin();
  // Ask the SpinWheel to prepare all large LEDs to
  // show a particular color.
  SpinWheel.setLargeLEDsUniform(0, 0, 0);
  // Make the SpinWheel show the registered color.
  SpinWheel.drawFrame();
}

void loop() {
}
```

::: further-reading
If you have trouble uploading to your SpinWheel, be sure to read our [Quick Start Guide](/quickstart). If you want more explanation about the code shown here, you can read the [Programming Patterns lesson](/progpatterns).
:::

You can try this code in the virtual SpinWheel simulator - this lets you see how your physical SpinWheel would respond if you ran the same code. Below you can change the brightness of each of the red, green, and blue components of the light emitters.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(195, 0, 255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

## Persistence of Vision

Our eyes have another imperfection that we can take advantage of while programming the SpinWheel: they are rather slow at perceiving changes when compared to the speed that electronics can operate at! This is often described as the persistence of vision. Consider the example below, where you can select the speed at which a shade of blue and a shade of red switch between each other.

::: warning
Be careful with the next demo! It involves flashing colors and it might be inappropriate for people suffering from epilepsy!
:::

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

Since web browsers are not particularly well adapted to this type of rapid color change, the flicker at high speeds is rather unpleasant. However, as you speed up the color changes, you will start to see purple, and the original red and blue will become less clearly distinct. Unlike web browsers, the SpinWheel is up to this task. The following program will cycle between red and blue at variable delays. Upload it to your SpinWheel and experiment with the value for the delay time by changing the line `int delay_time_in_milliseconds = 500;`. At what delay time do you stop distinguishing the two original colors and start seeing only purple?

```cpp
// BE CAREFUL IF YOU HAVE EPILEPSY AS THIS WILL CAUSE FLASHING COLORS!!!
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Initialize all of the hardware on the SpinWheel.
  SpinWheel.begin();
}

// BE CAREFUL IF YOU HAVE EPILEPSY AS THIS WILL CAUSE FLASHING COLORS!!!
// Change this value! Experiment!
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

Right at the point where the red and blue stop being observable on their own, you can perform another experiment that showcases the persistence of vision effect. Instead of keeping the SpinWheel still, start shaking it back and forth rapidly. By doing this, the light emitters will be in different locations in space when they emit either red or blue, and this will let you once again distinguish the two colors (and stop seeing purple). Once you stop shaking the device, it will once again look purple.

![If you move the SpinWheel rapidly in front of your eyes, you will see the purple color separate in two distinct streaks of red and blue.](/images/bookpics/fast_pov_streak.jpg "Picture of a fast-moving SpinWheel")

These two tools -- faking rich colors by combining just red, green, and blue, and faking a complete static image by very rapidly cycling through incomplete images -- are the basis for many technologies, and are tools we’ll keep using as we program the SpinWheel in more advanced ways.


<!--TODO: This further reading box seems inappropriate. Use different format for this block-->

::: further-reading
To keep exploring, you can try other color combinations! 
For instance, what happens if you mix red and green?
Can you make orange?
:::
