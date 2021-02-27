---
title: The SpinWheel Field Guide
keywords: spinwheel, STEM, science, science and art, physics, computer science, middle school, high school, textbook
header-video: /images/banners/linewheel_crossfade.mp4
nocomments: nocomments
---

Welcome to the SpinWheel Field Guide! We hope you will enjoy learning to use the SpinWheel to uncover more about the world around you!

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

Keep reading for our recommended order for completing the lessons and adventures. However, this is just a recommendation! Depending on which activities you are excited by and your comfort with programming, you may skip around. Feel free to click on any hexagon in this diagram to navigate to any of the adventures to start exploring.

As you read, you will notice that we reference material from different lessons and adventures as we go. Don’t worry if you don't understand everything the first time you read a page. Jump around between the lessons and adventures – by moving between them, you will gain even more from each page. 
This may be a new way of learning for you and it may feel unnatural at first. However, it will become much more familiar and empowering as you progress. You’ll also be practicing a whole new way of learning - one that engineers and scientists use all the time as they solve problems and create new knowledge! 

We also provide a set of [slide decks](/slides) that educators might want to use in their lessons.

## Getting Started

These pages provide the essentials to get started programming your SpinWheel. 
If you have coding experience, we still recommend doing the [Initial Setup Guide](/quickstart) before jumping into any of the adventures.

<ol>
<li> [Getting Started with the SpinWheel](/intro): Before you download the software for programming your SpinWheel, try out this page to get your first taste of how to control the SpinWheel's LEDs. </li>
<li> [Initial Setup Guide](/quickstart): This is where we explain how to set up your SpinWheel, download the Arduino software and provide essential information for the rest of the adventures. </li>
<li> [Troubleshooting Guide](/troubleshoot): If you have problems with getting the SpinWheel to work, then first look here for advice. This has tips and tricks for using your SpinWheel. </li>
</ol>

## Intro Adventures

These adventures assume that you have no coding experience and are a great way to become comfortable with both the SpinWheel and coding. The associated lessons go into more depth on the concepts that are referenced for the first time in these adventures. We have written the lessons to supplement the content in the adventures and we provide links in each adventure when we recommend checking them out to learn more. We hope these will spark your curiousity to learn even more about the world around you!

