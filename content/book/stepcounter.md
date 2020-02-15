---
title: Make a step counter
keywords: stepcounter, motion, acceleration
header-image: /images/banners/stepcounter.png 
---

A step counter needs to detect motion, add up each time motion is detected, and somehow display the cummulative value. The SpinWheel has a motion sensor that can deal with the first task, a small controller (computer) that can perform the addition, and a number of LEDs that can be used as a display. Here we will see how to put these features together to make our own custom step counter.

Ensure you know how to connect the SpinWheel to your computer to program it with the Arduino software. As always, we will start with an "empty" sketch, on top of which we can build our custom program:

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
  Serial.print("I am working!"); 
  // Print a new line after each message.
  Serial.println(); 
}
```

The first step is to ensure that the SpinWheel can measure something related to the motion. At each repetition step in `loop` we want to command the motion sensor to report the new values: we do that by calling `SpinWheel.readIMU()` where IMU stands for Inertial Measurement Unit, a fancy name for something that senses motion. We want to measure a single number related to the overall motion of the SpinWheel, i.e. we do not care on which of the 3 directions in space is the motion strongest. One way to do that is to combine the values describing the motion along each direction in one single number. Mathematicians call this "calculating the magnitude" or "calculating the norm" of a "vector". One way to do it is to calculate $\sqrt{a_x^2+a_y^2+a_z^2}$, where $a_x$ is the acceleration in the x directions and so on. The code to do that operations looks like `sqrt(SpinWheel.ax*SpinWheel.ax + SpinWheel.ay*SpinWheel.ay + SpinWheel.az*SpinWheel.az)`. We will save this value in the variable `total_acceleration`.

We also send this value to the computer connected to the SpinWheel in order to confirm everything is working. The command `Serial.print(total_acceleration)` does that. In the Arduino software we can use `Tools -> Serial Plotter` to visualize the results.

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
  float total_acceleration = sqrt(SpinWheel.ax*SpinWheel.ax+SpinWheel.ay*SpinWheel.ay+SpinWheel.az*SpinWheel.az);
  Serial.print(total_acceleration);
  Serial.println();
}
```

You might have noticed, we are only detecting motion for the moment, but we are not actually counting steps. We started with a much easier problem, and we are building up the complexity of our solution. Being able to split a big problem in small pieces is a one of the most important skills you can build.

The next small step we will take is to visualize the motion information we have gathered. Being able to obtain visual feedback at each stage of our work makes it easier to detect errors. We will use the `setLargeLEDsUniform` function to turn all 8 of the large LEDs on at the same time. We will use equal mixture of red, green, and blue, in order to make them light up in white. The intensity of each color will be proportional to the detected acceleration. However, you might have noticed that the `total_acceleration` value is 1, not 0, at rest. This is because the accelerometer can not distinguish between the force of gravity acting on it at all times, and the forces of inertia acting on it when you shake it. To account for that, we subtract 1 from this value. This is how we obtain `kinematic_acceleration = total_acceleration - 1`. "Kinematic" is a fancy word physicists use to refer to things related to motion. We calculate intensity base on that value with `intensity = 20*kinematic_acceleration` and use it in the `setLargeLEDsUniform` function. We chose a factor of 20 in order to make the LEDs brighter. Below you can see the code in its entirety.

::: further-reading
There are a lot of intricate facts about motion and gravity, related to the fact that our motion sensor can not distinguish between the two. You can read more about it in the section on ["Inertial reference frames and Free fall"](./inertia). Einstein himself was thinking about this everyday fact when he was developing the general theory of relativity.
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
  float total_acceleration = sqrt(SpinWheel.ax*SpinWheel.ax+SpinWheel.ay*SpinWheel.ay+SpinWheel.az*SpinWheel.az);
  // This `total_acceleration` includes the effect of the gravitational
  // field even at rest.  We want only the component of that measurement
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
  Serial.print(total_motion);
  Serial.println();
}
```

Finally, we can attempt to deal with the our end goal: accumulating all the detected motion in order to show how much we have moved over time. We will simply add up the value for "kinematic_acceleration". We will not be particularly precise, rather we just want to have one single number that contains some information about the total motion we have exerted. We can call that variable `total_motion` and each time we detect motion we update it with `total_motion = total_motion + conversion_factor * kinematic_acceleration`. We introduced the small number `conversion_factor` so that we keep the value of `total_motion` growing slowly.

We also want to avoid small vibrations picked up by our sensor, as they would falsely lead us to believe that we have moved. We do that by introducing a minimum `threshold` under which motion is not counted. We do that by using an `if` statement of the form `if (kinematic_acceleration>threshold)`.

Lastly, we use the 12 smaller LEDs in order to show the value of `total_motion`. If `total_motion` is 1, we light up only the first LED. If it is 5, we light up the first five LEDs, and so on. We use the `SpinWheel.setSmallLEDs()` function to do that.

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
  float total_acceleration = sqrt(SpinWheel.ax*SpinWheel.ax+SpinWheel.ay*SpinWheel.ay+SpinWheel.az*SpinWheel.az);
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

You might need to experiment with the value of `conversion_factor` in order to make your device present the total number of steps in a way you like. In the demo below we have also changed some of the colors. Can you do something similar?

<video src="/images/bookpics/stepcounter_final.mp4" muted autoplay playsinline loop></video>

::: further-reading
Other interesting features would be to show different colors when the detected acceleration is too small to be counted. Moreover, you can use the colors of the small LEDs to give more information.
:::
