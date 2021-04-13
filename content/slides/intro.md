---
title: Getting Started with the SpinWheel
keywords: spinwheel, physical computing, arduino, color, programming
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

Based on the [Getting Started](/intro) and [Initial Setup](/quickstart) pages.

# Setting up the SpinWheel

---

## Setting up the SpinWheel

See [spinwearables.com/quickstart](https://spinwearables.com/quickstart/) for details.

---

![The SpinWheel has four main components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device). <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/unboxing.small.png "Unboxing the device.")

--- 

1. The battery of your Spinwheel might not be attached when you receive it. Before attaching the battery, slide the switch on the back of the SpinWheel to be on "USB." Then firmly insert the battery connector into the battery jack on the circuit board. If you have difficulty, see our [Troubleshooting Guide](/troubleshoot). 

---

2. To turn on the SpinWheel, flip the switch on the back to "BAT" (for "battery"). You should see it turn on and light up brightly! 

---

3. The SpinWheel comes preloaded with several basic animations. You can press the button on the back of the SpinWheel to toggle between different animations. 

---

4. To turn off the SpinWheel, flip the switch to "USB".

---

5. To charge, plug a micro USB cable into the USB jack on the back of the SpinWheel, set the switch to "USB" and charge using a computer or USB-to-wall converter. Note: the battery may require charging before use. Reaching full charge takes approximately 1 hr.

---

## Installing [arduino.cc/en/software](https://www.arduino.cc/en/software)

<iframe src="https://www.arduino.cc/en/software" style="width:100%; height:70vh"></iframe>

We will use the Arduino programming environment, which is open and free to install.

---

Do not worry if you find this part challenging, learning new things can be confusing at first.

If you get stuck, check out the Troubleshooting Guide at [spinwearables.com/troubleshoot](https://spinwearables.com/troubleshoot/) and don't be afraid to experiment.

While feeling confused is normal, it will get easier as you go!

---

## Configuring the Arduino Software

Once the software is installed, we have to configure it to communicate with the SpinWheel.

---

1. Plug your SpinWheel into your computer with a micro USB cable and flip the switch to the position labeled "USB". 

2. Open the Arduino software. 

---

3. Open the `Tools` menu and go to `Port`. You will see a list of serial ports on your computer; select the port that corresponds to the SpinWheel. 

---

![4. Go back to the Tools menu and select `Tools → Board`. Select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the SpinWheel. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/port_and_board_screenshot.png "Use `Tools→ Port` and `Tools→ Board` to change the settings on the Arduino software.")

---

Properly selecting the board and port are essential for the Arduino software to communicate with the SpinWheel. If you are unable to upload code to the Spinwheel in the next section, double check that the switch is set to "USB" and that you have the correct board and port selected.

---

## Installing the SpinWheel Libraries

1. To get the first set of examples of this new language and the other libraries necessary to run the SpinWheel code, download our SpinWearables Arduino Library using `Sketch → Include Library → Manage Libraries...`. 
  
---

![2. In the search bar of the Library Manager, search for `SpinWearables` and then click `Install`. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/adding_libraries_screenshot.png "Installing Arduino libraries."){style="max-width:90%"}

---

## Running a Program on the SpinWheel

To test that your SpinWheel is working properly, you can install a new program, or sketch, from the example files to animate your SpinWheel. 

---

1. Choose a file to install by opening `File → Examples → SpinWearables` and picking one of the examples. 
For instance, pick [`BlinkingFirmware`](/codedoc/examples/BlinkingFirmware). This will open a new window with the code.

--- 
  
![2. Upload the code to your SpinWheel by pressing the upload button (the arrow at the top).](/images/quickstart/upload_button_screenshot.png "Upload programs to your SpinWheel using the `Upload` button (highlighted in white)."){style="width:100%"}
  
---

Now your SpinWheel will have the new colorful blinking pattern (from `BlinkingFirmware`) you just uploaded. 
If you get an error here, then check out our [Troubleshooting Guide](/troubleshoot) for help on some common problems. 

# What does it mean to program an artistic piece of electronics?

---

## What does it mean to program an artistic piece of electronics?

See [spinwearables.com/intro](https://spinwearables.com/intro/) for details.

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

---

The corresponding command in code looks like `SpinWheel.setLargeLEDsUniform(50, 255, 250)`

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

---

The corresponding command is `SpinWheel.setLargeLED(4, 255, 0, 100);`

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

---

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

---

### Turning on the Small LEDs

You can also turn on all of the small LEDs.
To do this, instead of using `SpinWheel.setLargeLEDsUniform`, 
you can use the line  
`SpinWheel.setSmallLEDsUniform`.
Like above, the three numbers represent the red, green, and blue 
components of the color you want to make.

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

At this point, you can modify the code above to create your own pattern
that uses all of the LEDs.

We encourage you to take some time to experiment with this to create your own designs.

Consider checking out:

  - [SpinWheel Initial Setup at `/quickstart`](/quickstart)
  - [Getting Started with the SpinWheel at `/intro`](/intro)
  - [SpinWheel Troubleshooting Guide at `/troubleshoot`](/troubleshoot)
  - [Arduino 101 at `/arduino101`](/arduino101)
