---
title: Make a Step Counter
keywords: stepcounter, motion, acceleration
header-image: /images/banners/stepcounter.png 
---

::: intro-box
A step counter needs to detect motion,
record the movement,
and display the total number of steps taken.
The SpinWheel has a motion sensor that can deal with the first task,
a small controller (computer) that can record this data,
and a number of LEDs that can be used as a display.
Here we will see how to put these features together to make our own custom step counter.
:::

To start, plug the SpinWheel into your computer and open up an "empty" sketch in the Arduino software. If you need help remembering how to do this, you can get a recap of how to connect your SpinWheel to your computer in our [Quick Start Guide](/quickstart).

## From an Empty Sketch

We will build our Step Counter program step by step, starting with this empty sketch.
A good first step is to write some simple test code that just prints a few messages, confirming that your device is still functioning. For instance, copy the following code into your file. This code, once running on the SpinWheel, will repeatedly send the message "I am working!" to the computer that your SpinWheel is attached to. As always, we will add comments to the code, so that the purpose of each line is explained. (A comment is a line of code that is not run by the computer, but meant to be interpreted by humans. In this code, comment lines start with `//`).

::: further-reading
You can consult our [SpinWheel basic commands page](/basics) to remind yourself how to read the computer code shown below. For more details about coding itself, check out the [Programming Patterns page](/progpatterns).
:::

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

If you upload this sketch to the SpinWheel, you won't be able to see anything happen. 
It doesn't turn on the LEDs, instead the sketch simply set ups the SpinWheel and sends a confirmation message ("I am working!") repeatedly using `Serial.println()`. 
If you want to see this message, navigate to `Tools -> Serial Monitor` in the Arduino software. 

## Measuring Motion

Now we can begin to add useful functionality to our sketch.
The first step is to ensure that the SpinWheel can measure something related to its motion.
The function `loop` is repeatedly being called by our SpinWheel. Each time thist happens, we want
to instruct the motion sensor to report the new values it has measured.
We do this by calling `SpinWheel.readIMU()` where IMU stands for Inertial Measurement Unit:
a fancy name for something that senses motion. This function will return 3 acceleration values, one for each direction of motion.

<!--TODO: Explain the directions of motion a little more here or link to vectors here instead of below? -->

We want to measure a single number related to the overall motion of the SpinWheel,
i.e. we do not care which of the 3 directions in space has the strongest motion.
One way to do this is to combine the 3 values describing the motion along each direction into one single number.
Mathematicians call this "calculating the magnitude" or "calculating the norm" of a "vector".

::: further-reading
If you want to learn more about what vectors are and how they are used by mathematicians and engineers, check out our lesson on ["Vectors"](/vectors).
:::

A convenient way to get this "magnitude" is to calculate $\sqrt{a_x^2+a_y^2+a_z^2}$,
where $a_x$ is the acceleration in the x direction that was read by the `SpinWheel.readIMU()` function, $a_y$ corresponds to the y direction, and $a_z$ corresponds to the z direction.
The code to do this operation looks like `sqrt(pow(SpinWheel.ax,2) + pow(SpinWheel.ay,2) + pow(SpinWheel.az,2))`.
We will save this value in the variable `total_acceleration`.

We will also send this value to the computer connected to the SpinWheel to confirm that everything is working. The command `Serial.print(total_acceleration)` does just this. Once the code is running on the SpinWheel,  we can use `Tools -> Serial Plotter` in the Arduino software to visualize the results.

<video src="/images/bookpics/stepcounter_nolights.mp4" muted autoplay playsinline loop></video>

Here is all the code put together (if you want to open this sketch in the Arduino software to add it to your SpinWheel, navigate to `Examples → SpinWearables → Step_Counter →  Detect_Total_Acceleration`):

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

You might have noticed that we are currently only detecting motion; we are not actually counting steps yet. Since writing the code to make the SpinWheel into a step counter is complicated, it is helpful to break it up into less complicated steps. Through programming the SpinWheel, we will help you learn how to split big problems into small pieces for yourself. We hope you will find this skill useful not only when programming!

