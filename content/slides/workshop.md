---
title: SpinWheel Workshop
keywords: SpinWheel, programming, electronics, physics, color, light, electromagnetism, color theory, pigments, art
---

# The Biology of Sight

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<style>
.note_question {
  color: #2676b0;
}
</style>

<aside class="notes">
<h3>To be done in Session 1 (10ish minutes of mostly instructing students)</h1>

This section aims to introduce a couple of curious facts about color, light, and sight.
Of particular importance is to introduce the idea that mixing the primary red, green, and blue color light
enables tricking our eyes into perceiving any other color. **However, the main goal is to excite the kids
with a non-technical topic before we talk about code**.

_For this first lesson, we will learn how to trick our eyes into perceiving a rainbow of colors using only red, green, and blue LEDs._

Be sure to check out the [biology of sight](/sight) and [color theory](/colortheory) lessons on which this section is based or see [the detailed slide deck on Sight and Light for more](/slides/sight).
</aside>
---

![](/images/banners/colors_and_eye.png)

<aside class="notes">
Consider spending a second to mention the structure of our eyes and the sub-pixels of a TV, just briefly as you will have a chance to mention this in more detail later.

_Our eyes have sensors for three different colors and our brain knows to interpret mixtures of these base colors as new derivative colors. Our technology, including TVs, use this to create any desired color by using only red, green, and blue light sources._
</aside>

---

![White light being split into colors by a prism. The white light shines on the prism from the bottom left, and a big part of it is refracted and split as it passes through the prism. <a class="imagecredit" href="https://www.pexels.com/photo/optical-glass-triangular-prism-3845161/">image credit Pexels</a>](/images/bookpics/optical_glass_triangular_prism.jpg "Picture of a white light being split into colors by a prism")

<aside class="notes">
If you care about physics and electrodynamics, mention in some detail that white light is a mixture of all wavelengths, and that color and wavelength are related. However, this is unrelated to the way eyes perceive color and can be skipped if you prefer. Consult the [light and color lesson](/lightandcolor) for more details.
 
_In reality, white light is a mixture of many colors. This mixture can be seen by using a prism to separate the components of the mixture._

_A prism works by bending, or “refracting”, light at different angles depending on its color, thereby allowing us to see all of the colors that make up white light. This is why if you let sunlight shine through a prism, you can see a rainbow._
</aside>

---

