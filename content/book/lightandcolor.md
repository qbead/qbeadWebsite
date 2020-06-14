---
title: Light and Color
keywords: color, light, electromagnetism
---

::: intro-box
In this lesson, we'll talk more about the properties and how these lead to the colors that we see. 
:::

::: warning :
This lesson is still under-development. Check back soon for more links and the full lesson!
:::

::: further-reading
todo: refer to the science of vision page, but focus on electromagnetism
:::


## Lights
As you are reading this lesson, you are most likely surrounded by a variety of lights. Light emits from your computer screen and from the lights in your room. Light enters through your windows or open door. Light even comes from you refrigerator when you get a snack! You interact with light in various ways throughout your day; and while most of this light is white, some is more colorful. Some examples are street lights, the light creating the colors on this page, and the light coming from a hot stove top. In this lesson, we will explore the properties of light and how it creates the colors we see.

<!--TODO: Needs an pretty image of light(s).-->
(Colorful picture of lights goes here)

### Rainbows and White Light
Let's begin by talking about white light and rainbows. When light travels from the Sun, or most other sources of illumination, we perceive it as lacking a hue. We call this white light. In reality, white light is a mixture of many colors of light. This mixture can be seen by using a prism to split out the different colors that make up the mixture.

<!--TODO: Needs a picture of a prism with colored lights.-->
(Prism picture here)

Do you see how white light goes into the prism and the entire spectrum of colors emerges from the other side?

What is happening here? We are witnessing the process of dispersion when we see white light spread out into its different colors. Dispersion is a property of waves, and causes waves to be separated by their wavelengths. By studying the dispersion of light, and many other studies we won't discuss here, we have learned that light is an electromagnetic wave. Let's break that idea down and study the general properties of waves and then look more at electromagnetic waves.


## Light is an Electromagnetic Wave

### Waves are travelling motion

A wave is a repetitive motion traveling through a medium. Some examples are shown in the table below.

|**Type of Wave**  |**Medium**
|---		|---		
|Ocean wave     |Water	 
|Sound wave   	|Air  	
|Light   	|?

Interestingly, a wave can travel long distances without needing the medium itself to travel that full distance. For instance, the crests of an ocean wave can be ridden all the way to the shore, but very little of the water actually moves closer to shore. The water mainly moves up and down at the same location. A great example of this is when a crowd of people performs "The Wave" while at a sports event. If everyone works together, the wave can propagate throughout the entire stadium, but each individual remains in their original location, simply moving up and down when the wave passes through them. 

<!--TODO: Picture of various types of waves and maybe of people doing the wave? -->

### Properties of Waves 	  
Waves are characterized by their frequency, wavelength, and speed. 
Wavelength describes the length of one wave, or the distance between the peaks. 
You can use the widget below to change the wavelength of a wave.