## Displaying Motion

Our next task is to change the SpinWheel's LEDs based on the motion data we have collected. Having visual feedback at each stage of our work makes it easier to detect errors in our code. We will use the `setLargeLEDsUniform` function to turn all 8 of the large LEDs on at the same time. We will use an equal mixture of red, green, and blue, in order to make them light up in white.

::: further-reading
To further explore why we can trick our brains to perceive a mixture of red, green, and blue colors as white, check out the ["Biology of Sight" activity](/sight).
:::

The intensity of each color will be proportional to the detected acceleration. However, you might have noticed that the `total_acceleration` value is 1, not 0, at rest. This is because the motion sensor (called an accelerometer) cannot distinguish between the force of gravity acting on it at all times, and the forces of inertia acting on it when you shake it.
To account for that, we subtract 1 (the magnitude of gravity) from `total_acceleration`.
This is how we obtain `kinematic_acceleration = total_acceleration - 1`. "Kinematic" is a fancy word physicists use to refer to things related to motion. We calculate intensity based on that value with `intensity = 20*kinematic_acceleration` and use it in the `setLargeLEDsUniform` function. We chose a factor of 20 in order to make the LEDs brighter.

Here is all the code put together (you can find it in `Examples → SpinWearables → Step_Counter →  Detect_Kinematic_Acceleration`):

::: further-reading
There are a lot of intricate facts about motion and gravity that relate to why our motion sensor can not distinguish between the two. You can read more about it in the section on ["Inertial reference frames and Free fall"](./inertia), which will also explain why `total_acceleration` at rest, as measured by our sensor, is 1 unit. Einstein himself was thinking about this everyday fact when he was developing the general theory of relativity.
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

Finally, we can achieve our goal: using the SpinWheel to display all detected motion, showing how much we have moved over time. We will simply add up the values for "kinematic_acceleration". For this, we don't have to be particularly precise: we just want one number that contains some information about the total motion we have exerted. We can call that variable `total_motion` and each time we detect motion we update it with `total_motion = total_motion + conversion_factor * kinematic_acceleration`. We introduced the small number `conversion_factor` so that we keep the value of `total_motion` growing slowly.


We only want motions of a certain size to be counted as steps. For example, if you take a step, we want that to be counted, but we don't want slight movements, such as the jitter of the hand holding your SpinWheel, to be counted.

We can do this by introducing a minimum `threshold` under which motion is not counted.
We do this by using an `if` statement of the form `if (kinematic_acceleration>threshold)`.
Without this addition to our code, small vibrations would be falsely included in our count.
You can observe this effect in the interactive chart below.
In the chart, you can see the grey line depicting the values reported by the motion sensor.
By manipulating the slider, you can change the threshold at which values are counted in the total.
If the threshold is too low, all the small vibrations detected by the sensor are counted,
falsely inflating the total sum.
However, by setting the threshold higher, we are able to count only the three very noticeable strong motions (i.e. the peaks that approach a value of 1 on the y-axis):
they actually correspond to real steps and need to be counted.
But if we set the threshold too high, then none of the motions are counted, and once again, the stepcounter will not work properly.

<!--TODO: Make the plot fit with the rest of the aesthetics. Maybe use rough.js -->