![An artistic rendering of a close-up of the back of the eye illustrating the rods (black) and cones (triangles colored by type). <a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">image credit Jack Hegarty</a>](/images/bookpics/rods_cones.png "Close-up cartoon of rods and cones in an eye")

<aside class="notes">
Spend some time talking about this schematic and what it means that our eyes have only three colors sensor but we are able to see more colors.

_The light-sensing tissue in the back of our eyes, the retina, has small cells that respond to some of these colors. They are called “cone cells” and are classified into three separate groups by the color that they sense the best: red, green, or blue. Each of these cells responds only to one of these three colors, but not the others. For instance, the blue-sensing cones respond to blue light, but do not respond to red light, and vice versa._

_This leads to a problem… <span class="note_question">If our eyes can sense only red, green, and blue, how come we can see yellow?</span>_

_Our eyes and brains have evolved so that our red- and green-sensing cones both respond slightly to yellow. If our brain detects that both groups of cones are activated, it knows to interpret the color as yellow. And similar compromises are made for the other colors we can detect. For instance, purple activates both red- and blue-sensing cones._
</aside>

---

<iframe src="https://theoatmeal.com/comics/mantis_shrimp" style="width:100%; height:50vh"></iframe>

[The Oatmeal](https://theoatmeal.com/comics/mantis_shrimp) has a great educational comics on an animal with even more color sensitivity.

<aside class="notes">
Up to you if you want to mention there are animals with different number of color receptors, or mention the Oatmeal comics that talks about how amazing the Mantis Shrimp is with its 12 receptors and its thermonuclear explosion of colors and blood soaked rainbows.
</aside>

---

![An up-close picture of a computer screen, showing the red, green, and blue light sources, making up the white background. These sources, or subpixels, are so close together that from a distance we see them as overlapping and observe only their mixture.<a class="imagecredit" href="https://commons.wikimedia.org/wiki/File:LCD_Pixels_Macro.jpg">image credit Wikimedia</a>](/images/bookpics/lcd_pixels_macro.jpg "An up-close picture of a computer screen, showing the red, green, and blue subpixels, making up the white background")


<aside class="notes">
_We can exploit this imperfection of our eyes to make rich colorful displays while using only three colors. For instance, our eyes cannot distinguish between true purple and a mixture of blue and red, so we don’t need a purple light source, only blue and red lights._

_If you look at a TV screen displaying a white page with a magnifying glass, you will see that it is made out of red, blue, and green dots. Combinations of these red, blue, and green dots make up the colorful displays you are looking at on your screen._
</aside>

---

![An up-close picture of some of the SpinWheel's LEDs, showing the red, green, and blue subpixels.](/images/bookpics/LED_close-up.jpg "An up-close picture of five SpinWheel LEDs, showing the red, green, and blue subpixels.")

<aside class="notes">
_The SpinWheel’s colorful display uses a similar method. If you look closely at a LED light on the SpinWheel or in the above image, you can see that it contains 3 small light sources: one red, one green, and one blue. Combining these lights in different intensities allows for a wide variety of colors to be displayed on the LEDs. This will allow us to program the SpinWheel to display beautiful colorful patterns (while using only a small set of hardware components)._
</aside>

---

## An example of Red, Green, Blue mixing

<style>
#acolortests {
  text-align: left;
  font-size: 2rem;
}
#acolortests .explain {
  font-size: 1rem;
  width: 80%;
  margin: 0 auto;
}
#acolortests input {
  width: 20%;
  margin: 0;
}
#acolortests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
#acolortests .spacer {
  width:5%;
}
#acolortests .vis {
  width: 20%;
  height: 2em;
  line-height: 2em;
  border: solid 1px;
  border-color: black;
  color: white;
}
#aredshow {border-color: red !important;}
#agreenshow {border-color: green !important;}
#ablueshow {border-color: blue !important;}
#acolortests .svganim {
  text-align: center;
  width: 100%;
  margin: 0 auto;
}
</style>
<div id="acolortests">
<div class="explain">
</div>
<div><input type="range" min="0" max="255" value="255" id="ared"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="agreen"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="ablue"></div>
<div><span class="vis" id="aredshow">255</span><span class="spacer">+</span><span class="vis" id="agreenshow">255</span><span class="spacer">+</span><span class="vis" id="ablueshow">255</span><span class="spacer">=</span><span class="vis" id="argbshow">&nbsp;</span></div>
<div class="svganim">
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg" markdown=0> <filter id="alight"> <feDiffuseLighting id="asvgred" in="SourceGraphic" result="lightr" lighting-color="#f00" diffuseConstant="1.5"> <fePointLight x="50" y="150" z="80" /> <!--<feSpotLight x="15" y="20" z="40" limitingConeAngle="25" pointsAtX="50" pointsAtY="50" pointsAtZ="20"/>--> </feDiffuseLighting> <feDiffuseLighting id="asvggreen" in="SourceGraphic" result="lightg" lighting-color="#0f0" diffuseConstant="1.5"> <fePointLight x="100" y="30" z="80" /> <!--<feSpotLight x="100" y="-10" z="40" limitingConeAngle="25" pointsAtX="100" pointsAtY="60" pointsAtZ="0"/>--> </feDiffuseLighting> <feDiffuseLighting id="asvgblue" in="SourceGraphic" result="lightb" lighting-color="#00f" diffuseConstant="1.5"> <fePointLight x="150" y="150" z="80" /> <!--<feSpotLight x="185" y="20" z="40" limitingConeAngle="25" pointsAtX="150" pointsAtY="50" pointsAtZ="20"/>--> </feDiffuseLighting> <feComposite in="SourceGraphic" in2="lightr" result="sourceWithR" operator="arithmetic" k1="1" k2="0" k3="0" k4="0"/>    <feComposite in="SourceGraphic" in2="lightg" result="sourceWithG" operator="arithmetic" k1="1" k2="0" k3="0" k4="0"/>    <feComposite in="SourceGraphic" in2="lightb" result="sourceWithB" operator="arithmetic" k1="1" k2="0" k3="0" k4="0"/>    <feComposite in="sourceWithR" in2="sourceWithG" result="sourceWithRG" operator="arithmetic" k1="0" k2="1" k3="1" k4="0"/>    <feComposite in="sourceWithRG" in2="sourceWithB" result="sourceWithRGB" operator="arithmetic" k1="0" k2="1" k3="1" k4="0"/>    </filter> <circle cx="100" cy="100" r="80" fill="white" stroke="black" stroke-opacity="1" filter="url(#alight)" /> </svg>
</div>
<script>
function achangeColor(){
  var r = document.getElementById("ared").value;
  var g = document.getElementById("agreen").value;
  var b = document.getElementById("ablue").value;
  document.getElementById("argbshow").style["background-color"]=`rgb(${r},${g},${b})`;
  document.getElementById("aredshow").innerHTML=r;
  document.getElementById("aredshow").style["background-color"]=`rgb(${r},0,0)`;
  document.getElementById("asvgred").setAttribute("lighting-color",`rgb(${r},0,0)`);
  document.getElementById("agreenshow").innerHTML=g;
  document.getElementById("agreenshow").style["background-color"]=`rgb(0,${g},0)`;
  document.getElementById("asvggreen").setAttribute("lighting-color",`rgb(0,${g},0)`);
  document.getElementById("ablueshow").innerHTML=b;
  document.getElementById("ablueshow").style["background-color"]=`rgb(0,0,${b})`;
  document.getElementById("asvgblue").setAttribute("lighting-color",`rgb(0,0,${b})`);
}
document.getElementById("ared").oninput = achangeColor;
document.getElementById("agreen").oninput = achangeColor;
document.getElementById("ablue").oninput = achangeColor;
achangeColor();
</script>
</div>

<aside class="notes">
Play a bit with the sliders, ask about favorite colors, make them guess how to mix it, mention that shortly we will do it with the device itself.
</aside>


# Programming an artistic piece of electronics

<aside class="notes">
<h3>To be done in Session 1 (30ish minutes with a lot of interaction from students)</h3>
We will finally start modifying code and uploading it to the SpinWheel. In the next few slides we will **not** explain in detail what "variables" or "functions" are. Using the word "command" instead of "function" might help. We will just hack around to get a sense of it.

Moreover, each "code" slide would have an interactive "sliders based" slide before it, where we can observe what the device can in principle do before trying to express it in code. Try to stress that idea to the students: _do not start thinking in code, rather start by thinking what you want to happen, and only then express it in code_.

Try to gauge the engagement of the students here: this would be a crucial spot to learn whether you are going too slow or too fast for them.
</aside>

---