<ol>
<li>[Biology of Sight](/sight) - if you find the learning curve too steep, you might enjoy the [Mixing Color with Light lesson from the companion booklet](/paper_booklet)</li>
<li> [Intro to Animation](/animation) - similarly, if this adventure seems too overwhelming at first, check out the [Customizing the SpinWheel&#39;s Display and Creating Animations with the SpinWheel chapters from the companion booklet](/paper_booklet)</li>
<li> [Stroboscopes and Stroboscopic Photography](/stroboscope) - using rapidly-flashing sources of light can permit us to photograph very fast objects </li>
</ol>

### Associated Lessons
<ol>
<li> [Light and Color](/lightandcolor)</li>
<li> [Color Theory](/colortheory) </li>
<li> [Basic Structure of a Program](/basics)</li>
</ol>

## Intermediate Adventures

These activities build on the ideas presented in the introductory adventures. If you have coding experience, you can jump right in and then refer back to the earlier adventures and lessons as you have questions.

<ol>
<li>[Animations and Patterns](/animation2)</li>
<li> [Make a Tilt Sensor](/tilt)</li>
<li> [Dancing with Color: Linear Motion](/dancing)</li>
<li> [Make a Step Counter](/stepcounter)</li>
</ol>

### Associated Lessons
<ol>
<li> [Coding Building Blocks](/progpatterns)</li>
<li> [Arduino 101](/arduino101) </li>
<li> [Vectors and Motion](/vectors)</li>
<li> Inertial Reference Frames / Free Fall (planned)</li>
<li> Physical Computing (planned)</li>
</ol>

## Advanced Adventures

These are the most challenging SpinWheel activities. Playing with them will be enjoyable for everyone, but to fully master them an undergrad level of understanding of CS and physics might be necessary. They build on concepts introduced in earlier adventures.

<ol>
<li> [Dancing with Color: Rotational Motion](/dancing2)</li>
<li> [Make a Compass](/compass)</li>
<li> [Recurrent Neural Networks for Gesture Recognition](/rnn)</li>
</ol>

### Associated Lessons
<ol>
<li> [Rotation and Moving in Circles](/rotation)</li>
<li> Magnetism (planned)</li>
<li> Electricity (planned)</li>
</ol>

## Appendix

### SpinWheel Commands
Here's a [list of the commands](/allcommands) for controlling the SpinWheel's LEDs. While this has been written for those who are discovering coding for the first time, it can also be used as a reference to create your own SpinWheel designs if you are comfortable with programming. We recommend using it as a reference as you are going through the adventures, either way!

### Notes about Interacting with this Guide
Throughout this guide we use a number of text formatting tools to bring attention to important conceps. Footnotes (actually hovernotes) are visible when you hover <span class="footnote">over dotted text like this<span>Such hovernotes frequently carry interesting additional information.</span></span>.
Further reading blocks look as follows:

::: further-reading
These boxes denote additional sources of information you might be interested in, either on our own website or elsewhere on the web.
:::

On a few occasions we have warning blocks:

::: warning
These denote important considerations about health and device care that should be seen before attempting an activity.
:::

We have a variety of interactive visualizations throughout these pages, that work well on desktop browsers like Firefox and Chrome. Lastly, we have many code examples in our pages that explain how to program the device, [including some interactive simulations of the device with which you can play directly from the browser](/intro).

::: warning
The virtual SpinWheel simulations and some of the other interactive widgets do not always work well on mobile devices. The Safari browser also causes issues with some visualizatons.
:::

### Engineer's Diary

Learn more about how the SpinWheel was created and running our Kickstarter on our [engineer's diary](/diary) page!

### Concept Map

This concept map illustrates how the lessons and adventures are connected and build upon each other. Here you will find both sophisticated engineering adventures that use the SpinWheel directly (double-lined hexagons), along with companion lessons that further explore some of the key concepts you’ll encounter in the adventures (single-lined hexagons).

The three shaded hexagons are gentler introductory lessons found only in the [paper booklet](/paper_booklet/). Feel free to skip them and jump directly into the adventures. We do recommend skimming through them if this is the first time you have attempted to write a program.


<ul id="hexmap2" class="hexagon-container">
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
{x:1, y:1, bgcolor:"#ffffff", textcolor:"#fffff", bordercolor:"#ffffff", inner: false, text:"Begin Here ➘", href:""},
{x:2, y:3, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: true, text:"SpinWheel<br>Initial<br>Setup", href:"/quickstart"},
{x:2, y:2, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: true, text:"SpinWheel<br>Troubleshooting<br>Guide", href:"/troubleshoot"},
{x:2, y:6, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: false, text:"Arduino<br>101", href:"/arduino101"},
//light
{x:2, y:5, bgcolor:"#d0eeec", textcolor:"#13a89e", bordercolor:"#13a89e", inner: true, text:"Mixing<br>Color with<br>Light", href:"/paper_booklet"},
{x:1, y:6, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: true, text:"Biology of<br>Sight", href:"/sight"},
{x:1, y:7, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: false, text:"Color<br>Theory", href:"/colortheory"},
{x:1, y:5, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: false, text:"Light and<br>Color", href:"/lightandcolor"},
{x:1, y:8, bgcolor:"#ffffff", textcolor:"#13a89e", bordercolor:"#13a89e", inner: true, text:"Stroboscope", href:"/stroboscope"},
//animations
{x:1, y:2, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Getting<br>Started<br>with the<br>SpinWheel", href:"/intro"},
{x:2, y:4, bgcolor:"#d3eef9", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Customizing<br>the SpinWheel&#39;s<br>Display", href:"/paper_booklet"},
{x:3, y:1, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: false, text:"Basic<br>Structure<br>of a<br>Program", href:"/basics"},
{x:3, y:3, bgcolor:"#d2e2f0", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Creating<br>Animations<br>with the<br>SpinWheel", href:"/paper_booklet"},
{x:3, y:2, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: false, text:"Coding<br>Building<br>Blocks", href:"/progpatterns"},
{x:3, y:4, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Intro to<br>Animation", href:"/animation"},
{x:4, y:5, bgcolor:"#ffffff", textcolor:"#0e75bc", bordercolor:"#0e75bc", inner: true, text:"Animations<br>and<br>Patterns", href:"/animation2"},
//motion
{x:3, y:6, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Make a<br>Tilt Sensor", href:"/tilt"},
{x:3, y:8, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Make a<br>Step Counter", href:"/stepcounter"},
{x:3, y:10, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Gesture<br>recognition", href:"/rnn"},
{x:4, y:7, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Vectors<br>and<br>Motion", href:"/vectors"},
{x:4, y:6, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Dancing<br>with Color:<br>Linear<br>Motion", href:"/dancing"},
{x:4, y:8, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: true, text:"Dancing<br>with Color:<br>Rotational<br>Motion", href:"/dancing2"},
//{x:4, y:9, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Inertial<br>Reference<br>Frames", href:"/inertia"},
{x:4, y:10, bgcolor:"#ffffff", textcolor:"#9678b6", bordercolor:"#9678b6", inner: false, text:"Rotation<br>and<br>Circular<br>Motion", href:"/rotation"},
//magnetism
//{x:2, y:8, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: false, text:"Electricity", href:"/electricity"},
{x:3, y:9, bgcolor:"#ffffff", textcolor:"#ef5188", bordercolor:"#ef5188", inner: true, text:"Make a<br>Compass", href:"/compass"},
//{x:2, y:10, bgcolor:"#ffffff", textcolor:"#ef5188", bordercolor:"#ef5188", inner: false, text:"Magnetism", href:"/magnetism"},
//reference
{x:4, y:1, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: true, text:"SpinWheel<br>Functions<br>Reference", href:"/allcommands"},
//{x:4, y:3, bgcolor:"#ffffff", textcolor:"#25aae1", bordercolor:"#25aae1", inner: false, text:"Physical<br>computing", href:"/physicalcomputing"},
];

function render_hexmap(id) {
  const hexmap = document.getElementById(id);
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
}

render_hexmap("hexmap");
render_hexmap("hexmap2");

</script>

Some adventures, like [Biology of Sight](/sight), directly extend material from [the paper field guide](/paper_booklet). Others, like [Dancing with Color](/dancing), are completely new and will help you use the SpinWheel in even more exciting ways. The paper book isn’t required to get started, but it complements the online resources.

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
