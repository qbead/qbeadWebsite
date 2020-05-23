---
title: Make a step counter
keywords: stepcounter, motion, acceleration
header-image: /images/banners/stepcounter.png 
---

::: intro-box
A step counter needs to detect motion,
record each time that happens,
and display the total count.
The SpinWheel has a motion sensor that can deal with the first task,
a small controller (computer) that can perform the recording,
and a number of LEDs that can be used as a display.
Here we will see how to put these features together to make our own custom step counter.
:::

To start, plug in the SpinWheel to your computer and open up an "empty" sketch in the Arduino software. If you need help remembering how to do this, you can get a recap of how to connect your SpinWheel to your computer in our ["Quick Start Guide"](/quickstart).

## Tabula Rasa

We will build our Step Counter program in this empty sketch. A good first step is to write some simple test code that just prints a few messages, confirming that the device is not broken. For instance, copy the following code that repeatedly sends the message "I am working!" to the computer to which the SpinWheel is attached. As always, we will try to add comments to the code, so that the purpose of each line is explained.

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Connect to the computer, so we can read status messages.
  Serial.begin(115200);
  // Ensure the special SpinWheel hardware is working.
  SpinWheel.begin();  
}

void loop() {
  // Send a confirmation message over and over.
  Serial.println("I am working!"); 
}
```

## Measuring Motion

Now we can begin to add useful functionality to our sketch.
The first step is to ensure that the SpinWheel can measure something related to the motion.
The function `loop` is repeatedly being called by our SpinWheel and each time that happens we want
to instruct the motion sensor to report the new values it has measured:
we do that by calling `SpinWheel.readIMU()` where IMU stands for Inertial Measurement Unit,
a fancy name for something that senses motion.

We want to measure a single number related to the overall motion of the SpinWheel,
i.e. we do not care on which of the 3 directions in space is the motion strongest.
One way to do that is to combine the values describing the motion along each direction in one single number.
Mathematicians call this "calculating the magnitude" or "calculating the norm" of a "vector".

::: further-reading
If you want to learn more about what a vector is and how they are used by mathematicians and engineers, check out our lesson on ["Vectors"](/vectors).
:::

A convenient way to get this "magnitude" would be to calculate $\sqrt{a_x^2+a_y^2+a_z^2}$,
where $a_x$ is the acceleration in the x directions and so on.
The code to do that operations looks like `sqrt(pow(SpinWheel.ax,2) + pow(SpinWheel.ay,2) + pow(SpinWheel.az,2))`.
We will save this value in the variable `total_acceleration`.

We will also send this value to the computer connected to the SpinWheel in order to confirm that everything is working. The command `Serial.print(total_acceleration)` does just that. In the Arduino software we can use `Tools -> Serial Plotter` to visualize the results.

<video src="/images/bookpics/stepcounter_nolights.mp4" muted autoplay playsinline loop></video>

Here is all this code put together:

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  Serial.begin(115200);
  SpinWheel.begin();
}

void loop() {
  SpinWheel.readIMU();
  // The "sum of the squares" is a common way to measure total ammount of
  // motion independent of direction. Mathematicians call it "the norm of
  // the vector describing the motion".
  float total_acceleration = sqrt(pow(SpinWheel.ax,2) + pow(SpinWheel.ay,2) + pow(SpinWheel.az,2));
  Serial.print(total_acceleration);
  Serial.println();
}
```

You might have noticed that we are only detecting motion; we are not actually counting steps yet. Since writing the code that turns the SpinWheel into a step counter is complicated, it is helpful to break it up into less complicated steps. Through programming the SpinWheel, we will help you learn how to split a big problem into small pieces for yourself. We hope you will find this skill useful not only when programming!

## Displaying Motion

Our next task is to change the SpinWheel's LEDs based on this motion data. Having visual feedback at each stage of our work makes it easier to detect errors in our code. We will use the `setLargeLEDsUniform` function to turn all 8 of the large LEDs on at the same time. We will use an equal mixture of red, green, and blue, in order to make them light up in white.

::: further-reading
To further explore why we can trick our brains to perceive a red, blue, and green LED really close together as white, check out the ["Biology of Sight" activity](/sight).
:::

 The intensity of each color will be proportional to the detected acceleration. However, you might have noticed that the `total_acceleration` value is 1, not 0, at rest. This is because the accelerometer cannot distinguish between the force of gravity acting on it at all times, and the forces of inertia acting on it when you shake it. To account for that, we subtract 1 from this value. This is how we obtain `kinematic_acceleration = total_acceleration - 1`. "Kinematic" is a fancy word physicists use to refer to things related to motion. We calculate intensity based on that value with `intensity = 20*kinematic_acceleration` and use it in the `setLargeLEDsUniform` function. We chose a factor of 20 in order to make the LEDs brighter.

Below you can see the code in its entirety, and <a href="#stepcounter-sim1"target="_self">at the bottom of the page</a> you can try running it on a virtual SpinWheel.