<!--WARNING: This really abuses the virtual spinwheel code. Here be dragons... and bugs...-->
<style>
#first-color {
  width:50vw;
}
.colortests {
  font-size: 2rem;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
  color: black;
}
.colortests input {
  width: 80%;
  margin: 0;
}
.colortests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
.colortests .vis {
  width: 80%;
  height: 2em;
  line-height: 2em;
  border: solid 1px;
}
.redshow {border-color: red !important;}
.greenshow {border-color: green !important;}
.blueshow {border-color: blue !important;}
</style>
<div id="first-color" class="ssw-container ssw-skip">
<div class="ssw-code">
<div class="colortests">
<div><input type="range" min="0" max="255" value="0" class="red"><br><span class="vis redshow">0</span><br><br><input type="range" min="0" max="255" value="0" class="green"><br><span class="vis greenshow">0</span><br><br><input type="range" min="0" max="255" value="0" class="blue"><br><span class="vis blueshow">0</span></div>
<script>
var firstcolornode = document.getElementById("first-color");
function changeColor(){
  var r = firstcolornode.getElementsByClassName("red")[0].value;
  var g = firstcolornode.getElementsByClassName("green")[0].value;
  var b = firstcolornode.getElementsByClassName("blue")[0].value;
  var col =`rgb(${r},${g},${b})`;
  for (let led of firstcolornode.getElementsByClassName("ssw-large-led")) {
    led.style["background-color"]=col;
  }
  firstcolornode.getElementsByClassName("redshow")[0].innerHTML=r;
  firstcolornode.getElementsByClassName("redshow")[0].style["background-color"]=`rgb(${r},0,0)`;
  firstcolornode.getElementsByClassName("greenshow")[0].innerHTML=g;
  firstcolornode.getElementsByClassName("greenshow")[0].style["background-color"]=`rgb(0,${g},0)`;
  firstcolornode.getElementsByClassName("blueshow")[0].innerHTML=b;
  firstcolornode.getElementsByClassName("blueshow")[0].style["background-color"]=`rgb(0,0,${b})`;
}
firstcolornode.getElementsByClassName("red")[0].oninput = changeColor;
firstcolornode.getElementsByClassName("green")[0].oninput = changeColor;
firstcolornode.getElementsByClassName("blue")[0].oninput = changeColor;
changeColor();
</script>
</div>
</div>
<div class="ssw-vis-out" style="width: 200px;">
<div class="ssw-vis">
<div>
<img src="/simspinwheel/spinwheel_invertgray.png">
<div class="ssw-large-led ssw-large-led0"></div>
<div class="ssw-large-led ssw-large-led1"></div>
<div class="ssw-large-led ssw-large-led2"></div>
<div class="ssw-large-led ssw-large-led3"></div>
<div class="ssw-large-led ssw-large-led4"></div>
<div class="ssw-large-led ssw-large-led5"></div>
<div class="ssw-large-led ssw-large-led6"></div>
<div class="ssw-large-led ssw-large-led7"></div>
<div class="ssw-small-led ssw-small-led0"></div>
<div class="ssw-small-led ssw-small-led1"></div>
<div class="ssw-small-led ssw-small-led2"></div>
<div class="ssw-small-led ssw-small-led3"></div>
<div class="ssw-small-led ssw-small-led4"></div>
<div class="ssw-small-led ssw-small-led5"></div>
<div class="ssw-small-led ssw-small-led6"></div>
<div class="ssw-small-led ssw-small-led7"></div>
<div class="ssw-small-led ssw-small-led8"></div>
<div class="ssw-small-led ssw-small-led9"></div>
<div class="ssw-small-led ssw-small-led10"></div>
<div class="ssw-small-led ssw-small-led11"></div>
</div>
</div>
</div>
</div>

<aside class="notes">
Very briefly reprise the discussion from the last color-mixing slide, this time in the context of it being possible on the SpinWheel LEDs.
</aside>

---

The corresponding command in code looks like

`SpinWheel.setLargeLEDsUniform(50, 255, 250)`

<aside class="notes">
Maybe mention that they are not expected to "know" this command, rather these things usually come in documentation tables provided with the language or device you are programming.

There is also `setSmallLEDsUniform`.
</aside>

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(50, 255, 250);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

<aside class="notes">
Finally, we will actually write and upload code. Briefly explain what each line does. The students do not need to write the code from scratch, they can open it from the Example's folder in the Arduino software. It is the sketch in [`Paper_Guide Purple_LEDs`](/codedoc/examples/Paper_Guide/Purple_LEDs/). Instruct them to set it up to light up with their favorite color. **After** the successful uploads, do not spend much time here: the next slide is more interesting.

You should be able to make suggestions in the simulator on this page, but having your own Arduino software running and shared on screen would be pretty important too. Expect a lot of errors due to semicolons and commas.
</aside>

---

