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

### Mixing Colors with Pigments

If you've ever painted before, you’ve probably mixed colors on a pallet. In art class, you’ve learned about the difference between primary and secondary colors. Primary colors can be used to make all other colors (secondary colors). When painting, our primary colors are red, yellow, and blue. When we are paining, we are using the pigments in our paint to create the various colors. The idea of using pigments to create color is used in our clothes, painting our houses and even coloring our food.

(add a picture of a painting pallet or easel?)

If you wanted to make green, what colors would you use?

What ink colors does a typical printer have?

<style>
#scolortests {
  font-size: 2rem;
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
</style>
<div id="scolortests">
<div><input type="range" min="0" max="255" value="255" id="sred"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="sgreen"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="sblue"></div>
<div><span class="vis" id="sredshow">255</span><span class="spacer">+</span><span class="vis" id="sgreenshow">255</span><span class="spacer">+</span><span class="vis" id="sblueshow">255</span><span class="spacer">=</span><span class="vis" id="srgbshow">&nbsp;</span></div>
<script>
function schangeColor(){
  var complement_r = document.getElementById("sred").value;
  var complement_g = document.getElementById("sgreen").value;
  var complement_b = document.getElementById("sblue").value;
  document.getElementById("srgbshow").style["background-color"]=`rgb(${255-complement_r},${255-complement_g},${255-complement_b})`;
  document.getElementById("sredshow").innerHTML=complement_r;
  document.getElementById("sredshow").style["background-color"]=`rgb(${255-complement_r},255,255)`;
  document.getElementById("sgreenshow").innerHTML=complement_g;
  document.getElementById("sgreenshow").style["background-color"]=`rgb(255,${255-complement_g},255)`;
  document.getElementById("sblueshow").innerHTML=complement_b;
  document.getElementById("sblueshow").style["background-color"]=`rgb(255,255,${255-complement_b})`;
}
document.getElementById("sred").oninput = schangeColor;
document.getElementById("sgreen").oninput = schangeColor;
document.getElementById("sblue").oninput = schangeColor;
schangeColor();
</script>
</div>


|   		| Pigments	| Digital displays	
|---		|---	|---			|
|Components     	|Red, yellow, blue	|Red, green, blue  	 
|White   	|No components  	|All components   	
|Black   	|All components  	|No components  	  


### Mixing Colors Digitally 

When we make colors digitally, such as the colors you see on this webpage, color mixing works differently. Here we create colors with an LED display. These displays works differently than when we color with pigments. The widget below shows the three digital primary colors, which we can combine in amounts from 0 to 255. Looking at the widget below, notice how with all three slide bars at 255, the box at the right is white. By adjusting the relative amount of green, red, and blue using the slide bars, you can change the color displayed.

<style>
#acolortests {
  font-size: 2rem;
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
</style>
<div id="acolortests">
<div><input type="range" min="0" max="255" value="255" id="ared"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="agreen"><span class="spacer"></span><input type="range" min="0" max="255" value="255" id="ablue"></div>
<div><span class="vis" id="aredshow">255</span><span class="spacer">+</span><span class="vis" id="agreenshow">255</span><span class="spacer">+</span><span class="vis" id="ablueshow">255</span><span class="spacer">=</span><span class="vis" id="argbshow">&nbsp;</span></div>
<script>
function achangeColor(){
  var r = document.getElementById("ared").value;
  var g = document.getElementById("agreen").value;
  var b = document.getElementById("ablue").value;
  document.getElementById("argbshow").style["background-color"]=`rgb(${r},${g},${b})`;
  document.getElementById("aredshow").innerHTML=r;
  document.getElementById("aredshow").style["background-color"]=`rgb(${r},0,0)`;
  document.getElementById("agreenshow").innerHTML=g;
  document.getElementById("agreenshow").style["background-color"]=`rgb(0,${g},0)`;
  document.getElementById("ablueshow").innerHTML=b;
  document.getElementById("ablueshow").style["background-color"]=`rgb(0,0,${b})`;
}
document.getElementById("ared").oninput = achangeColor;
document.getElementById("agreen").oninput = achangeColor;
document.getElementById("ablue").oninput = achangeColor;
achangeColor();
</script>
</div>

Take a moment to play around with these and see if you can make your favorite color!

Did you notice how if you put the amount of blue at 0, but leave the red and green at 255 that you make yellow? This is different than mixing colors with paint!

The reason this works has to do with how our eyes detect light and how our brains turn that into the image of the world that we see. To explore this more, go through the Biology of Sight Adventure.


(Code to change color of LED on SpinWheel goes here)

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

(To do: Add widget where the properties of a wave can be changed. When the wavelength changes have the wave change color, potentially add the sine function)

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
