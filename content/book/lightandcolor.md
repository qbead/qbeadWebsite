---
title: Light and Color
keywords: color, light, electromagnetism
---

::: intro-box
In this lesson, we'll introduce the concept of colors. We will also describe how the properties of light make the colors that we see.
:::

::: warning :
This lesson is still under-development. Check back soon for more links and the full lesson!
:::

::: further-reading
todo: refer to the science of vision page, but focus on electromagnetism
:::


## Colors
Whether you're walking through a lush forest or art museum, our world is full of colors. Colors make a painting beautiful and make our homes and schools much more fun. Colors also have practical uses such as the colors on a stoplight or color-coding your class notes. Let's explore how colors are made, mixed, and emerge from light!

(Colorful picture goes here)

### Rainbows and White Light
Now that we've explained colors and how to mix colors, let's talk about white light and rainbows. When light travels from the Sun, or most other sources of illumination, we perceive it as lacking a hue. We call this white light. In reality, white light is a mixture of many colors of light. This mixture can be seen by using a prism to split out the different colors that make up the mixture.

(Prism picture here)

Do you see how white light goes into the prism, and the entire spectrum of colors emerges from the other side?

But what is happening here? We are witnessing the process of dispersion when we see white light spread out into its different colors. Dispersion is a property of waves, and through this process, waves are separated by their wavelengths.  Light is a wave, and different colors of light have different wavelengths. 


(Reflection, absorption, transmission (partial, by color) (super cool widget can be added here))

When we look at an object, we see its color. But how does this happen? When the light in the room hits the object, some of the light is absorbed by the object, while the rest is reflected. If an object absorbs all colors of light except for blue, the blue light wave will reflect off of the object and travel until it hits another object. When it hits our eyes, we see the blue light and describe the object as blue. In order to see any object, some of the light must be reflected to your eye. The wavelengths of light that are reflected control what color we see.

## Light is an Electromagnetic Wave

Now we know that light is a wave. More specifically, light is an electromagnetic wave, and we will get to that later. First, let's explore the properties of a wave.

### Waves

A wave is a repetitive motion traveling through a medium. Some examples are shown in the table below.

|**Type of Wave**  |**Medium**
|---		|---		
|Ocean wave     |Water	 
|Sound wave   	|Air  	
|Light   	|?

Interestingly, a wave can travel long distances without needing the medium itself to travel that full distance. For instance, the crests of an ocean wave can be ridden all the way to the shore, but very little of the water actually travels along, water mainly moves up and down at the same location. Similarly, when we hear a sound, our ears are detecting vibrations in nearby air, not air that traveled a long distance. 

(some pictures might be very helpful here)
 	  
Waves are characterized by their frequency, wavelength, and speed. 
Wavelength describes the length of one wave. 
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
<svg width="800" height="100" viewBox="0 0 800 100"> <defs> <path id="svgwave" fill=none stroke=black stroke-width="2" transform="scale(1,1)" d="M0 50 C 40 90, 60 90, 100 50 C 140 10, 160 10, 200 50 C 240 90, 260 90, 300 50 C 340 10, 360 10, 400 50 C 440 90, 460 90, 500 50 C 540 10, 560 10, 600 50 C 640 90, 660 90, 700 50 C 740 10, 760 10, 800 50 C 840 90, 860 90, 900 50 C 940 10, 960 10, 1000 50 C 1040 90, 1060 90, 1100 50 C 1140 10, 1160 10, 1200 50 C 1240 90, 1260 90, 1300 50 C 1340 10, 1360 10, 1400 50 C 1440 90, 1460 90, 1500 50 C 1540 10, 1560 10, 1600 50 C 1640 90, 1660 90, 1700 50 C 1740 10, 1760 10, 1800 50 C 1840 90, 1860 90, 1900 50 C 1940 10, 1960 10, 2000 50 C 2040 90, 2060 90, 2100 50 C 2140 10, 2160 10, 2200 50 C 2240 90, 2260 90, 2300 50 C 2340 10, 2360 10, 2400 50 C 2440 90, 2460 90, 2500 50 C 2540 10, 2560 10, 2600 50 C 2640 90, 2660 90, 2700 50 C 2740 10, 2760 10, 2800 50 C 2840 90, 2860 90, 2900 50 C 2940 10, 2960 10, 3000 50 C 3040 90, 3060 90, 3100 50 C 3140 10, 3160 10, 3200 50 C 3240 90, 3260 90, 3300 50 C 3340 10, 3360 10, 3400 50 C 3440 90, 3460 90, 3500 50 C 3540 10, 3560 10, 3600 50 C 3640 90, 3660 90, 3700 50 C 3740 10, 3760 10, 3800 50 C 3840 90, 3860 90, 3900 50 C 3940 10, 3960 10, 4000 50 C 4040 90, 4060 90, 4100 50 C 4140 10, 4160 10, 4200 50 C 4240 90, 4260 90, 4300 50 C 4340 10, 4360 10, 4400 50 C 4440 90, 4460 90, 4500 50 C 4540 10, 4560 10, 4600 50 C 4640 90, 4660 90, 4700 50 C 4740 10, 4760 10, 4800 50 C 4840 90, 4860 90, 4900 50 C 4940 10, 4960 10, 5000 50 C 5040 90, 5060 90, 5100 50" /> </defs> <use xlink:href="#svgwave" x="0" y="0"> <animate attributeName="x" from="0" to="-200" dur="3s" repeatCount="indefinite"/> </use> </svg>
<script>
var waveSlider = document.getElementById('waveSlider');
var waveView = document.getElementById('waveView');
var waveSVG = document.querySelector("#svgwave");
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
// <!--TODO: Does not work in safari... Try setAttribute("transform")-->
function waveUpdate() {
  var t = waveSlider.value;
  waveView.innerHTML = t;
  var s = t/800;
  waveSVG.style.transform = `scale(${s},1)`;
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
For example, a wave with a frequency of 3 Hz, 
would repeat its motion 3 times in one second.
Finally, the speed of a wave describes how fast the wave moves forward.
Sound and light are both waves,
and if you've ever watched a thunderstorm you know that you see lightning flash before you hear the boom of thunder.
The speed of a sound wave is 343 m/s (meters per second),
while the speed of light is 299,792,458 m/s. 

::: Comparison
A highway spped limit of 60 miles per hour is about 27 m/s.
::: 

Now that we've described all the properties of waves, let's discuss how this relates to light and color.
If you change the wavelength of the light wave in our widget, the wave changes color. This is an analogy to real life,
because the wavelength of a light ray corresponds to its color. 

However, our eyes can only detect a small range of the possible wavelengths of light. 
This range is called the visible spectrum.
Looking at the whole spectrum of light, called the Electromagnetic spectrum, 
you can see that different wavelengths of light create microwaves that help to heat your food, and radio waves, that allow you to listen to your favorite music.
We interact with these waves in other ways, 
but we can't see microwaves or radio waves like we can see visible light. 

(Insert picture of the electromagnetic spectrum)

Finally, the question of what is an electromagnetic wave? 
Electromagnetic waves are waves, like sound waves or ocean waves. 
Instead of traveling vibrations in the air or water, they are vibrations of… it is complicated.
There are many metaphors we can use to describe the medium of electromagnetic waves.
Studying its inner workings has led to some of the greatest discoveries in Physics: general relativity and quantum mechanics.
Instead of retracing the steps of physicists over two hundred years,
we have focused on describing light, based on what we can measure about it, such as its wavelength. 

::: Electricity and Magnetism
If you are interested in learning more about electricity and magnetism, two topics related to electromagnetic waves, go to their lessons.
:::