<style>
#wavewidget {
  text-align: center;
}
#wavewidget .vis {
  width: 40%;
  font-size: 2rem;
  height: 4rem;
  line-height: 4rem;
  border: solid 1px;
  border-color: black;
  display: block;
  margin: auto;
  text-shadow:
    -1px -1px 0 white,
    1px -1px 0  white,
    -1px 1px 0  white,
    1px 1px 0   white;
}
</style>
<div id="wavewidget">
<div>Pick a wavelength (it fades to black beyond the visible range):</div>
<div>300nm <input style="width:80%;top:0.5rem;position:relative;" type="range" min="300" max="800" value="500" id="waveSlider"> 800nm</div>
<div><span class="vis"><span id="waveView"></span>nm</span></div>
<svg id="tagsvgwave" width="800" height="100" viewBox="0 0 800 100"> <defs> <path id="svgwave" fill=none stroke=black stroke-width="2" d="M0 50 C 40 90, 60 90, 100 50 C 140 10, 160 10, 200 50 C 240 90, 260 90, 300 50 C 340 10, 360 10, 400 50 C 440 90, 460 90, 500 50 C 540 10, 560 10, 600 50 C 640 90, 660 90, 700 50 C 740 10, 760 10, 800 50 C 840 90, 860 90, 900 50 C 940 10, 960 10, 1000 50 C 1040 90, 1060 90, 1100 50 C 1140 10, 1160 10, 1200 50 C 1240 90, 1260 90, 1300 50 C 1340 10, 1360 10, 1400 50 C 1440 90, 1460 90, 1500 50 C 1540 10, 1560 10, 1600 50 C 1640 90, 1660 90, 1700 50 C 1740 10, 1760 10, 1800 50 C 1840 90, 1860 90, 1900 50 C 1940 10, 1960 10, 2000 50 C 2040 90, 2060 90, 2100 50 C 2140 10, 2160 10, 2200 50 C 2240 90, 2260 90, 2300 50 C 2340 10, 2360 10, 2400 50 C 2440 90, 2460 90, 2500 50 C 2540 10, 2560 10, 2600 50 C 2640 90, 2660 90, 2700 50 C 2740 10, 2760 10, 2800 50 C 2840 90, 2860 90, 2900 50 C 2940 10, 2960 10, 3000 50 C 3040 90, 3060 90, 3100 50 C 3140 10, 3160 10, 3200 50 C 3240 90, 3260 90, 3300 50 C 3340 10, 3360 10, 3400 50 C 3440 90, 3460 90, 3500 50 C 3540 10, 3560 10, 3600 50 C 3640 90, 3660 90, 3700 50 C 3740 10, 3760 10, 3800 50 C 3840 90, 3860 90, 3900 50 C 3940 10, 3960 10, 4000 50 C 4040 90, 4060 90, 4100 50 C 4140 10, 4160 10, 4200 50 C 4240 90, 4260 90, 4300 50 C 4340 10, 4360 10, 4400 50 C 4440 90, 4460 90, 4500 50 C 4540 10, 4560 10, 4600 50 C 4640 90, 4660 90, 4700 50 C 4740 10, 4760 10, 4800 50 C 4840 90, 4860 90, 4900 50 C 4940 10, 4960 10, 5000 50 C 5040 90, 5060 90, 5100 50" /> </defs> <use xlink:href="#svgwave" x="0" y="0"> <animate attributeName="x" from="0" to="-200" dur="3s" repeatCount="indefinite"/> </use> </svg>
<script>
var waveSlider = document.getElementById('waveSlider');
var waveView = document.getElementById('waveView');
var waveSVG = document.querySelector("#svgwave");
var waveSVGtag = document.querySelector("#tagsvgwave");
var waveAnim = document.querySelector("#wavewidget animate");
var waveVis = document.querySelector("#wavewidget .vis");
// From Spectra Lab Report
function waveLengthToRGB(Wavelength){
    var Gamma = 0.80;
    var IntensityMax = 255;
    var factor;
    var Red,Green,Blue;
    if((Wavelength >= 380) && (Wavelength<440)){
        Red = -(Wavelength - 440) / (440 - 380);
        Green = 0.0;
        Blue = 1.0;
    }else if((Wavelength >= 440) && (Wavelength<490)){
        Red = 0.0;
        Green = (Wavelength - 440) / (490 - 440);
        Blue = 1.0;
    }else if((Wavelength >= 490) && (Wavelength<510)){
        Red = 0.0;
        Green = 1.0;
        Blue = -(Wavelength - 510) / (510 - 490);
    }else if((Wavelength >= 510) && (Wavelength<580)){
        Red = (Wavelength - 510) / (580 - 510);
        Green = 1.0;
        Blue = 0.0;
    }else if((Wavelength >= 580) && (Wavelength<645)){
        Red = 1.0;
        Green = -(Wavelength - 645) / (645 - 580);
        Blue = 0.0;
    }else if((Wavelength >= 645) && (Wavelength<781)){
        Red = 1.0;
        Green = 0.0;
        Blue = 0.0;
    }else{
        Red = 0.0;
        Green = 0.0;
        Blue = 0.0;
    };
    // Let the intensity fall off near the vision limits
    if((Wavelength >= 380) && (Wavelength<420)){
        factor = 0.3 + 0.7*(Wavelength - 380) / (420 - 380);
    }else if((Wavelength >= 420) && (Wavelength<701)){
        factor = 1.0;
    }else if((Wavelength >= 701) && (Wavelength<781)){
        factor = 0.3 + 0.7*(780 - Wavelength) / (780 - 700);
    }else{
        factor = 0.0;
    };
    // Don't want 0^x = 1 for x <> 0
    var r = Red==0.0 ? 0 : Math.round(IntensityMax * Math.pow(Red * factor, Gamma));
    var g = Green==0.0 ? 0 : Math.round(IntensityMax * Math.pow(Green * factor, Gamma));
    var b = Blue==0.0 ? 0 : Math.round(IntensityMax * Math.pow(Blue * factor, Gamma));
    return [r,g,b];
}
function waveUpdate() {
  var t = waveSlider.value;
  waveView.innerHTML = t;
  var s = t/800;
  waveSVG.style.transform = `scale(${s},1)`;
  // XXX an attempt to make it work in Safari, otherwise not needed
  waveSVGtag.style.display='inline-block';
  console.log(waveSVGtag.offsetHeight); // no need to store this anywhere, the reference is enough
  waveSVGtag.style.display=''; 
  // XXX end workaround
  waveAnim.setAttribute("to", `${-200*s}`);
  waveAnim.setAttribute("dur",`${3*s}s`);
  var rgb = waveLengthToRGB(t);
  waveVis.style["background-color"]=`rgb(${rgb[0]},${rgb[1]},${rgb[2]})`;
}
waveSlider.oninput = waveUpdate;
var totalsamples = 400;
waveUpdate();
</script>

