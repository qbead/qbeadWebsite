---
title: Dancing Companion
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
In this adventure, you will explore the ways we can describe motion mathematically and code colorful representations of that math. 
:::

Whether you’ve watched a dance, or are a dancer yourself, you know dancing is all about movement. Be it a pirouette, a leap, or a straight line, dancers gracefully move through space in exciting ways. Your SpinWheel can act as a dancer too! Mathematically we can represent this motion in many ways. In this lesson, we will write colorful visualizations of this math that you can explore with SpinWheel!

## Linear Motion: Line Dancing

The first way we will think about motions is by moving along a line. We can move back and forth on a line but in no other direction. This is called one dimension motion. Below you can use your mouse to drag the circle along one dimension. Think of this like a dancer moving back and forth across the stage. 

# Insert animation: 

I imagine a box with a line through it where there is a dot on the line, and you can drag the dot back and forth. The line always stays black and visible. When the dot is dragged to the right, the box is one color (maybe blue), and when the box is dragged to the left, it is a different color (maybe peach/pink). When the dot is dragged at a greater speed, whatever color is being displayed gets brighter. Instead of a box, we could just have a thick line with a dot where the line changes colors. Idk what will look better or be easier to code


Notice when you dragged your mouse, your screen lit up at different brightnesses and colors! Try moving your mouse faster and slower! Also, in different directions!

As you can see, when you drag the mouse faster, the line gets more colorful! How fast or slow the mouse is moving is called speed. Now, did you also notice that if you dragged the mouse forward, then backward, the overall color changed? This is because we can assign a direction to our speed, and call it velocity! In our one dimensional case left or right, or perhaps positive and negative, tell us the direction we are moving.

## Linear motion: A Three Line Dance

We’ve talked about motion in 1-D, but we don’t live and move and dance on a single line. We’re free to go forwards and back, left and right, up and down, and even along curves. Instead of one line, we can represent our everyday motions by moving along three lines. We call this three dimensional (3D) motion. Maybe you’ve seen an X Y Z grid before. This is called a cartesian coordinate system. If you click a point on the animation below, you can see how we could jump to any location in space with these three lines. 

Insert animation: I am imagining a grid (I was thinking 3D, but we could move to 2D if needed) where you click on a point, and the animation draws how you move to that line in (x,y,z) coordinates. I was also hoping to display the point (x, y, z) as a title or the top corner. First, trace the x-direction in one color (maybe pink), and fill in the x coordinate in pink. Trace y in a light blue color (fill in coordinate too), and trace z in. Leave the colorful path there until another point is selected. I think the exact color depends on the color scheme!

You’re SpinWheel can do the same! Inside your SpinWheel is a motion sensor. You can program your SpinWheel to light up different colors as it moves through space like this animation. Upload this sketch to your SpinWheel and explore how it can dance through 3D space. 

# Test of motion simulation

After you click `Run`, grab the SpinWheel and shake it.

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  SpinWheel.readIMU();
  float ax = abs(SpinWheel.ax)*100;
  float ay = abs(SpinWheel.ay)*100;
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLEDsUniform(ax, ay, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

As you move the SpinWheel, do you notice the different colors and brightness? Just like in our one-dimensional line, could you see different colors representing directions? Now we have three lines and 6 directions to move. Did the speed you moved your SpinWheel change the brightness?

Now think about dancer's feet doing turn after turn and their arms outstretched in different configurations. Can you picture how their arms and feet move through space in small tight turns, like chaînés turns, and wide turns, like an attitude or a fouetté. There are many different ways we can describe all types of different dances mathematically! 

# Insert first dancing video here

## The Grand Finale: Showing Off All Its Colors

You’ve explored motion so far in this adventure. To see the SpinWheel “dance” and show off all its colors, upload this final sketch of the adventure. You will program the SpinWheel LEDs to light up and turn and turn like a dancer. 

Write a program where the outer edges of the SpinWheel lights up in a snake at different speeds

# insert Mariel's video here
