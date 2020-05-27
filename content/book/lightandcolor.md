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

If you wanted to make green, what colors would you use?

What ink colors does a typical printer have?

(Insert widget about Adding reflective/absorptive color pigments together (widget))


|   		|**Pigments**	| **Digital displays**	
|---		|---	|---			|
|Components     	|Red, yellow, blue	|Red, green, blue  	 
|White   	|No components  	|All components   	
|Black   	|All components  	|No components  	  


### Mixing Colors Digitally 

When we make colors digitally, such as the colors you see on this webpage, color mixing works differently. Here we create colors with an LED display. These displays works differently than when we color with pigments. The widget below shows the three digital primary colors, which we can combine in amounts from 0 to 255. Looking at the widget below, notice how with all three slide bars at 255, the box at the right is white. By adjusting the relative amount of green, red, and blue using the slide bars, you can change the color displayed.

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

Waves
A wave is a repetitive motion traveling through a medium. Some examples are shown in the table below.

|**Type of Wave**  		|**Medium**
|---		|---	|---		
|Ocean wave     	|Water	 
|Sound wave   	|Air  	
|Light   	|?

Interestingly, a wave can travel long distances without needing the medium itself to travel that full distance. For instance, the crests of an ocean wave can be ridden all the way to the shore, but very little of the water actually travels along, water mainly moves up and down at the same location. Similarly, when we hear a sound, our ears are detecting vibrations in nearby air, not air that traveled a long distance. 

(some pictures might be very helpful here)
 	  

