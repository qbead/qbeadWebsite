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

Welcome to the table of contents for the SpinWheel! We hope you enjoy the adventures (hands-on activities that use the SpinWheel) and associated lessons. 

The concept map illustrates how we see the lessons and adventures being connected. Follow the arrows to see potential orders for completing them. If words on the map are overlapping, then you can drag the map around to better see how the different adventures and lessons are connected.  

<script src="/jquery.min.js"></script>
<script src="/springy/springy.js"></script>
<script src="/springy/springyui.js"></script>

<script>

jQuery(function(){
  var graph = new Springy.Graph();

  var quick = graph.newNode({label: "Initial Setup", color: "red"});
  var basic = graph.newNode({label: "Basic Structure of a Program"});
  var sight = graph.newNode({label: "Biology of Sight"});
  var strobe = graph.newNode({label: "Stroboscope"});
  var ani = graph.newNode({label: "Animations and Patterns"});
  var step = graph.newNode({label: "Step Counter"});
  var dance = graph.newNode({label: "Dancing Companion"});
  var compass = graph.newNode({label: "Compass"});
  var progpatterns = graph.newNode({label: "Programming Patterns"});
  var light = graph.newNode({label: "Light and Color"});
  var colortheory = graph.newNode({label: "Color Theory"});
  var inertia = graph.newNode({label: "Inertial Reference Frames"});
  var rotation = graph.newNode({label: "Rotation"});
  var magnet = graph.newNode({label: "Magnetism"});
  var vector = graph.newNode({label: "Vectors and Kinematics"});
  
  graph.newEdge(quick, basic);
  graph.newEdge(basic, sight); 
  graph.newEdge(basic, strobe);
  graph.newEdge(basic, ani); 
  graph.newEdge(sight, light); 
  graph.newEdge(light, colortheory); 
  graph.newEdge(ani, step); 
  graph.newEdge(ani, progpatterns); 
  graph.newEdge(ani, dance);
  graph.newEdge(dance, compass); 
  graph.newEdge(compass, magnet);
  graph.newEdge(step, compass);
  graph.newEdge(dance, vector); 
  graph.newEdge(vector, rotation); 
  graph.newEdge(step, inertia);

  var springy = jQuery('#springymap').springy({
    graph: graph,
    stiffnes: 200,
    repulsion: 2000,
    damping: 0.5
  });
});

</script>

<canvas id="springymap" width="800" height="600">
</canvas>


There is a lot going on in the map above, so below we have our recommended order for completing the lessons and adventures. However, this is just a recommendation! Depending on which activities you are excited by and your comfort with programming, then you may jump around.

## Getting Started

Before doing anything else, we encourage you to read the [Initial Setup Guide](/quickstart). This is where we explain how to download the Arduino software and provide essential information for the rest of the adventures.
Before writing your own programs, you might want to check what the [basic structure of a program](/basics) looks like.
Use that page to establish a vague intuition about the code and use that intuition in the first few adventures. Then go back to this page and try to read it and pages linked within again, with the new knowledge of programming you have gained.

## Intro Adventures

These adventures assume that you have no coding experience and are a great way to become comfortable with both the SpinWheel and coding. The associated lessons go into more depth into concepts that are referenced for the first time in these adventures. We have written the lessons to supplement the content in the adventures and we provide links in each adventure when we recommend checking them out to learn more. We hope these will spark your curiousity to learn even more about the world around you!

1. [Biology of Sight](/sight)
2. [Animations and Patterns](/animation)
3. Stroboscope and Stroboscopic Photography (planned)

### Associated Lessons
1. [Light and Color](/lightandcolor)
2. [Color Theory](/colortheory)
3. [Coding Building Blocks](/progpatterns)
4. Physical Computing (planned)


## Intermediate Adventures

These activities build on the ideas presented in the introductory adventures. If you have coding experience, you can jump right in and then refer back to the earlier adventures and lessons as you have questions.

1. [Make a Step Counter](/stepcounter)
2. Dancing Companion (planned)

### Associated Lessons
1. [Vectors and Kinematics](/vectors)
2. Rotation (planned)
3. Inertial Reference Frames / Free Fall (planned)

## Advanced Adventures

These are the most challenging SpinWheel activities. We recommend completing at least one earlier adventure before trying them out. If you have completed the other adventures, then you should be able to jump into any of these. 

1. Compass (planned)
2. [Recurrent Neural Networks for Gesture Recognition](/rnn)

### Associated Lessons
1. Magnetism (planned)
2. Electricity (planned)
3. Neural Networks (planned)

## Appendix

Here's a [list of the commands](/allcommands) for controlling the SpinWheel's LEDs. While this has been written for those who are discovering coding for the first time, it can also be used as a reference to create your own SpinWheel designs if you are comfortable with programming. We recommend using it as a reference as you are going through the adventures, either way!

Throughout this guide we use a number of text formatting tools to bring attention to important conceps. Footnotes (actually hovernotes) are visible when you hover <span class="footnote">over dotted text like this<span>Such hovernotes frequently carry interesting additional information.</span></span>.
Further reading blocks look as follows and

::: further-reading
denote additional sources of information you might be interested in, either on our own website or elsewhere on the web.
:::

On a few occasions we have warning blocks like

::: warning
which denote important considerations about health and device care that should be seen before attempting an activity.
:::

We have a variety of interactive visualizations throughout these pages, that work well on desktop browsers like Firefox and Chrome. Lastly, we have many [code examples](/basics) in pages that explain how to program the device, [including some interactive simulations of the device with which you can play directly from the browser](/allcommands).


## Engineer’s Diary

Want to learn more about how the SpinWheel was created? We'll be adding additional lessons about designing the SpinWheel to empower you to design your own electronic creations!

1. [Behind the Scenes Overview](/behindthescenes_long/)
2. [Technical Specifications](/specs)
3. Circuit Design
4. Hardware Testing
5. Kickstarter Setup and Manufacturing Partner

## Community Rules

We are excited to provide you with this adventure guide, to be your companion on your journey of exploration with the SpinWheel. Each adventure and lesson includes a comment section in which you are encouraged to ask questions or help other adventurers understand the world around them. Comments will be moderated by our volunteers, so we ask you to be polite and helpful and to expect the same from others.

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
