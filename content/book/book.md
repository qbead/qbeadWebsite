---
title: The SpinWheel Field Guide
keywords: spinwheel, STEM, science, science and art, physics, computer science, middle school, high school, textbook
header-video: /images/banners/linewheel_crossfade.mp4
nocomments: nocomments
---

::: warning :
This is only a scaffolding for the (printed and electronic) textbook that will be developed as part of the project.
:::

Welcome to the table of contents for the SpinWheel! We hope you enjoy the adventures (hands-on activities that use the SpinWheel) and associated lessons. 

The concept map illustrates how we see the lessons and adventures being connected. Follow the arrows to see potential orders for completing them. If words on the map are overlapping, then you can drag the map around to better see how the different adventures and lessons are connected.  

<script src="/jquery.min.js"></script>
<script src="/springy/springy.js"></script>
<script src="/springy/springyui.js"></script>

<script>
var graphJSON = {
  "nodes": [
    "Quick Start",
    "Biology of Sight",
    "Stroboscope",
    "Animations and Patterns",
    "Step Counter",
    "Dancing Companion",
    "Compass",
    "Programming Patterns",
    "Light and Color",
    "Color Theory",
    "Inertial Reference Frames",
    "Rotation",
    "Magnetism",
    "Vectors and Kinematics"
  ],
  "edges": [
    ["Quick Start", "Biology of Sight"],
    ["Quick Start", "Stroboscope"],
    ["Quick Start", "Animations and Patterns"],
    ["Biology of Sight", "Light and Color"],
    ["Light and Color", "Color Theory"],
    ["Animations and Patterns", "Step Counter"],
    ["Animations and Patterns", "Programming Patterns"],
    ["Programming Patterns", "Dancing Companion"],
    ["Dancing Companion", "Compass"],
    ["Compass", "Magnetism"],
    ["Dancing Companion", "Inertial Reference Frames"],
    ["Dancing Companion", "Vectors and Kinematics"],
    ["Vectors and Kinematics", "Rotation"],
    ["Step Counter", "Inertial Reference Frames"],
  ]
};

jQuery(function(){
  var graph = new Springy.Graph();
  graph.loadJSON(graphJSON);

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


Are you looking for a suggestion of where to start? Below we have our recommended order. However, this is just a recommendation! Depending on which activities you are excited by and your comfort with programming, then you may jump around.

## Getting Started

Before doing anything else, we encourage you to read the [Quick Start Guide](/quickstart). This is where we explain how to download the Arduino software and provide essential information for the rest of the adventures.

To learn the basics of controlling the LEDs, then check out our [SpinWheel Programming Reference](/basics). While this has been written for those who are discovering coding for the first time, it can also be used as a reference to create your own SpinWheel designs if you are comfortable with programming. We recommend using it as a reference as you are going through the adventures, either way!

## Intro Adventures

These adventures assume that you have no coding experience and are a great way to become comfortable with both the SpinWheel and coding. The associated lessons go into more depth into concepts that are referenced for the first time in these adventures. We have written the lessons to supplement the content in the adventures and we provide links in each adventure when we recommend checking them out to learn more. We hope these will spark your curiousity to learn even more about the world around you!

1. [Biology of sight](/sight)
2. [Animations and patterns](/animation)
3. Stroboscope and stroboscopic photography (planned)

### Associated Lessons
1. [Light and Color](/lightandcolor)
2. [Color Theory](/colortheory)
3. [Programming Patterns](/progpatterns)
4. Physical Computing (planned)


## Intermediate Adventures

These activities build on the ideas presented in the introductory adventures. If you have coding experience, you can jump right in and then refer back to the earlier adventures and lessons as you have questions.

1. [Make a step counter](/stepcounter)
2. Dancing companion (planned)

### Associated Lessons
1. [Vectors and Kinematics](/vectors)
2. [Rotation](/rotation)
3. Inertial reference frames / Free fall (planned)

## Advanced Adventures

These are the most challenging SpinWheel activities. We recommend completing at least one earlier adventure before trying them out. If you have completed the other adventures, then you should be able to jump into any of these. 

1. Compass (planned)
2. [Recurrent Neural Networks for Gesture Recognition](/rnn)

### Associated Lessons
1. Magnetism (planned)
2. Electricity (planned)
3. Neural Networks (planned)



## Engineer’s Diary

Want to learn more about how the SpinWheel was created? We'll be adding additional lessons about designing the SpinWheel to empower you to design your own electronic creations!

1. Circuit Design
2. Hardware Testing
3. Kickstarter Setup and Manufacturing Partner

## Community Rules

We are excited to provide you with this adventure guide, to be your companion on your journey of exploration with the SpinWheel. Each adventure and lesson includes a comment section in which you are encouraged to ask questions or help other adventurers understand the world around them. Comments will be moderated by our volunteers, so we ask you to be polite and helpful and to expect the same from others.


