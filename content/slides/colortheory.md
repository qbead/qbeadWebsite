---
title: Color Theory
keywords: color, light, electromagnetism, color theory, pigments, art
---

![Many bright minds of our civilization have studied the science behind colors in the pursuit of art.<a class="imagecredit" href="https://www.pikrepo.com/flrza/assorted-paint-kit">image credit Pikrepo</a>](/images/bookpics/assorted_paint_kit.jpg "image credit to Pikrepo"){width=50%}

---

## Perceiving Color

![An artistic rendering of a close-up of the back of the eye illustrating the rods (black) and cones (triangles colored by type). <a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">image credit Jack Hegarty</a>](/images/bookpics/rods_cones.png "Close-up cartoon of rods and cones in an eye"){width=50%}

---

## Mixing Colors With Light Sources

![An up-close picture of a computer screen, showing the red, green, and blue light sources, making up the white background. These sources, or subpixels, are so close together that from a distance we see them as overlapping and observe only their mixture.<a class="imagecredit" href="https://commons.wikimedia.org/wiki/File:LCD_Pixels_Macro.jpg">image credit Wikimedia</a>](/images/bookpics/lcd_pixels_macro.jpg "An up-close picture of a computer screen, showing the red, green, and blue subpixels, making up the white background"){width=50%}

---

<style>
#acolortests {
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

Imagine a white ball (i.e. a ball that reflects all of the colors of light falling on it) in a dark room. We shine three lights on it, with different intensity: a red, a green, and a blue light. If we shine them all together, the ball reflects them all and see a white color. Take a moment to play around with these and see if you can make your favorite color! You can see this illuminated ball below the sliders.
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

---

## Mixing Colors with Pigments


|Primary Pigment Color<br>(a.k.a. subtractive)  | Complemented by Primary Light Color<br>(a.k.a. additive)
|---    |---    
|Cyan<br>(absorbs red and reflects green and blue) | Red
|Magenta<br>(absorbs green and reflects red and blue) | Green
|Yellow<br>(absorbs blue and reflects red and green) | Blue

---

<style>
#scolortests {
  font-size: 2rem;
}
#scolortests .explain {
  font-size: 1rem;
  width: 80%;
  margin: 0 auto;
}
#scolortests input {
  width: 20%;
  margin: 0;
}
#scolortests span {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
}
#scolortests .spacer {
  width:5%;
}
#scolortests .vis {
  width: 20%;
  height: 2em;
  line-height: 2em;
  border: solid 1px;
  border-color: black;
  color: black;
}
#sredshow {border-color: cyan !important;}
#sgreenshow {border-color: magenta !important;}
#sblueshow {border-color: yellow !important;}
#scolortests .svganim {
  text-align: center;
  width: 200px;
  height: 200px;
  margin: 0 auto;
  position: relative;
}
#scolortests .svganim > span {
  border-radius: 50%;
  width: 100px;
  height: 100px;
  position: absolute;
  mix-blend-mode: multiply;
}
#scolortests .svganim > #mblob {
  left: 50px;
  top: 30px;
  border-radius: 32% 58% 69% 43% / 48% 32% 59% 55%;
}
#scolortests .svganim > #cblob {
  left: 40px;
  top: 40px;
  border-radius: 38% 62% 63% 37% / 41% 44% 56% 59%;
}
#scolortests .svganim > #yblob {
  left: 60px;
  top: 40px;
  border-radius: 31% 45% 74% 35% / 38% 56% 51% 87%;
}
</style>
<div id="scolortests">
<div class="explain">
Imagine a white sheet of paper (reflecting all colors of white light) on which we add pigments that absorb some colors. That would be cyan (absorbing red and reflecting green and blue), magenta (absorbing green), and yellow (absorbing blue). Adding up these pigments leads to absorbing all colors and reflecting none, making the page black. You can see what the sheet of paper would look like below the sliders.
</div>
<div><input type="range" min="0" max="255" value="255" id="sred"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="sgreen"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="sblue"></div>
<div><span class="vis" id="sredshow">255</span><span class="spacer">+</span><span class="vis" id="sgreenshow">255</span><span class="spacer">+</span><span class="vis" id="sblueshow">255</span><span class="spacer">=</span><span class="vis" id="srgbshow">&nbsp;</span></div>
<div class="svganim"><span id="cblob"></span><span id="yblob"></span><span id="mblob"></span></div>
<script>
function schangeColor(){
  var complement_r = document.getElementById("sred").value;
  var complement_g = document.getElementById("sgreen").value;
  var complement_b = document.getElementById("sblue").value;
  document.getElementById("srgbshow").style["background-color"]=`rgb(${255-complement_r},${255-complement_g},${255-complement_b})`;
  document.getElementById("sredshow").innerHTML=complement_r;
  document.getElementById("sredshow").style["background-color"]=`rgb(${255-complement_r},255,255)`;
  document.getElementById("cblob").style["background-color"]=`rgb(${255-complement_r},255,255)`;
  document.getElementById("sgreenshow").innerHTML=complement_g;
  document.getElementById("sgreenshow").style["background-color"]=`rgb(255,${255-complement_g},255)`;
  document.getElementById("mblob").style["background-color"]=`rgb(255,${255-complement_g},255)`;
  document.getElementById("sblueshow").innerHTML=complement_b;
  document.getElementById("sblueshow").style["background-color"]=`rgb(255,255,${255-complement_b})`;
  document.getElementById("yblob").style["background-color"]=`rgb(255,255,${255-complement_b})`;
}
document.getElementById("sred").oninput = schangeColor;
document.getElementById("sgreen").oninput = schangeColor;
document.getElementById("sblue").oninput = schangeColor;
schangeColor();
</script>
</div>
 	  
---

![The [halftone technique](https://en.wikipedia.org/wiki/Halftone) is a good example of this, where microscopic dots of different sizes and colors are used to make the illusion of a smooth color at a distance. <a class="imagecredit" href="https://en.wikipedia.org/wiki/File:Halftoningcolor.svg">image credit Wikimedia</a>](/images/bookpics/halftone.png "The halftone technique.")