</div>

The frequency of a wave describes how often the repetitive motion of a wave is repeated. 
We describe this motion in Hertz (Hz), which stands for the number of waves per second. 
For example, a wave with a frequency of 3 Hz 
would repeat its motion 3 times in one second.
Finally, the speed of a wave describes how fast the wave moves forward.
Sound and light are both waves with different speeds. During a thunderstorm,
you see lightning flash before you hear the boom of thunder even though both
waves started in the same location.
This is because the speed of a sound wave is 343 m/s (meters per second),
while the speed of light is 299,792,458 m/s. 


::: comparison
For comparison, a highway speed limit of 60 miles per hour is about 27 m/s.
::: 

<!--TODO: Image of a sin wave with wave length and frequency labeled.-->
(add image of both wave length and frequency for one wave)

You may have noticed that, as you changed the wavelength in the widget, the color also changed. This is because the wavelength of light controls its color with red light having a long wavelength and purple light having a shorter wavelength. Light with a wavelength between 380 and 700 nanometers  is called the visible spectrum (1 nanometer is 0.000000001 meter). This is the light that our eyes can see; but light exists outside of that range. The whole spectrum of light is called the Electromagnetic Spectrum.
Looking at this spectrum, you can see that different wavelengths of light create microwaves that help to heat your food, and radio waves that allow you to listen to your favorite music. We can't see microwaves or radio waves like we can see visible light
but we interact with these waves in other ways. 

<!--TODO: Picture of the electromagnetic spectrum.-->
(Insert picture of the electromagnetic spectrum)

### Electromagnetic Waves
Finally, if visible light is part of the Electromagnetic Spectrum, what exactly is an electromagnetic wave? 
Electromagnetic waves are waves, like sound waves or ocean waves. 
Instead of traveling vibrations in the air or water, they are vibrations of … it is complicated.
There are many metaphors we can use to describe the medium of electromagnetic waves.
Studying its inner workings has led to some of the greatest discoveries in Physics: general relativity and quantum mechanics.
Instead of retracing the steps of physicists over two hundred years,
we have focused on describing light, based on what we can measure about it, such as its wavelength. 


::: further-reading
 Electricity and Magnetism: If you are interested in learning more about electricity and magnetism, two topics related to electromagnetic waves, go to their lessons.
:::

### Light Waves and Color

Let's wrap up by discussing how light waves impact the colors we see. 

When we look at an object, we see its color. 
But how does this happen? 
The answer to this question can be explained in terms of reflection, absorption, transmission. 
When light travels through different mediums, interesting things happen. 
A neat property of light is that it travels differently through different materials. 
One example is that light travels at a different speed in the air than in water. 
Each time light travels from one material to another, it can be reflected, absorbed, or transmitted. 
When light is reflected, it bounces off the interface where the materials meet and travels in the other direction. 
When it's absorbed, the light stops traveling in the new material, and this can result in heat. 
This is why your black shirt gets hot in the sun; it absorbs a lot of light. 
Finally, light can be transmitted, which means the light keeps traveling in the new material. 

When the light in the room hits the object, some of the light is absorbed by the color pigments in the object, 
while the rest is reflected. 
If an object absorbs all colors of light except for blue, 
the blue light wave will reflect off of the object and travel until it hits another object. 
When it hits our eyes, we see the blue light and describe the object as blue. 
In order to see any object, some of the light must be reflected to your eye. 
The wavelengths of light that are reflected control what color we see.


<!--TODO: Picture of reflection and absorption.-->

::: further-reading 
To learn more about colors and how the different waelengths combine to make the colors we see, go to the lesson on [Color Theory](/colortheory).
To learn more about how our eyes percieve color, go to the lesson on the [Biology of Sight](/sight).
::: 