<script src='/chart/Chart.bundle.min.js'></script>
<div style="text-align:center">
<div><input style="width:30%;" type="range" min="0" max="100" value="20" id="thrSlider"> Use this slider to set the threshold.</div>
<div>The threshold is set at <code id="thrView"></code> which leads to a total sum of <code id="thrSum"></code>.</div>
</div>
<div style="width:100%;height:200px;">
<canvas id="thresholdchart"></canvas>
</div>
<script>
var thrSlider = document.getElementById('thrSlider');
var thrView = document.getElementById('thrView');
var thrSum = document.getElementById('thrSum');
function thrUpdate() {
  var t = thrSlider.value/100;
  thrChart.data.datasets[0].data.fill(t);
  thrChart.update()
  thrView.innerHTML = t;
  thrSum.innerHTML = samples.filter(x=>x>t).reduce((a,b)=>a+b,0).toFixed(1);
}
thrSlider.oninput = thrUpdate;
var samples = Array(40).fill(0).map((x,i)=>Math.random()*0.25);
samples[10] = 0.8;
samples[11] = 0.9;
samples[12] = 0.7;
samples[20] = 0.7;
samples[21] = 0.9;
samples[22] = 0.8;
samples[30] = 0.9;
samples[31] = 0.7;
samples[32] = 0.8;
var indices = Array(40).fill(0).map((x,i)=>'');
var threshold = Array(40).fill(0.2);
var ctx = document.getElementById('thresholdchart').getContext('2d');
var thrChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: indices,
        datasets: [{
            label: 'threshold',
            data: threshold,
            fill: false,
            pointRadius: 0,
            borderColor: 'red'
          },{
            label: 'motion measurements',
            data: samples,
            fill: false,
            pointRadius: 0,
            borderColor: '#ccc'
        }]
    },
    options: {
        maintainAspectRatio: false,
        tooltips: {enabled: false},
        scales: {
            xAxes: [{
                scaleLabel: {labelString: 'time', display: true},
                ticks: {
                    min:0,
                    max:40
                },
                gridLines: {display: false}
            }],
            yAxes: [{
                scaleLabel: {labelString: 'value', display: true},
                ticks: {
                    min:0,
                    max:1
                },
                gridLines: {display: false}
            }]
        }
    }
});
thrUpdate();
</script>

Finally, we use the 12 smaller LEDs in order to show the value of `total_motion`. If `total_motion` is 1, we light up only the first LED. If it is 5, we light up the first five LEDs, and so on. We use the `SpinWheel.setSmallLEDs()` function to do this.

Below you can see the code in its entirety, and <a href="#stepcounter-sim1">at the bottom of the page</a> you can try running it on a virtual SpinWheel. To add this code to your SpinWheel, go to `Examples → SpinWearables → Step_Counter →  Fancy_Step_Counter`):


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

You might need to experiment with the value of `conversion_factor` in order to make your device present the total number of steps in a way you like. In the video below, we have also changed some of the colors. Can you do something similar? Under the video, there is a widget which you can use to experiment with this code in your browser without needing a physical SpinWheel.
 
<video src="/images/bookpics/stepcounter_final.mp4" muted autoplay playsinline loop></video>

::: further-reading
Other interesting features would be to show different colors when the detected acceleration is too small to be counted. Moreover, you can use the colors of the small LEDs to give more information. For instance, this is one way that you can modify the code that we presented to allow your step counter to display a count of your steps past 12. Another way you could do this is modify the device so the LEDs only light up every 10, or 100 steps.
:::

## Virtual SpinWheel

You can use this simulation of a SpinWheel to play with the code without uploading it to a physical device. After clicking "Run", you can grab the image of the SpinWheel and shake it to have the virtual device respond to that motion. Try to play with the threshold value, change colors, and even change how quickly the small LEDs turn on.

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

<div class="ssw-codecontent" markdown=0 id="stepcounter-sim1">
<textarea class="ssw-codeblock">
float total_motion = 0;
float threshold = 0.1;
float conversion_factor = 0.2;
</textarea>
<pre class="ssw-codeblock">

void loop() {
  SpinWheel.readIMU();
</pre>
<textarea class="ssw-codeblock">
  float total_acceleration = sqrt(pow(SpinWheel.ax,2)
                                 +pow(SpinWheel.ay,2)
                                 +pow(SpinWheel.az,2));
</textarea>
<pre class="ssw-codeblock">
  float kinematic_acceleration = abs(total_acceleration - 1.0); 
</pre>
<textarea class="ssw-codeblock">
  int intensity = 2000*kinematic_acceleration;
  SpinWheel.setLargeLEDsUniform(intensity, 0, intensity);
</textarea>
<pre class="ssw-codeblock">
  if (kinematic_acceleration>threshold) {
    total_motion = total_motion+conversion_factor*kinematic_acceleration;
  }
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setSmallLEDs(0,total_motion,255,0,0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>
