---
title: The SpinWheel Field Guide
keywords: spinwheel, STEM, science, science and art, physics, computer science, middle school, high school, textbook
header-video: /images/banners/linewheel_crossfade.mp4
nocomments: nocomments
---

::: warning :
This is only a scaffolding for the (printed and electronic) textbook that will be developed as part of the project.

Many of our activities and lessons have interactive widgets. Not all of these currently work in all browsers (particularly Safari and on phones). We are actively working on ensuring that all interactive elements are enjoyable across platforms.
:::

Welcome to the table of contents for the SpinWheel! We hope you enjoy learning to use the SpinWheel for yourself. 

<style>
@font-face {
  font-family: 'xkcd';
  src: url('/xkcd-script.ttf')  format('truetype');
}

:root {
  /* Change this to change the appearance of the hexaons */
  --hex-width: 150px; 
  --hex-inner-border: 15px;
  
  /* Other hexagon dimentions */
  --hex-side: calc(var(--hex-width)/2);
  --hex-height: calc(var(--hex-side)*1.7320508075688772);
  --hex-tiptotip: calc(var(--hex-side)*3 - var(--hex-inner-border)*0.75);
  --hex-transition: all .2s ease;
}

/* Hexagons */
.hexagon-container {
  display: grid;
  grid-template-columns: var(--hex-tiptotip) var(--hex-tiptotip) var(--hex-tiptotip) var(--hex-tiptotip);
  grid-auto-rows: calc(var(--hex-height)/2 - var(--hex-inner-border)*1.7320508075688772/8);
  grid-gap: 0 0;
  font-family: xkcd;
}
.hexagon {
  align-items: center;
  cursor: pointer;
  display: flex;
  height: var(--hex-height);
  justify-content: center;
  position: relative;
  transition: var(--hex-transition);
  width: var(--hex-width);
}

.hexagon:nth-child(8n + 5),
.hexagon:nth-child(8n + 6),
.hexagon:nth-child(8n + 7),
.hexagon:nth-child(8n + 8) {
  margin-left: calc(var(--hex-side) * 1.5 - var(--hex-inner-border)*0.375);
}

.hexagon {
  clip-path: polygon(75% 0, 100% 50%, 75% 100%, 25% 100%, 0 50%, 25% 0);
}

.hexagon * {
  display: block;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: var(--hex-transition);
  clip-path: polygon(75% 0, 100% 50%, 75% 100%, 25% 100%, 0 50%, 25% 0);
  background-color: white;
}

.hexagon a {
  text-align: center;
  line-height: 18px;
  font-size: 16px;
  text-decoration: none;
}

.hexagon *:hover {
  background-color: white !important;
  font-size: 18px !important;
}

.hexagon > * {
  width: calc(var(--hex-width) - var(--hex-inner-border));
  height: calc(var(--hex-height) - var(--hex-inner-border)*1.7320508075688772/2);
}

.hexagon > div > div {
  width: calc(var(--hex-width) - 1.8*var(--hex-inner-border));
  height: calc(var(--hex-height) - 1.8*var(--hex-inner-border)*1.7320508075688772/2);
}

.hexagon > div > div > a {
  width: calc(var(--hex-width) - 2.1*var(--hex-inner-border));
  height: calc(var(--hex-height) - 2.1*var(--hex-inner-border)*1.7320508075688772/2);
}
</style>

<ul id="hexmap" class="hexagon-container">
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
  <li class="hexagon"></li>
</ul>