::: further-reading
There are a lot of intricate facts about motion and gravity, related to the fact that our motion sensor can not distinguish between the two. You can read more about it in the section on ["Inertial reference frames and Free fall"](./inertia), which will also explain why `total_acceleration` at rest is 1g. Einstein himself was thinking about this everyday fact when he was developing the general theory of relativity.
:::

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  Serial.begin(115200);
  SpinWheel.begin();
}

void loop() {
  SpinWheel.readIMU();
  // `total_acceleration` includes the effect of the 
  // gravitational field even at rest. 
  float total_acceleration = sqrt(pow(SpinWheel.ax,2) + pow(SpinWheel.ay,2) + pow(SpinWheel.az,2));
  // For sensing motion, we want only the component of that measurement
  // that is related to motion.
  // Kinematic is a fancy word for "related to moving".
  float kinematic_acceleration = abs(total_acceleration - 1.0); 
  // Turn on the large LEDs when noticing motion.
  // The intensity for each color goes from 0 to 255 on the SpinWheel,
  // so we multiply the value of the kinematic_acceleration by a largish
  // number, to make the light more noticeable.
  int intensity = 20*kinematic_acceleration;
  // We mix equal red, green, and blue for white light.
  SpinWheel.setLargeLEDsUniform(intensity, intensity, intensity);
  // And we tell the SpinWheel to show the light pattern we registered on
  // the previous line.
  SpinWheel.drawFrame();
  Serial.print(intensity);
  Serial.println();
}
```

## Counting Steps

Finally, we can work on our goal: using the SpinWheel to display all of our detected motion in order to show how much we have moved over time. We will simply add up the values for "kinematic_acceleration". For this we don't have to be particularly precise: we just want one number that contains some information about the total motion we have exerted. We can call that variable `total_motion` and each time we detect motion we update it with `total_motion = total_motion + conversion_factor * kinematic_acceleration`. We introduced the small number `conversion_factor` so that we keep the value of `total_motion` growing slowly.


We only want motions of a certain size to be counted as motion. We can do this by introducing a minimum `threshold` under which motion is not counted. We do that by using an `if` statement of the form `if (kinematic_acceleration>threshold)`. Without this addition to our code, small vibrations would be falsely included in our count. 

Finally, we use the 12 smaller LEDs in order to show the value of `total_motion`. If `total_motion` is 1, we light up only the first LED. If it is 5, we light up the first five LEDs, and so on. We use the `SpinWheel.setSmallLEDs()` function to do that.

```cpp
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  Serial.begin(115200);
  SpinWheel.begin();
}

float total_motion = 0;
float threshold = 0.1;
float conversion_factor = 0.01;

void loop() {
  SpinWheel.readIMU();
  float total_acceleration = sqrt(pow(SpinWheel.ax,2) + pow(SpinWheel.ay,2) + pow(SpinWheel.az,2));
  float kinematic_acceleration = abs(total_acceleration - 1.0); 
  int intensity = 20*kinematic_acceleration;
  SpinWheel.setLargeLEDsUniform(intensity, intensity, intensity);
  // Accumulate all of the motion readings over time in a single number.
  // To avoid false readings, perform the accumulation only if the motion
  // was sufficiently strong.
  if (kinematic_acceleration>threshold) {
    total_motion = total_motion+conversion_factor*kinematic_acceleration;
  }
  // Display how much you have moved, by turning on the corresponding
  // number of small LEDs.
  SpinWheel.setSmallLEDs(0,total_motion,255,255,255);
  SpinWheel.drawFrame();
  Serial.print(total_motion);
  Serial.println();
}
```

You might need to experiment with the value of `conversion_factor` in order to make your device present the total number of steps in a way you like. In the video below we have also changed some of the colors. Can you do something similar? Under the video there is a widget in which you can experiment with this code within your browser without needing a physical SpinWheel.
 
<video src="/images/bookpics/stepcounter_final.mp4" muted autoplay playsinline loop></video>

::: further-reading
Other interesting features would be to show different colors when the detected acceleration is too small to be counted. Moreover, you can use the colors of the small LEDs to give more information.
:::

## Virtual SpinWheel

You can use this simulation of a SpinWheel to play with the code without uploading it to a physical device. After clicking "Run", you can grab the image of the SpinWheel and shake it to have the virtual device respond to that motion.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

<div class="ssw-codecontent" markdown=0 id="stepcounter-sim1">
<pre class="ssw-codeblock">
float total_motion = 0;
float threshold = 0.1;
float conversion_factor = 0.01;

void loop() {
  SpinWheel.readIMU();
  float total_acceleration = sqrt(pow(SpinWheel.ax,2)
                                 +pow(SpinWheel.ay,2)
                                 +pow(SpinWheel.az,2));
  float kinematic_acceleration = abs(total_acceleration - 1.0); 
  int intensity = 20*kinematic_acceleration;
  SpinWheel.setLargeLEDsUniform(intensity, intensity, intensity);
</pre>
<textarea class="ssw-codeblock">
  if (kinematic_acceleration>threshold) {
    total_motion = total_motion+conversion_factor*kinematic_acceleration;
  }
  SpinWheel.setSmallLEDs(0,total_motion,255,255,255);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>