<!--WARNING: This really abuses the virtual spinwheel code. Here be dragons... and bugs...-->
<div id="second-color" class="ssw-container ssw-skip">
<div class="ssw-code">
<div class="colortests">
<div><input type="range" min="0" max="7" value="0" class="number"><br>LED Number <span class="numshow">0</span><br><br><input type="range" min="0" max="255" value="255" class="red"><br><span class="vis redshow">255</span><br><br><input type="range" min="0" max="255" value="255" class="green"><br><span class="vis greenshow">255</span><br><br><input type="range" min="0" max="255" value="255" class="blue"><br><span class="vis blueshow">255</span></div>
<script>
var secondcolornode = document.getElementById("second-color");
function changeSingleColor(){
  var n = secondcolornode.getElementsByClassName("number")[0].value;
  var r = secondcolornode.getElementsByClassName("red")[0].value;
  var g = secondcolornode.getElementsByClassName("green")[0].value;
  var b = secondcolornode.getElementsByClassName("blue")[0].value;
  var col =`rgb(${r},${g},${b})`;
  secondcolornode.getElementsByClassName(`ssw-large-led${n}`)[0].style["background-color"]=col;
  secondcolornode.getElementsByClassName("numshow")[0].innerHTML=n;
  secondcolornode.getElementsByClassName("redshow")[0].innerHTML=r;
  secondcolornode.getElementsByClassName("redshow")[0].style["background-color"]=`rgb(${r},0,0)`;
  secondcolornode.getElementsByClassName("greenshow")[0].innerHTML=g;
  secondcolornode.getElementsByClassName("greenshow")[0].style["background-color"]=`rgb(0,${g},0)`;
  secondcolornode.getElementsByClassName("blueshow")[0].innerHTML=b;
  secondcolornode.getElementsByClassName("blueshow")[0].style["background-color"]=`rgb(0,0,${b})`;
}
function changeSingleColorNumber(){
  var n = secondcolornode.getElementsByClassName("number")[0].value;
  secondcolornode.getElementsByClassName("numshow")[0].innerHTML=n;
}
secondcolornode.getElementsByClassName("number")[0].oninput = changeSingleColorNumber;
secondcolornode.getElementsByClassName("red")[0].oninput = changeSingleColor;
secondcolornode.getElementsByClassName("green")[0].oninput = changeSingleColor;
secondcolornode.getElementsByClassName("blue")[0].oninput = changeSingleColor;
changeSingleColor();
</script>
</div>
</div>
<div class="ssw-vis-out" style="width: 200px;">
<div class="ssw-vis">
<div>
<img src="/simspinwheel/spinwheel_invertgray.png">
<div class="ssw-large-led ssw-large-led0"></div>
<div class="ssw-large-led ssw-large-led1"></div>
<div class="ssw-large-led ssw-large-led2"></div>
<div class="ssw-large-led ssw-large-led3"></div>
<div class="ssw-large-led ssw-large-led4"></div>
<div class="ssw-large-led ssw-large-led5"></div>
<div class="ssw-large-led ssw-large-led6"></div>
<div class="ssw-large-led ssw-large-led7"></div>
<div class="ssw-small-led ssw-small-led0"></div>
<div class="ssw-small-led ssw-small-led1"></div>
<div class="ssw-small-led ssw-small-led2"></div>
<div class="ssw-small-led ssw-small-led3"></div>
<div class="ssw-small-led ssw-small-led4"></div>
<div class="ssw-small-led ssw-small-led5"></div>
<div class="ssw-small-led ssw-small-led6"></div>
<div class="ssw-small-led ssw-small-led7"></div>
<div class="ssw-small-led ssw-small-led8"></div>
<div class="ssw-small-led ssw-small-led9"></div>
<div class="ssw-small-led ssw-small-led10"></div>
<div class="ssw-small-led ssw-small-led11"></div>
</div>
</div>
</div>
</div>

<aside class="notes">
By sequentially selecting an LED and then setting its color we can do this for all LEDs.
Spend a minute or so, showing an example in which a few consecutive LEDs are turned in
something like red, then blue, then purple. We will do this on the actual device shortly.
</aside>

---

The corresponding command is `SpinWheel.setLargeLED(4, 255, 0, 100);`

<aside class="notes">
Note that now we do not just give the 3 colors to be used, but also specify which LED to turn on.

There is also `setSmallLED`.
</aside>

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 0, 100);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

<aside class="notes">
Unleash some more creativity here. As a starting point, the students can use [`Paper_Guide Red_LED`](/codedoc/examples/Paper_Guide/Red_LED/). Feel free to spend a lot of time here, and have them copy paste the line with `setLargeLED` and even start using `setSmallLED` and make their own pattern. If they are getting impatient, tell them that soon we will see how to make these things flash and change with time, but for the moment **we need to learn how to do static images**.

**Do not necessarily stay on this page. The next few pages have tips that on the small LEDs and other ideas that might be of use. For the next few minutes at least, do not feel bound by the sliders, rather really focus on doing things with the kids and making new patterns by adding more larger or small LEDs in various colors.**

**Encourage them to make pictures, selfies, screenshots, etc.**

You should be able to make suggestions in the simulator on this page, but having your own Arduino software running and shared on screen would be pretty important too. Expect a lot of errors due to semicolons and commas.
</aside>

---

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

<aside class="notes">
Let them know that this schematic is also available in their booklets and online.
</aside>

---

### Turning on the Small LEDs

You can also turn on all of the small LEDs.
To do this, instead of using `SpinWheel.setLargeLEDsUniform`, 
you can use the line  
`SpinWheel.setSmallLEDsUniform`.
Like above, the three numbers represent the red, green, and blue 
components of the color you want to make.

<aside class="notes">
The next few slides explain the commands for the small LEDs. Just stick to one of them, or better, open your own Arduino software, and play with the kids.

**Encourage them to make pictures, selfies, screenshots, etc.**
</aside>

---