<script>
const tiles = [
{x:1, y:2, bgcolor:"#ffffff", textcolor:"#bf1e2e", bordercolor:"#bf1e2e", inner: true, text:"Getting<br>Started<br>with the<br>SpinWheel", href:"/intro"},
{x:2, y:3, bgcolor:"#f2d2d5", textcolor:"#bf1e2e", bordercolor:"#bf1e2e", inner: true, text:"SpinWheel<br>Initial<br>Setup", href:"/quickstart"},
//light
{x:2, y:5, bgcolor:"#d0eeec", textcolor:"#13a89e", bordercolor:"#13a89e", inner: true, text:"Mixing<br>Color with<br>Light", href:"#"},
{x:1, y:6, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: true, text:"Biology of<br>Sight", href:"/sight"},
{x:1, y:7, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: false, text:"Color<br>Theory", href:"/colortheory"},
{x:1, y:5, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: false, text:"Light and<br>Color", href:"/lightandcolor"},
//basic prog
{x:2, y:4, bgcolor:"#d3eef9", textcolor:"#25aae1", bordercolor:"#25aae1", inner: true, text:"Customizing<br>the SpinWheel&#39;s<br>Display", href:"#"},
{x:2, y:6, bgcolor:"#d3eef9", textcolor:"#25aae1", bordercolor:"#25aae1", inner: true, text:"Arduino<br>101", href:"/arduino101"},
{x:3, y:5, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: false, text:"Basic<br>Structure<br>of a<br>Program", href:"/basics"},
//animations
{x:3, y:3, bgcolor:"#d2e2f0", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Creating<br>Animations<br>with the<br>SpinWheel", href:"#"},
{x:3, y:2, bgcolor:"#d2e2f0", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: false, text:"Coding<br>Building<br>Blocks", href:"/progpatterns"},
{x:3, y:4, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Intro to<br>Animations", href:"/animation"},
{x:4, y:5, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Animations<br>and<br>Patterns", href:"/animation2"},
//motion
{x:4, y:7, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Make a<br>Step Counter", href:"/stepcounter"},
{x:3, y:8, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Vectors<br>and<br>Motion", href:"/vectors"},
{x:4, y:9, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Dancing<br>with<br>Color", href:"/dancing"},
{x:4, y:8, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Inertial<br>Reference<br>Frames", href:"/inertia"},
{x:4, y:10, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Rotation<br>and<br>Circular<br>Motion", href:"/rotation"},
//magnetism
{x:3, y:10, bgcolor:"#ffffff", textcolor:"#ef5188", bordercolor:"#ef5188", inner: true, text:"Make a<br>Compass", href:"/compass"},
{x:3, y:11, bgcolor:"#ffffff", textcolor:"#ef5188", bordercolor:"#ef5188", inner: false, text:"Magnetism", href:"/magnetism"},
//reference
{x:4, y:1, bgcolor:"#fdded4", textcolor:"#f1592b", bordercolor:"#f1592b", inner: false, text:"SpinWheel<br>Functions<br>Reference", href:"/allcommands"},
];
const hexmap = document.getElementById("hexmap");
const allhexes = hexmap.getElementsByClassName("hexagon");
for (const tile of tiles) {
  const hex = allhexes[(tile.x-1)+4*(tile.y-1)];

  hex.style["background-color"] = tile.bordercolor;
  var innerHTML = `<a href="${tile.href}" style="color:${tile.textcolor};background-color:${tile.bgcolor}">${tile.text}</a>`;
  if (tile.inner==true) {
    innerHTML = `<div style="background-color:${tile.bgcolor}"><div style="background-color:${tile.bordercolor}">${innerHTML}</div></div>`;
  }
  hex.innerHTML = innerHTML;
}
</script>

The concept map above illustrates how we see the online lessons 
and adventures (unfilled hexagons) being connected 
to the chapters in the paper field guide (filled hexagons). 
We have both adventures that make use of the SpinWheel 
(double-lined hexagons) 
and lessons that explore in more depth the concepts 
behind the SpinWheel (single-lined hexagons). 
Some adventures, like "Biology of Sight," 
directly extend material in the paper field guide, 
while others, like "Dancing with Color," 
are completely new and will help you use the SpinWheel in even more exciting ways. 
While the paper book isn't necessary, 
the material contained complements that of the online resources.  

There is a lot going on in the map above, 
so below we have our recommended order for completing the lessons and adventures. 
However, this is just a recommendation! 
Depending on which activities you are excited by 
and your comfort with programming, then you may skip around.

You’ll notice as you are reading that we reference other material as we go. 
Jump around between the lessons and adventures. 
Don’t worry if the first time you read a page you don’t understand everything. 
By revisiting it, you will gain even more from the page. 
This may be a new way of learning and feel uncomfortable at first. 
However, it will get much more natural and empowering as you progress. 
Moreover, you will be learning a whole new way of learning, 
the way engineers and scientists both learn and create new knowledge.

## Getting Started

These two pages provide the essentials to get started programming your SpinWheel. 
If you have coding experience, we still recommend doing the [Initial Setup Guide](/quickstart) before jumping into any of the adventures.

1. [Getting Started with the SpinWheel](/intro): Before you download the software for programming your SpinWheel, try out this page to get your first taste of how to control the SpinWheel's LEDs. 
2. [Initial Setup Guide](/quickstart): This is where we explain how to set up your SpinWheel, download the Arduino software and provide essential information for the rest of the adventures.

## Intro Adventures

These adventures assume that you have no coding experience and are a great way to become comfortable with both the SpinWheel and coding. The associated lessons go into more depth on the concepts that are referenced for the first time in these adventures. We have written the lessons to supplement the content in the adventures and we provide links in each adventure when we recommend checking them out to learn more. We hope these will spark your curiousity to learn even more about the world around you!

1. [Biology of Sight](/sight)
2. [Intro to Animation](/animation)
3. Stroboscopes and Stroboscopic Photography (planned)

### Associated Lessons
1. [Light and Color](/lightandcolor)
2. [Color Theory](/colortheory)
3. [Basic Structure of a Program](/basics)


## Intermediate Adventures

These activities build on the ideas presented in the introductory adventures. If you have coding experience, you can jump right in and then refer back to the earlier adventures and lessons as you have questions.

1. [Animations and Patterns](/animation2)
2. [Make a Step Counter](/stepcounter)

### Associated Lessons
1. [Coding Building Blocks](/progpatterns)
2. [Arduino 101](/arduino101) 
3. [Vectors and Motion](/vectors)
5. Inertial Reference Frames / Free Fall (planned)
6. Physical Computing (planned)

## Advanced Adventures

These are the most challenging SpinWheel activities. We recommend completing at least one earlier adventure before trying them out. If you have completed the other adventures, then you should be able to jump into any of these. 

1. [Dancing with Color](/dancing)
2. Compass (planned)
3. [Recurrent Neural Networks for Gesture Recognition](/rnn)

### Associated Lessons
1. [Rotation and Moving in Circles](/rotation)
2. Magnetism (planned)
3. Electricity (planned)
4. Neural Networks (planned)

## Appendix

Here's a [list of the commands](/allcommands) for controlling the SpinWheel's LEDs. While this has been written for those who are discovering coding for the first time, it can also be used as a reference to create your own SpinWheel designs if you are comfortable with programming. We recommend using it as a reference as you are going through the adventures, either way!

Throughout this guide we use a number of text formatting tools to bring attention to important conceps. Footnotes (actually hovernotes) are visible when you hover <span class="footnote">over dotted text like this<span>Such hovernotes frequently carry interesting additional information.</span></span>.
Further reading blocks look as follows:

::: further-reading
These boxes denote additional sources of information you might be interested in, either on our own website or elsewhere on the web.
:::

On a few occasions we have warning blocks:

::: warning
These denote important considerations about health and device care that should be seen before attempting an activity.
:::

We have a variety of interactive visualizations throughout these pages, that work well on desktop browsers like Firefox and Chrome. Lastly, we have many [code examples](/basics) in pages that explain how to program the device, [including some interactive simulations of the device with which you can play directly from the browser](/allcommands).


## Engineer’s Diary

Want to learn more about how the SpinWheel was created? We'll be adding additional lessons about designing the SpinWheel to empower you to design your own electronic creations!

1. [Behind the Scenes Overview](/behindthescenes_long/)
2. [Technical Specifications](/specs)
3. [Creating the Virtual SpinWheel](/transpile)
4. Circuit Design
5. Hardware Testing
6. Kickstarter Setup and Manufacturing Partner

## Community Rules

We are excited to provide you with this adventure guide, to be your companion on your journey of exploration with the SpinWheel. Each adventure and lesson includes a comment section in which you are encouraged to ask questions or help other adventurers understand the world around them. Comments will be moderated by our volunteers, so we ask you to be polite and helpful and to expect the same from others.

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
