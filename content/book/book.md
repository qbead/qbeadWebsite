---
title: The SpinWheel Field Guide
keywords: spinwheel, STEM, science, science and art, physics, computer science, middle school, high school, textbook
header-video: /images/banners/linewheel_crossfade.mp4
nocomments: nocomments
---

::: warning :
This is only a scaffolding for the (printed and electronic) textbook that will be developed as part of the project.
:::

[Quick Start](/quickstart)

## Adventures

1. [Biology of sight](/sight)
2. Animations and patterns
3. [Make a step counter](/stepcounter)
4. Dancing companion
5. Compass
6. Hacker’s common tools
7. Stroboscope and stroboscopic photography

## Computer Science 101

1. Digital Electronics 
2. [Basic Programming Patterns](/progpatterns)
3. Physical Computing

## Physics 101

1. Vectors and Kinematics
2. [Rotation](/rotation)
3. Pendulums and Vibrations
4. Inertial reference frames / Free fall
5. [Light and Color](/lightandcolor)
6. [Color Theory](/colortheory)
7. Magnetism
8. Electricity

## Engineer’s Diary

1. Circuit Design
2. Hardware Testing
3. Kickstarter Setup and Manufacturing Partner

## Community Rules

We are excited to provide you with this adventure guide, to be your companion on your journey of exploration with the SpinWheel. Each adventure and lesson includes a comment section in which you are encouraged to ask questions or help other adventurers understand the world around them. Comments will be moderated by our volunteers, so we ask you to be polite and helpful and to expect the same from others.

## Map

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
    "Magnetism"
  ],
  "edges": [
    ["Quick Start", "Biology of Sight"],
    ["Quick Start", "Stroboscope"],
    ["Quick Start", "Programming Patterns"],
    ["Biology of Sight", "Light and Color"],
    ["Light and Color", "Color Theory"],
    ["Programming Patterns", "Step Counter"],
    ["Programming Patterns", "Animations and Patterns"],
    ["Animations and Patterns", "Dancing Companion"],
    ["Dancing Companion", "Compass"],
    ["Compass", "Magnetism"],
    ["Dancing Companion", "Inertial Reference Frames"],
    ["Dancing Companion", "Rotation"],
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

<canvas id="springymap" width="800" height="600" />