`SpinWheel.setSmallLEDsUniform(0, 200, 255);`

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDsUniform(0, 200, 255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

---

`SpinWheel.setSmallLED(2, 0, 255, 0);`

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.clearAllLEDs();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLED(2, 0, 255, 0);
  SpinWheel.setSmallLED(5, 0, 255, 0);
  SpinWheel.setSmallLED(8, 0, 255, 0);
  SpinWheel.setSmallLED(11, 0, 255, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

---

At this point, you can modify the code above to create your own pattern.

We encourage you to take some time to experiment with this to create your own designs.

Consider checking out:

  - [The Initial Setup slide deck](/slides/intro)
  - [SpinWheel Initial Setup at `/quickstart`](/quickstart)
  - [Getting Started with the SpinWheel at `/intro`](/intro)
  - [SpinWheel Troubleshooting Guide at `/troubleshoot`](/troubleshoot)
  - [Arduino 101 at `/arduino101`](/arduino101)


<aside class="notes">
Some userful resources, some of which we will do together. This is probably the end of the first session.
No need to spend time on this slide, rather show the upcoming slide and excite them about what we are going to do:
**a bit more advanced programming that lets us make time dependent and even motion sensing patterns**.

If you ended early, do the "General Programming Principles", but do not worry too much about it.
</aside>

# More general programming principles

<aside class="notes">
<h3>To be done in Session 2, but might start in Session 1 (15ish minutes of mostly instructing students)</h3>

Now that the students have basic understanding of color mixing and have seen some simple examples of what the device can do (and made simplistic programs themselves), we can talk about what a program actually looks like. Remember, up to now they have just been "hacking" some code, based on what the names of commands sound like and changed some numbers, they have not learnt why commands are ordered in a certain way. We will learn this here.

For a lot of this section you probably want to use the word "command", not the word "function", to avoid confusion among students that might know what a mathematical function is.

Based on the [Basic Structure of a Program](/basics) and [Coding Building Blocks](/progpatterns) pages. Check out the [Programming slide deck](/slides/programming) which includes more details.
</aside>

---

## The Skeleton of an Arduino Program

```c++
void setup() {

}

void loop() {

}
```

This program does absolutely nothing.

<aside class="notes">
The video on the next page might be when you actually want to talk a lot as it explains this slide well visually. But here is what the code of an "empty" program looks like.

_Most programs for any computer are split in a section that prepares various prerequisites and turns on various hardware,
followed by a section that actually runs the interesting features of the program. Arduino makes this separation very obvious: We have a block called `setup` that performs the setup, and a block of commands called `loop` that is executed repeatedly (in a "loop"). That block usually looks for any detected events (e.g. keystrokes on a computer or shaking of a phone) and responds with something useful (e.g. shows a character or turns on a light). Frequently this type of loop is called "the event loop"._

_This program does nothing, as we have not put any commands in either of the two blocks._
</aside>

---

<figure><video src="/images/bookpics/setup_loop.mp4" muted playsinline loop></video><figcaption> When you turn on the SpinWheel, `setup()` is run once and then the `loop()` block is run repeatedly until the SpinWheel is turned off. </figcaption></figure>

<aside class="notes">
Right click on the image to play the video, and reprise the explanation from the previous slide, showing how at first only `setup` is executed and then the commands from `loop` are executed repeatedly.
</aside>

---

## Extra Elements of a SpinWheel Program

```c++
// Include extra resources and commands
// specific to the SpinWheel.
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Instruct the specific SpinWheel hardware
  // to be ready to receive instructions.
  SpinWheel.begin();
}

void loop() {

}
```

<aside class="notes">
_The SpinWheel needs a few extra functionalities to be enabled. In different languages that happens in different ways. In the case of the language used by Arduino (C++), you need the `#include` and `using` invocations. They make a lot of extra SpinWheel commands available to you. You also need to use a particular `setup` command that turns on much of the SpinWheel hardware._
</aside>

---

Make it light up:

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

void loop() {
  // Set the large LED number 0 to
  // have red=255, green=0, and blue=0 color.
  SpinWheel.setLargeLED(0, 255, 0, 0);
  // Update the currently shining LEDs
  // based on the instructions provided up to here.
  SpinWheel.drawFrame();
}
```

<aside class="notes">
_Finally, we get to remake the simple program we saw previous that just turns on one LED. Shortly we will make it a bit more interesting. Here `setLargeLED` sets the collor, and `drawFrame` heeds all previous `set` commands and updates the actual LEDs with the given colors. Be careful with semicolons, computers can be stupid about typos._
</aside>

---

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

<aside class="notes">
This diagram of LEDs and their indices is available in the booklet or on the website as well.
</aside>

---

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 0, 0);
  SpinWheel.setLargeLED(2, 255, 0, 0);
  SpinWheel.setLargeLED(7, 255, 255, 255);
  SpinWheel.setLargeLED(5, 255, 255, 255);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

<aside class="notes">
Just another interactive example to drill the idea down. Feel free to skip it.
</aside>

---

## Creating changing patterns

To begin writing more complex code, we need to introduce the idea of *variables*.
Variables allow us to store information in the program and change that information as needed.

To **define** a new variable we can add the following line to the loop block:

```c++
int which_LED = 1;
```

<aside class="notes">
_Finally, we will make something that is dynamic and changes. To track and update values that we want to change,
we will put these values in variables, e.g., a variable that contains which LED should be on. In this particular
language `int` denotes a variable that contains integer numbers._
</aside>

---

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

void loop() {
  int which_LED = 1;
  SpinWheel.setLargeLED(which_LED, 255, 0, 0);
  SpinWheel.drawFrame();
}
```

<aside class="notes">
_Compared to the previous function implementatation, this does not do anything new, but we will see how story the number of the LED in a variable lets us change that value if we wish._
</aside>

---

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

// We have to declare which_LED outside of the loop to change it every loop
int which_LED = 0; 

void loop() {

  // clear all LEDs
  SpinWheel.clearAllLEDs();
  
  // Turn on 1 LED
  SpinWheel.setLargeLED(which_LED, 255, 0, 0);
  SpinWheel.drawFrame();
  
  // change the LED to use
  which_LED = which_LED + 1;
  
  // pause the code to delay running the next loop
  delay(500);
  
}
```

<aside class="notes">
_We had to define the variable **outside** of the `loop` block in order to have it retain its value in between each `loop` run. But now, in each loop we are incrementing the value of `which_LED` and we can see how it cause the LED which is on to change when we upload it to the SpinWheel. We had to also use the `delay` function to make this happen slowly enough so that we can see it with our eyes. We also use the `clearAllLEDs` function to erase the state of the LEDs that was set up to now._
</aside>

---

<video src="/images/bookpics/brightness_loop.mp4" muted playsinline loop></video>

<aside class="notes">
Right click to get the play menu for this video.
You can reprise the previous explanation of the similar visualization: _First we have `setup` and then in each `loop` we increment `which_LED`._
</aside>

---

### Additional Programming Notes

- Only one "command" per line. This makes the code more readable.
- Command are followed by a semicolon `;`. 
- Commands tend to be some name followed by parentheses `()`.
- Inside these parentheses we put some extra information: this information can control how a command performs.

---

## Building Blocks for your Program

---

## Variables

Before processing data, we have to tell the computer to store it
in its memory. This is done using **variables**.

---

!["Variables" are like labeled shelves for information. When you need to save a number for later use, you put it in a variable of your choice. Above we have number 3 stored in the variable `a`, number 4 stored in variable `b` and the number 7 is about to be stored in a variable named `e`. We can pick the names for the variables ourselves (any sequence of letters that is not interrupted by whitespaces). <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/variables.png)

---

We will only discuss two types of variables: integers and
decimals. Other types do exist, but we won't cover them here. 

To **define** a new integer variable you need the following line in your code:

```c++
int my_special_integer = 6;

```

---

If we want to work with decimals, we use the variable type `float`
instead of `int`. The name comes from the early history of computers and is
unimportant for our purposes (how the decimal point can "float" between the digits).

```c++
float pi = 3.1415;
```

---

## Functions

In computer programming, functions are commands that take a few variables and
do something useful with them. Functions are reusable pieces of code. 

---

Here is some code that uses an example function called `max` that takes two
numbers as input and returns the larger number. The input values are also called the
**arguments** of the function.

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

---

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

The value stored in `resulting_number` in this case would be `7`. 

---

![Functions are tools provided in a given programming language that are capable of ingesting a number of parameters and producting (a.k.a "returning") some new value that depended on the input parameters. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/functions.png)

---

```c++
int number_a = 5;
int number_b = 7;
int result = max(sqrt(number_a-1) * 2, min(number_b, 2));
```

<figure><video src="/images/bookpics/calc_tree.mp4" muted playsinline loop></video><figcaption>
</figcaption></figure>

---

## Comments

```c++
// I am writing this comment to remind me
// that the next line stores the number 5
// in the variable named my_test_variable.
int my_test_variable = 5;
```

---

Based on the [Basic Structure of a Program](/basics) and [Coding Building Blocks](/progpatterns) pages.

Check out the [Programming slide deck](/slides/programming) which includes more details.



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

---

See the [Intro to Animation](/animation) and [Animations and Patterns](/animation2) pages for more.


# Sensing motion and tilt

---

<figure><video src="/images/bookpics/preloaded_tilt3.mp4" muted autoplay playsinline loop></video><figcaption>   </figcaption></figure>

---

## Simple Levels

![A toy in which the tilt can force a ball to roll in a given direction. <a class="imagecredit" href="https://commons.wikimedia.org/wiki/File:Round_maze.jpg">image credit Wikimedia</a>](/images/bookpics/round_maze.jpg)

---

<figure><img src="/images/bookpics/level_and_glass.png" style="max-width:90%"><figcaption>Bubbles rise against gravity, both in the cylinder of the level and in a glass of carbonated water.<a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a></figcaption></figure>

---

![A bubble level. <a class="imagecredit" href="https://publiclab.org/notes/mathew/10-26-2015/deploying-passive-particle-monitors">image credit Public Lab</a>](/images/bookpics/onebubble.jpg)

---

## In Two Dimensions

![A bubble level with separate sensors for each axis of tilt. <a class="imagecredit" href="https://publiclab.org/notes/mathew/10-26-2015/deploying-passive-particle-monitors">image credit Public Lab</a>](/images/bookpics/twobubble.jpg)

---

<style>
#grid2d {
  text-align: center;
  background: white;
  color: black;
}
.grid2dcontrol > input {
  width: 40px;
}
.xcom {
  color: #228e2c;
}
.ycom {
  color: #2676b3;
}
</style>

<div id= "grid2d">
<div id="vectorGrid">
<canvas class="trajectory1D" width=400 height=400></canvas>
</div>
<div id="values">
<div class="grid2dcontrol xcom">X component: <span id="xshow">0</span></div>
<div><input type="range" min="-6" max="6"  id="xvalue"></div>
<div class="grid2dcontrol ycom">Y component: <span id="yshow">0</span></div>
<div><input type="range" min="-6" max="6"  id="yvalue"></div>
<div class="grid2dcontrol">Magnitude: <span id="magshow">0</span></div>
<!--<div class="grid2dcontrol">Angle: <span id="angshow">0</span>&deg;</div>-->
</div>
</div>

<script>
function canvas_arrow(context, fromx, fromy, tox, toy) {
  var headlen = 10;
  var dx = tox - fromx;
  var dy = toy - fromy;
  var angle = Math.atan2(dy, dx);
  context.moveTo(fromx, fromy);
  context.lineTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
  context.moveTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
}

const level_tube_img = new Image();
level_tube_img.src = "/images/bookpics/level_canvas_tube.png";
const level_bubble_img = new Image();
level_bubble_img.src = "/images/bookpics/level_canvas_bubble.png";
const level_tube_img_r = new Image();
level_tube_img_r.src = "/images/bookpics/level_canvas_tube_r.png";
const level_bubble_img_r = new Image();
level_bubble_img_r.src = "/images/bookpics/level_canvas_bubble_r.png";
const v_to_path2D = document.getElementById('vectorGrid');
const ctx2D = v_to_path2D.getElementsByClassName('trajectory1D')[0].getContext('2d');
var xElement = document.getElementById("xvalue");
var yElement = document.getElementById("yvalue");
xElement.value = 2;
yElement.value = 2;
var xcurrent = 0;
var ycurrent = 0;
ctx2D.textAlign = 'center';
ctx2D.textBaseline = 'middle';

function canvas_axis(context, maxX, maxY) {
  var midX = maxX/2;
  var midY = maxY/2;
  var stepX = maxX/20;
  var stepY = maxY/20;
  context.strokeStyle='rgba(0,0,0,0.5)';
  context.lineWidth=1;
  context.moveTo(midX, 0);
  context.lineTo(midX,maxY);
  context.moveTo(0, midY);
  context.lineTo(maxX, midY);
  context.stroke();
  context.strokeStyle='rgba(0,0,0,0.1)';
  for (var i=-10; i<=10; i++) {
    context.moveTo(0,midY+i*stepY);
    context.lineTo(maxX,midY+i*stepY);
    context.moveTo(midX+i*stepX,0);
    context.lineTo(midX+i*stepX,maxY);
  }
  context.stroke();
  context.drawImage(level_tube_img,45,360, 310, 34);
  context.drawImage(level_tube_img_r,6,45, 34, 310);
}

function plot_all(){
    xcurrent = 0.8*xcurrent + 0.2*xElement.value;
    ycurrent = 0.8*ycurrent + 0.2*yElement.value;
    var x = xcurrent;
    var y = ycurrent;
    x_scale = x*20 + 200;
    y_scale = -y*20 + 200;
  
    ctx2D.clearRect(0,0,400,400);
    ctx2D.beginPath();
    canvas_axis(ctx2D, 400, 400);
    ctx2D.drawImage(level_bubble_img,x_scale-22,360, 44, 34);
    ctx2D.drawImage(level_bubble_img_r,6,y_scale-22, 34, 44);
    ctx2D.font = '14px sans';
    ctx2D.fillStyle = '#228e2c';
    ctx2D.strokeStyle = '#228e2c';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(200,y_scale);ctx2D.stroke();
    ctx2D.fillText('X = '+xcurrent.toFixed(1),x*10+200,y_scale-10*Math.sign(y));
    ctx2D.fillStyle = '#2676b3';
    ctx2D.strokeStyle = '#2676b3';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(x_scale,200);ctx2D.stroke();
    ctx2D.fillText('Y = '+ycurrent.toFixed(1),x_scale+40*Math.sign(x),-y*10+200);
    ctx2D.beginPath();
    ctx2D.strokeStyle='black';
    ctx2D.lineWidth=2;
    canvas_arrow(ctx2D,200,200,x_scale, y_scale);
    ctx2D.stroke();
    var magnitude = Math.sqrt(x*x  + y*y);
    var direction_angle = Math.atan2(y,x)/Math.PI*180;
    if (direction_angle < 0){
    	direction_angle = direction_angle + 360;
    }
    document.getElementById("xshow").innerHTML=xcurrent.toFixed(1);
    document.getElementById("yshow").innerHTML=ycurrent.toFixed(1);
    document.getElementById("magshow").innerHTML=magnitude.toFixed(1);
    //document.getElementById("angshow").innerHTML=direction_angle.toFixed(0);
}

setInterval(plot_all, 50);
</script>

---

<div id="threediv"><div id="threejsanim"></div><span id="xlenp">X component: <span id="xlen"></span></span><span id="ylenp">Y component: <span id="ylen"></span></span>Tilt back and forth:<input id="fbtilt" type="range" min="-100" max="+100" value="30">Tilt left and right:<input id="lrtilt" type="range" min="-100" max="+100">Rotate face:<input id="frotate" type="range" min="-100" max="+100"></div>

<style>
#threediv {
  text-align: center;
  width: 100%;
  font-size: 0.5em;
  transform: scale(1.5);
}
#threediv > * {
  display: block;
  margin: auto;
}
#threediv #xlenp {
  color: #228e2c;
}
#threediv #ylenp {
  color: #2676b3;
}
</style>

<script type="module">

import * as THREE from '/three/three.module.js';

import { OrbitControls } from '/three/OrbitControls.js';
 
function makeSpinWheel() {
  var outerbox = new THREE.Group();
  var box = new THREE.Group();
  var geometry = new THREE.CylinderGeometry(20,20,1,24);
  var material = new THREE.MeshPhongMaterial({color: 0x111111, transparent: true, opacity: 0.90});
  var disk = new THREE.Mesh( geometry, material );
  box.add(disk);
  var sgeometry = new THREE.CylinderGeometry(1.5,1.5,1,24);
  var sdisk = new THREE.Mesh( sgeometry, material );
  sdisk.position.set(21/1.414,0,21/1.414);
  box.add(sdisk);
  for (var i=0; i<4; i++) {
    var bgeometry = new THREE.BoxGeometry(5,1.5,5);
    var wmaterial = new THREE.MeshPhongMaterial({color: 0xbbbbbb});
    var square1 = new THREE.Mesh(bgeometry, wmaterial);
    var square2 = new THREE.Mesh(bgeometry, wmaterial);
    var x = (-1)**i;
    var z = (-1)**(i>>1);
    square1.position.set(x*10,1.25,z*10);
    square2.position.set(x*3,1.25,z*3);
    //square1.rotation.z += Math.PI/2;
    box.add(square1);
    box.add(square2);
  }
  box.rotation.y = Math.PI*3/4;
  outerbox.add(box);
  return outerbox;
}

function makeScene() {
  var scene = new THREE.Scene();
  scene.background = new THREE.Color( 0xffffff );

  var lights = [];
  lights[ 0 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 1 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 2 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 0 ].position.set( 0, 200, 100 );
  lights[ 1 ].position.set( 0, 0, 100 );
  lights[ 2 ].position.set( 0, - 200, 100 );
  
  scene.add( lights[ 0 ] );
  scene.add( lights[ 1 ] );
  scene.add( lights[ 2 ] );

  var grid = new THREE.GridHelper( 1500, 70 );
  grid.position.set(0,-100,0);
  scene.add(grid);

  return scene;
}

var camera, scene, renderer;
var box;
var arrow;
var xarrow, yarrow, zarrow;
var sphere;
var lx_glob, ly_glob;
const size = 400;
const animdiv = document.getElementById('threejsanim');
const fgtilt = document.getElementById('fbtilt');
const lrtilt = document.getElementById('lrtilt');
const frotate = document.getElementById('frotate');
const xlen = document.getElementById('xlen');
const ylen = document.getElementById('ylen');
   
function init() {
  scene = makeScene();
  
  box = makeSpinWheel();
  scene.add(box);

  arrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,0,0),
    //40, 0xf58559,
    40, 0xaaaaaa,
    10, 4
  );
  scene.add(arrow);

  xarrow = new THREE.ArrowHelper(
    new THREE.Vector3(1,0,0),
    new THREE.Vector3(0,2,0),
    40, 0x92bd80,
    10, 4
  );
  box.add(xarrow);

  yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,-1),
    new THREE.Vector3(0,2,0),
    40, 0x8fb0d3,
    10, 4
  );
  box.add(yarrow);

  zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,2,0),
    40, 0xf58559,
    10, 4
  );
  //box.add(zarrow);

  /*
  var sgeometry = new THREE.SphereGeometry( 3, 12, 12 );
  var smaterial = new THREE.MeshBasicMaterial( {color: 0xf58559} );
  sphere = new THREE.Mesh( sgeometry, smaterial );
  scene.add(sphere);
  */ 

  var fov = 60;
  var aspect = 2;
  var near = 0.10;
  var far = 500;
  camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera.position.z = 80;
  
  renderer = new THREE.WebGLRenderer( { antialias: true } );
  renderer.setSize( size, size/2 );
  animdiv.appendChild( renderer.domElement );

  var controls = new OrbitControls(camera, renderer.domElement);
}
 
function animate() {
  requestAnimationFrame( animate );
  const fb = fbtilt.value*Math.PI/2/100;
  const lr = lrtilt.value*Math.PI/2/100;
  const r = frotate.value*Math.PI/2/100;
  const euler = new THREE.Euler(fb,r,lr,'ZXY');
  box.setRotationFromEuler(euler);
  const g = new THREE.Vector3(0,1,0);
  const py0 = new THREE.Vector3(0,0,-1);
  const my0 = new THREE.Vector3(0,0,1);
  const y0 = new THREE.Vector3(0,0,-1).applyEuler(euler);
  const ly = y0.dot(g);
  const aly = Math.abs(ly)*40
  yarrow.setLength(aly, Math.min(10,aly), 4);
  var dy;
  if (ly > 0) {
    dy = py0;
  } else {
    dy = my0;
  }
  const px0 = new THREE.Vector3(1,0,0);
  const mx0 = new THREE.Vector3(-1,0,0);
  const x0 = new THREE.Vector3(1,0,0).applyEuler(euler);
  const lx = x0.dot(g);
  const alx = Math.abs(lx)*40
  xarrow.setLength(alx, Math.min(10,alx), 4);
  var dx;
  if (lx > 0) {
    dx = px0;
  } else {
    dx = mx0;
  }
  const pz0 = new THREE.Vector3(0,1,0);
  const mz0 = new THREE.Vector3(0,-1,0);
  const z0 = new THREE.Vector3(0,1,0).applyEuler(euler);
  const lz = z0.dot(g);
  const alz = Math.abs(lz)*40
  //zarrow.setLength(alz, Math.min(10,alz), 4);
  var dz;
  if (lz > 0) {
    dz = pz0;
  } else {
    dz = mz0;
  }
  xarrow.setDirection(dx);
  yarrow.setDirection(dy);
  //zarrow.setDirection(dz);
  /*
  const xy = x0.clone()
               .multiplyScalar(lx*40);
  xy.add(y0.clone()
           .multiplyScalar(ly*40));
  sphere.position.copy(xy);
  */
  renderer.render( scene, camera );
  lx_glob = lx;
  ly_glob = ly;
  xlen.innerHTML = Math.round(lx_glob*100)/100;
  ylen.innerHTML = Math.round(ly_glob*100)/100;
}
 
init();
animate();
 
</script>

---

![These are the three axes that the SpinWheel can detect acceleration and gravity along. In the interactive 3D diagram you can see how the vector of gravitational acceleration (in grey) is decomposed along these three axes. You can drag, ctrl+drag, or scroll on the 3D image to rotate, pan, or zoom the camera.<a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)

---

### Programming your own Tilt Sensor

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Connect to the computer, so we can read status messages.
  Serial.begin(115200);
  // Ensure the special SpinWheel hardware is working.
  SpinWheel.begin();  
}

void loop() {
  // Send a confirmation message over and over.
  Serial.println("I am working!"); 
}
```

---

### Measuring Tilt

```c++
#include "SpinWearables.h"
using namespace SpinWearables; 

void setup() {
  // Ensure all of the SpinWheel hardware is on.
  SpinWheel.begin();
}

void loop() {
  // Read all sensor data.
  SpinWheel.readIMU();

  // Save the x-axis measurement in a variable.
  int x = SpinWheel.ax*255;
}
```

---

### Responding to Tilt Along the X-axis

```c++
#include "SpinWearables.h"
using namespace SpinWearables; 

void setup() {
  // Ensure all of the SpinWheel hardware is on.
  SpinWheel.begin();
}

void loop() {
  // Read all sensor data.
  SpinWheel.readIMU();

  // Save the x-axis measurement in a variable.
  int x = SpinWheel.ax*255;

  // Turn off all LEDs.
  SpinWheel.clearAllLEDs();

  // If the tilt is in a given direction,
  // turn on the corresponding LED.
  // We only want the SpinWheel to register
  // if the tilt is sufficiently large.
  if (x > 10) {
    SpinWheel.setLargeLED(5, x, x, x);
  }
  else if (x < -10) {
    SpinWheel.setLargeLED(7,-x,-x,-x);
  }

  SpinWheel.drawFrame();
}
```

---

```c++
  if (x > 10) {
    SpinWheel.setLargeLED(5, x, x, x);
  }
  else if (x < -10) {
    SpinWheel.setLargeLED(7,-x,-x,-x);
  }
```
