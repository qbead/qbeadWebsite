---
title: Ask A Scientist
keywords: sight, vision, color, biology, optical illusions, outreach, demos, activities
header-image: /images/banners/colors_and_eye.png
---

## Color Mixing with Light

Take a moment to play around with these sliders and see if you can make your favorite color!

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



## SpinWheel Simulator

You can also experiment with color mixing by coding the SpinWheel simulator below. Using the code provided here, you can make the large LEDs on the SpinWheel light up that color by editing the code and running it on the virtual SpinWheel below: 

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void setup() {
  SpinWheel.begin();
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(255, 0, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>


### Our virtual SpinWheel can even simulate motion! 

Run the code below, grab the image of the SpinWheel with your mouse, and shake it. What happened to the LEDs?

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.readIMU();
  float ax = abs(SpinWheel.ax)*100;
  float ay = abs(SpinWheel.ay)*100;
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(ax, ay, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

We still need to figure out how to present the colors in a more noticeable fashion, but your virtual SpinWheel lights up with colors infered from your virtual motion sensor. You can read more about how [we created the virtual SpinWheel here](/transpile).

If after playing with these SpinWheel simulations, you are interested in learning more about coding in Arduino, then check out our lesson on [basic coding patterns](/progpatterns). If you would like to try changing the SpinWheel simulator in more complicated ways, then check out our activity on the [biology of your eye](/sight).

If you are interested in trying this out on a physical SpinWheel, then you can read more about the SpinWheel and our project at [our website](/). We're selling the SpinWheel on the crowdfunding site [Kickstarter](https://www.kickstarter.com/projects/spinwheel/the-spinwheel-the-colorful-wearable-programming-kit) until April 30. 

::: intro-box
This page will be expanded to include more resources after the Ask A Scientist workshop that our team is hosting on April 28, 2020.
:::









