---
title: Dancing Companion
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>


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

# Draft

Dancing Companion

Intro bubble

In this adventure, you will explore the ways we can describe motion mathematically and code colorful representations of that math. 

Intro paragraph about the adventure

Whether you’ve watched a dance, or are a dancer yourself, you’ve seen how dancing is all about movement. Be it a pirouette, a leap, or a straight line, dancers gracefully move through space in exciting ways. Your SpinWheel can act as a dancer too! Mathematically we can represent motion in many ways too. In this lesson, we will write colorful visualizations of this math that you can see on your SpinWheel! Just as you can dance in many ways, you will learn in this lesson, that there are many ways we can mathematically describe these graceful movements. 

Line Dancing: Linear Motion

The first way we will think about motions is by moving along a line. We can move back and forth on the line but in no other direction. This is called one dimension motion. Below you can use your mouse to drag in the circle along one dimension. Think of this like a dancer moving back and forth across the stage. 

Insert animation: I imagine a box with a line through it where there is a dot on the line, and you can drag the dot back and forth. The line always stays black and visible. When the dot is dragged to the right, the box is one color (maybe blue), and when the box is dragged to the left, it is a different color (maybe peach/pink). When the dot is dragged at a greater speed, whatever color is being displayed gets brighter. Instead of a box, we could just have a thick line with a dot where the line changes colors. Idk what will look better or be easier to code

I started looking at color schemes for this page, and I really like 3 (includes Yale blue!), 1, 4, 5,7
https://graphicmama.com/blog/website-color-schemes/


Notice when you dragged your mouse, your screen lit up at different brightnesses and colors! Try moving your mouse faster and slower! Also, in different directions!

As you can see, when you drag the mouse faster, the line gets more colorful! How fast or slow the mouse is moving is called speed. Now, did you also notice that if you dragged the mouse forward, then backward, the overall color changed? This is because we can assign a direction to our speed, and call it velocity! In our one dimensional case left or right, or perhaps positive and negative, tell us the direction we are moving. 


We’ve talked about motion in 1-D, but we don’t live and move and dance in one-dimensional space. We’re free to go forwards and back, left and right, up and down. Instead of one line, we can represent our everyday motions by moving along three lines. We call this three dimensional (3D) motion. Maybe you’ve seen an X Y Z grid before. This is called a cartesian coordinate system. If you click a point on the animation below, you can see how we could jump to any location in space with these three lines. 

Insert animation: I am imagining a grid (I was thinking 3D, but we could move to 2D if needed) where you click on a point, and the animation draws how you move to that line in (x,y,z) coordinates. I was also hoping to display the point (x, y, z) as a title or the top corner. First, trace the x-direction in one color (maybe pink), and fill in the x coordinate in pink. Trace y in a light blue color (fill in coordinate too), and trace z in. Leave the colorful path there until another point is selected. I think the exact color depends on the color scheme!



You’re SpinWheel can do the same! Inside your SpinWheel is a motion sensor. You can program your SpinWheel to light up different colors as it moves through space like this animation. Upload this sketch to your SpinWheel and make it move or dance through 3D space. 


Similar to LED Bracelet 2-Spinwheel program that lights up different colors when moving in the X, Y, Z plan

As you move the SpinWheel around, did you notice the different colors and brightness? Just like in our one-dimensional line, could you see different colors representing directions? Now we have three lines and 6 directions to move. Did the speed you moved your SpinWheel change the brightness?

Turning: Rotational Motion
Discussion of Rotational Motion

We've talked about moving through space in line, but think back to our dancer's feet doing turn after turn or our SpinWheel dancing through space. Could there be another way to represent this motion? 

The answer is yes! There are many different ways we can describe all types of different dances! Mathematically, we could say that there are many different coordinate systems to describe motion. A dancer turning is a type of rotational motion. Instead of describing each point by drawing three separate lines, we could think of this motion in terms of points along a circle. 

In this coordinate system, we can represent points on a circle, first by describing how large the circle is, by its radius, r —then expressing how far to go along the circular path by some angle, theta. If a dancer is making small tight turns, like chaînés turns, r will be small. If a dancer is making a wide turn, an attitude or a fouetté, r would be bigger! The angle in this coordinate system describes how far along the dancer is in their turn. At the start of the turn, the angle would be small. As the turn continued, the angle would get larger. 

With this new system, we can describe points in space (or in a turn!) as (r, theta) instead of (x,y,z). In this animation, click anywhere in space to see how we could move there using this new coordinate system. This system is called polar coordinates. 

3) Animation: Very similar to 2, but move to a point in space using a polar system. Trace out to r, then sweep to an angle theta, making an arc. Leave the colorful path there until another point is selected

-Questions about using this animation

Have a gif of a dancer turning that traces out the polar angle theta

To see this coordinate system in action, upload this sketch to SpinWheel. 

Have a program where the spinwheel responds to rotational motion


The Grand Finale: Showing Off All Your Colors


You’ve explored rotational motion so far in this adventure. To see the SpinWheel “dance” and show off all its colors, upload this final sketch of the adventure. You will program the SpinWheel LEDs to light up and turn and turn like a dancer. 

Write a program where the outer edges of the SpinWheel lights up in a snake at different speeds

