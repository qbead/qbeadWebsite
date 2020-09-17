---
title: Dancing with Color<br>-Rotational Motion-
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
This adventure builds on the first Dancing with Color Adventure. You will now learn how to have the SpinWheel light up in response to rotational motion. By combining what you learned in the previous adventure with this one, you will be able to create an accessory that lights up and changes color based on the motions of a dance. 
:::

In the first part of the [Dancing with Color](/dancing) Adventure, we talked about moving through space in a line, 
but now imagine a dancer's feet doing turn after turn and their arms being outstretched in different configurations. 
Can you picture how their arms and legs move through space in small tight turns, like chaînés turns, and wide turns, like an attitude or a fouetté? 


There are many different ways we can describe dances mathematically! 
A dancer moving side to side is a type of translational motion.
A dancer turning in a circle is a type of rotational motion. 

![Notice how in tight turns or wide turns, a dancer's feet create different size circles on the floor. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_turn.png)

A simple way to describe rotational motion is as the movement around an axis. When a dancer spins, without moving around the stage, they are rotating around the axis of their body. 
There are special sensors in your SpinWheel, called gyroscopes, that allow it to detect rotational motion. 
We can use the output from these sensors to program the SpinWheel to respond to spinning! 

![This picture demonstrates the three axes that the SpinWheel can detect rotation around. We'll dive into what this means more in the rest of the lesson! <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)

## Rotation Around One Axis

To begin, we can program the SpinWheel to light up when it detects rotation around one axis. 
This is similar to the dancer spinning in place where their body represents the axis of each turn. 
In this case, we're measuring the rotation around the SpinWheel's x-axis, which is stored in the variable `SpinWheel.gx`. `SpinWheel.gx` provides us with the angular velocity of the SpinWheel around the <span class="footnote">x-axis of the device.<span>To visualize what this represents on the SpinWheel, scroll up to the image of the SpinWheel and its axes.</span></span> 

::: further-reading 
In our [Vectors and Motion](/vectors) lesson, we cover in more depth the velocity you are probably already familiar with: velocity along a straight line (like a car moving down a straight stretch of highway). 
Above we reference another type of velocity, angular velocity, which is often used for describing rotatonal motion like that of our dancer spinning or a car speeding along a circular racetrack. 
You can read our [Rotation](/rotation) lesson to learn more about angular velocity.
:::

As the SpinWheel's sensors are very sensitive to even small motions of the device, we only want to change color if the rotation is fast enough.
This ensures that the lights don't turn on when you are just holding it in your hand without intentionally moving it.
In this case, we will only have the color change `if` the absolute value of the rotation is greater than 100 degrees per second, `abs(SpinWheel.gx) > 100`. 
Below is the essential piece of code, where we tell the SpinWheel to light up only when motion is detected (`if (abs(SpinWheel.gx) > 100)` and to otherwise (`else`) turn off all of the LEDs.

```cpp
// if there is enough rotation, then light up the 
// LEDs a light blue
if (abs(SpinWheel.gx) > 100) {
  SpinWheel.setLargeLEDsUniform(0, 255, 255);
}
// otherwise, keep the LEDs turned off
else {
  SpinWheel.setLargeLEDsUniform(0,0,0);
}
```

To see your SpinWheel light up in response to rotional motion, upload the full sketch (`Examples → SpinWearables → Dancing_with_Color → 1D_Rotation_Light_Up_Basic`) to your SpinWheel and explore what happens when you rotate your SpinWheel. You can can also read more about what each command in [this 1D Rotation sketch](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Basic/1D_Rotation_Light_Up_Basic.ino.html) does.

If you prefer other colors to the light blue that we chose, then you can modify the code for this example to light up your SpinWheel a different color. 

::: further-reading
Looking for a refresher on how to customize the LEDs to light up your favorite color? In our [Biology of Sight adventure](/sight), we discuss how three light sources can be used to represent any color of the rainbow by taking advantage of how our eyes perceive color.
:::

## Changing Color with the Direction of Rotation

Now let's modify the `1D_Rotation_Light_Up_Basic` sketch to have the LEDs change color based on the direction of rotation. 
We include the important new elements of the code below, including defining new variables `pos_spin` and `neg_spin` to store the direction that the SpinWheel is rotating around the x-axis.

```cpp
// If the x rotation (gx) is big enough, then 
// change the color of the big LEDs based on the
// direction of the spin
if (SpinWheel.gx > 100) {
  pos_spin = 255;
  neg_spin = 0;
}
else if (SpinWheel.gx < -100) {
  neg_spin = 255;
  pos_spin = 0;
}
else {
  pos_spin = 0;
  neg_spin = 0;
}
// If gx is positive, set the big LEDs to light up green
// If gx is negative, set the big LEDs to light up blue
SpinWheel.setLargeLEDsUniform(0, pos_spin, neg_spin);
```

In this script, the LEDs light up green when the device is spun around the x-axis in one direction (`if (SpinWheel.gx > 100)`), and blue when spun in the other direction (`else if (SpinWheel.gx < -100)`). The `else` statment ensures that the SpinWheel's LEDs turn off when not enough rotation is detected. You can upload the sketch from: `Examples → SpinWearables → Dancing_with_Color → 1D_Rotation_Light_Up_Advanced` to give it a try on your own SpinWheel. 
For a more detailed explanation of this code, you can also check out [this script](/codedoc/examples/Dancing_with_Color/1D_Rotation_Light_Up_Advanced/1D_Rotation_Light_Up_Advanced.ino.html). 

## Modifying Animation Adventure Sketches to Respond to Motion

In the [Intro to Animation](/animation) and [Animations and Patterns](/animation2) adventures, you created animations for the SpinWheel that relied on time. It is possible to use those same sketches, but only have them change color when rotational motion is detected. For instance, check out [this version of the rainbow chase sketch](/codedoc/examples/Dancing_with_Color/Rainbow_Chase_Advanced/Rainbow_Chase_Advanced.ino.html) to see how you can use rotation around the z-axis of the SpinWheel instead of time to update the animation. You can also upload the full sketch onto your SpinWheel from here: full sketch (`Examples → SpinWearables → Dancing_with_Color → Rainbow_Chase_Advanced`. 

To get the full effect of this sketch, we recommend you unplug your SpinWheel from your computer and try spinning in a circle yourself. If you hold the SpinWheel horizontal as you turn, you'll be able to see the colors change as you're moving and stop when you stop. Just remember, when you plug the SpinWheel back into the computer to make sure the switch is back on `usb`.

::: further-reading 
Is there a difference between moving in a circular path and spinning? While we might think of these both as rotation, to the SpinWheel's sensor they aren't the same. It can only detect spinning around an axis. To try a simple experiment to confirm this for yourself, check out the very end of the [Rotation](/rotation) lesson.
:::

If you want a further challenge, try modifying another sketch from the animation adventures to respond to your motion. For instance, try modifying the [Smoother Blink](/codedoc/examples/Animations_and_Patterns/Smoother_Blink) sketch to only change color when the device spins around the y-axis.

## Rotating Lights (or an LED "snake")

One of the programs that came preloaded on your SpinWheel was an LED "snake" that spins around the device like a dancer. 
We can change that basic snake code so that it only rotates colors when you rotate the SpinWheel. 

<video src="/images/behindthescenes/circling.mp4" muted autoplay playsinline loop></video>

To create this snake, we'll introduce a new function that lights up several LEDs (making a snake): `SpinWheel.setSmallLEDsPointer(angle, red, green, and blue)`. 
`Angle` controls where your snake starts, while `red`, `green`, and `blue` control the red, green, and blue components of the small LEDs. By changing these values, you can change the color that your LED "snake" lights up and where the "head" of the snake is. 
To try modifying the snake on your SpinWheel, upload the example sketch from here: `Examples → SpinWearables → Dancing_with_Color → Motion_Snake`. 
You can also read more about our [motion snake script here](/codedoc/examples/Dancing_with_Color/Motion_Snake/Motion_Snake.ino.html) to learn more about how this script works.

You may have noticed that the "snake" currently only moves when you rotate around the x-axis. 
Can you have it respond to rotation around the other axes?  
What about making it respond to motion in all three directions? 
For a hint of how to do this, you can check out the [code for the final example of this adventure](/codedoc/examples/Dancing_with_Color/Grand_Finale/Grand_Finale.ino.html).

The past few examples all rely on the measurements from the gyroscope (rotation sensor). 
However, you could also have the snake (or any of the other sketches) respond to acceleration instead. You can modify the snake to respond to acceleration in one direction or even all three.

## Rotation in 3D Space

In the two last sketches, the SpinWheel only changed color when its rotation was around the x-axis. It is also possible to measure and change the SpinWheel's LEDs color based on rotation around any axis in 3D space!

To start off, upload the 3D rotation sketch from here: `Examples → SpinWearables → Dancing_with_Color → 3D_Rotation_Light_Up`. If you read the [details about the code](/codedoc/examples/Dancing_with_Color/3D_Rotation_Light_Up/3D_Rotation_Light_Up.ino.html), you will see how you can code the red, green, and blue components of the LEDs to respond to the rotation around the x, y, and z axes. 
Rather than only modifying the large LEDs as in the earlier sketches, this sketch also has the small LEDs light up in response to the SpinWheel's rotational motion. Try rotating your SpinWheel in different directions to make it fully red, green or blue. Can you combine these rotations to make other colors? If the rotation is around two axes at the 
same time, both colors are shown, making yellow, purple or teal.

## The Grand Finale: Showing Off All Its Colors

You’ve explored both linear and rotational motion independently so far in this adventure. Using the above scripts as a starting point, you can modify the SpinWheel to respond to your motion however you see fit! 
To inspire your imagination, we'll leave you with one final more complicated sketch that combines both the `Motion_Snake` and `Rainbow_Chase_Advanced` sketches. 
Here is a webpage with our [grand finale code and explanation](/codedoc/examples/Dancing_with_Color/Grand_Finale/Grand_Finale.ino.html). This sketch programs the SpinWheel to respond to both acceleration and rotation. To try this code on your SpinWheel or use it as a framework for your own creations, you can find it at `Examples → SpinWearables → Dancing_with_Color → Grand_Finale`.

Using the code we've presented as an inspiration, try writing your own sketch where the SpinWheel's LEDs respond to your motion! 

Here is the diagram of the SpinWheel again, if you want a reminder of what number corresponds to which LED:

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")


<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
