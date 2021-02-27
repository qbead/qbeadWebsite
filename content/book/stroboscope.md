---
title: Stroboscopes and stroboscopic photography
keywords: stroboscope, photography, fast motion
---

::: further-reading
When trying to take a photo of a fast moving object
(or even when we simply try to observe that object with our eyes),
all we usually see is a blur.
However, if the object performs a repetitive motion
(e.g. the blades of a fan or a helicopter),
and we use a fast-flashing light source,
we might be able to synchronise the illumination with the motion,
such that the object appears immobile to the camera.
The camera will only be able to see an illuminated object
when the object is in one particular location.
This method is known as "stroboscopic photography" and we will explore it here.
:::

::: warning :
This adventure will involve bright flashing lights. Do not attempt the activities here if you have light sensitivity or are alone.
:::

Consider this stick figure drawn on one of the blades of a fan:

<style>
.strobanim {
  justify-content: center;
  display: flex;
  flex-direction: row;
  position: relative;
}
.strobanim > canvas {
  border: solid 1px black;
  margin: 2px;
}
</style>
<div class="strobanim" id="stationary_stick_figure">
<canvas width=200 height=200></canvas>
</div>
<script>
var rotstep = 3.1415 / 25.324;

function draw_stick_figure(ctx) {
  ctx.lineWidth = 10;
  ctx.beginPath();
  ctx.arc(100, 55, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(135, 55);
  ctx.arc(100, 55, 35, 0, Math.PI, false); // Mouth (clockwise)
  ctx.moveTo(90, 45);
  ctx.arc(85, 45, 5, 0, Math.PI * 2, true); // Left eye
  ctx.moveTo(120, 45);
  ctx.arc(115, 45, 5, 0, Math.PI * 2, true); // Right eye
  ctx.stroke();
}

const stationary_stick_figure = document.getElementById('stationary_stick_figure');
const ssf_ctx = stationary_stick_figure.getElementsByTagName('canvas')[0].getContext('2d');

draw_stick_figure(ssf_ctx);
</script>

If the blades are rotating at even moderate speed, all we will be able to see is a blur:

<div class="strobanim" id="rotating_stick_figure">
<canvas width=200 height=200></canvas>
</div>
<script>
const rotating_stick_figure = document.getElementById('rotating_stick_figure');
const rsf_ctx = rotating_stick_figure.getElementsByTagName('canvas')[0].getContext('2d');
var rsf_canvas_buffer = document.createElement('canvas');
var rsf_ctx_buffer = rsf_canvas_buffer.getContext('2d');
rsf_ctx_buffer.fillStyle = "rgba(255,255,255,0.15)";
draw_stick_figure(rsf_ctx_buffer);
for (var i=0; i<=2; i++) {
  rsf_ctx_buffer.fillRect(0,0,200,200);
  rsf_ctx_buffer.translate(100,100);
  rsf_ctx_buffer.rotate(rotstep/4);
  rsf_ctx_buffer.translate(-100,-100);
  draw_stick_figure(rsf_ctx_buffer);
}
function rsf_draw() {
  rsf_ctx.translate(100,100);
  rsf_ctx.rotate(rotstep);
  rsf_ctx.translate(-100,-100);
  rsf_ctx.drawImage(rsf_canvas_buffer, 0, 0);
  window.requestAnimationFrame(rsf_draw);
}
rsf_draw();
</script>

However, imagine that the light source illuminating this fan blade was synchronized
such that it briefly flashes only when the blade is in the upright position.
At any other time, there is no light and the camera does not see anything.
To the camera (or our eyes) it would look like the blade is not moving,
simply because the blade is in darkness most of the time
and it is illuminated in only one particular position.
Certainly, the flashing would have to be very rapid,
but it is not difficult to make a rapidly flashing light.
We will do it shortly with the SpinWheel.

Below is a visualization that attempts to showcase this phenomenon.
On the left is the rotating image as seen if it is illuminated by a normal flashlight.
On the right is the same image as it would be seen if the light source was intermittently flashing.
The sliders let you change the frequency of the flashes and the relative duration of illumination and consecutive darkness.
Can you adjust the sliders such that the right image appears always in the same location.

<div style="text-align:center">briefly on<input type="range" min="10" max="100" value="50" id="strobduty">always on</div>
<div style="text-align:center">flash often<input type="range" min="10" max="100" value="100" id="strobperiod">flash rarely</div>
<div style="text-align:center">Light turns on every <strong id=visperiod></strong> seconds for a duration of <strong id=visduty></strong> seconds.</div>
<div class="strobanim" id="strob_stick_figure">
<canvas id="strob_all" width=200 height=200></canvas>
<canvas id="strob_sync" width=200 height=200></canvas>
</div>
<script>
const visduty = document.getElementById('visduty');
const visperiod = document.getElementById('visperiod');
const strobduty = document.getElementById('strobduty');
const strobperiod = document.getElementById('strobperiod');
const strob_stick_figure = document.getElementById('strob_stick_figure');
const strobsf_canvas = strob_stick_figure.getElementsByTagName('canvas')[0];
const strobsf_ctx = strobsf_canvas.getContext('2d');
const syncsf_ctx = strob_stick_figure.getElementsByTagName('canvas')[1].getContext('2d');
var strobsf_canvas_buffer = document.createElement('canvas');
var strobsf_ctx_buffer = strobsf_canvas_buffer.getContext('2d');
var strobison = false;
var firstframe = false;
strobsf_ctx.fillStyle = "rgba(200,40,40,0.55)";
strobsf_ctx_buffer.fillStyle = "rgba(255,255,255,0.15)";
syncsf_ctx.fillStyle = "rgba(255,255,255,0.15)";
draw_stick_figure(strobsf_ctx_buffer);
for (var i=0; i<=2; i++) {
  strobsf_ctx_buffer.fillRect(0,0,200,200);
  strobsf_ctx_buffer.translate(100,100);
  strobsf_ctx_buffer.rotate(rotstep/4);
  strobsf_ctx_buffer.translate(-100,-100);
  draw_stick_figure(strobsf_ctx_buffer);
}
function strobsf_draw() {
  strobsf_ctx.translate(100,100);
  strobsf_ctx.rotate(rotstep);
  strobsf_ctx.translate(-100,-100);
  strobsf_ctx.drawImage(strobsf_canvas_buffer, 0, 0);
  if (strobison) {
    syncsf_ctx.drawImage(strobsf_canvas, 0, 0);
    if (firstframe) {
      //strobsf_ctx.fillRect(0,0,200,200);
      firstframe = false;
    }
  } else {
    syncsf_ctx.fillRect(0,0,200,200);
  }
  window.requestAnimationFrame(strobsf_draw);
}
function turn_strob_on() {
  strobison = true;
  firstframe = true;
  setTimeout(turn_strob_off, strobduty.value*strobperiod.value/10);
}
function turn_strob_off() {
  strobison = false;
  setTimeout(turn_strob_on, (100-strobduty.value)*strobperiod.value/10);
}
strobperiod.oninput = function(){visperiod.innerHTML=`${strobperiod.value/100}`;visduty.innerHTML=`${strobduty.value*strobperiod.value/10000}`;}
strobduty.oninput = function(){visduty.innerHTML=`${strobduty.value*strobperiod.value/10000}`;}
strobperiod.oninput();
strobsf_draw();
turn_strob_on();
</script>

It was not that easy, was it? There are a couple of features you might have noticed:

- It is important to distinguish the "period" of the flashes (i.e., the time between the onsets of two consecutive flashes) for the duration of each flash (i.e., the time over which a flash is on). The duration is always less than a period. The duration of the flash plus the duration of the darkness is equal to the period.
- It is easier to calibrate the period of the flashes if the duration of each flash is short. If the illumination is on for too long, it does not matter whether the flashing frequency is synchronized to the motion of the stick figure: the stick figure will still move too much during that duration and will look like a blur. Set the duration of the flash to a very low value by using the top slider.
- Now that the duration is low and the image is as sharp as it will get, try to change of the periods of the flashes so that the image on the right appears always in the same location. Could you now say, after performing this procedure, how many seconds does it take for the stick figure to make one full rotation?

We can do this with a real stick figure attached to a real fan or toy motor:

<figure><video src="/images/strob_blur.mp4" controls></video><figcaption>Illuminating a stick figure attached to a toy motor. The illumination is even and constant, leading to the fast-moving stick figure looking like a blur.</figcaption></figure>

<figure><video src="/images/strob_good.mp4" controls></video><figcaption>Same stick figure illuminated by a light source flashing roughly a hundred times each second. Notice two things: it took us a while to precisely calibrate the flashing period and until we did that the stick figure still looked like a blur moving all over the place; while at the end we do have the stick figure mostly in the same location, it still looks a bit blurry -- this is because even during the short time the light is on (three ten-thousands of a second) the stick moves a couple of millimeters.</figcaption></figure>

This was achieved by using the SpinWheel's LEDs (yes, they are capable of such high speeds). We will now see how this was done so you can try at home. A good target for the device we will create (called a stroboscope) would be any random fan you have at home (which usually perform anything between 50 and 200 rotations per second). Another interesting target would be rapid consecutive droplets of water coming from a leaky faucet (if you time the flashes to be just a bit shorter than the period between droplets, it would look like the droplets are slowly moving upwards).

But first, let us overwrite the default settings of the SpinWheel and set the large LEDs to maximum (blinding) brightness:

```cpp
void setup() {
  SpinWheel.begin();
  SpinWheel.setBrightness(255);
}
```

We also would like to define a constant that tells us how long we need to wait between flashes (it will be measured in microseconds, i.e., a millionth of a second):

```cpp
long default_delay_time = 10000;
```

Notice that this time we are declaring this variable as `long` not as `int`. `long` variables are a particular type of integers that can store large values (much larger than the usual limit of around 30 000 that can be stored in an `int`).

Now comes the main part of the code, the one that forces all the large LEDs to flash rapidly:

```cpp
void loop() {
  // Turn the LEDs on.
  SpinWheel.setLargeLEDsUniform(255, 255, 255);
  SpinWheel.drawLargeLEDFrame();
  // Wait for a very brief moment of time,
  // just 3% of the total period.
  delayMicroseconds(0.03*default_delay_time);

  // Turn the LEDs off.
  SpinWheel.setLargeLEDsUniform(0, 0, 0);
  SpinWheel.drawLargeLEDFrame();
  // Wait the other 97% of the period in darkness.
  delayMicroseconds(0.97*default_delay_time);
}
```

Your eye probably will not be able to notice the rapid flashes and the illumination would look smooth,
but if you shine it on a rapidly moving object you will be able to see the stroboscopic effect.
Notice that we used the `drawLargeLEDFrame` function instead of the `drawFrame` function --
we did this because the small LEDs are drastically slower and do not work well when the `delay` functions
are in use. By sticking to only the large LEDs this was not a problem.

We have one last issue to address, namely, the fact that this code works only for objects that repeat their motion
exactly 100 times a second (every 10 000 microseconds, i.e., every 10 milliseconds).
We need a way to "calibrate" the period of the stroboscopic light.
We can use the [tilt sensor](/tilt) of the SpinWheel as a "turning knob" that changes the total period.
The x-axis acceleration measurement will vary from -1 to +1 depending on the tilt of the device.
We can introduce a `correction` variable:

```cpp
long default_delay_time = 10000;
long max_correction = 800;
```
 
If we define the period as `default_delay_time + SpinWheel.ax * max_correction`
we can use the tilt to vary its value from
`9200 = 10000-800` to `10800 = 10000+800`.
The entirety of the code would look like:

```cpp
void loop() {
  // Measure the tilt and use it to modify the period.
  SpinWheel.readIMU();
  long delaytime = default_delay_time + SpinWheel.ax * max_correction;
  
  // Turn the LEDs on and wait a short fraction of the total period.
  SpinWheel.setLargeLEDsUniform(255, 255, 255);
  SpinWheel.drawLargeLEDFrame();
  delayMicroseconds(0.03*delaytime);

  // Turn the LEDs off and wait for the rest of the period.
  SpinWheel.setLargeLEDsUniform(0, 0, 0);
  SpinWheel.drawLargeLEDFrame();
  delayMicroseconds(0.97*delaytime);
}
```

This code can be found in
[`Examples → SpinWearables → Stroboscope`](/codedoc/examples/Stroboscope/Stroboscope.ino.html).
Before using it for the first time it could help making the periods much larger,
on a scale that a human can perceive, in order to observe the flashing behavior for yourself.
Try setting the default period to 100 000 microseconds (one-tenth of a second) and the
correction to 50 000 microseconds (one-twentieth of a second) and tilt the device to
see how the period changes.

Whenever you target a new repetitive motion for a stroboscopic study,
you probably will need to reupload the code multiple times as you pinpoint the correct value for the period.
At first it might help having a `max_correction` which is large, almost as large as `default_delay_time`.
That would make it easier for you to span a large interval of possible periods.
As you pinpoint the correct value, you can make `max_correction` smaller and smaller,
which makes the stroboscope much easier to calibrate to a precise value
(as it becomes less sensitive to unintentional changes in the tilt due to trembles in your hand).

Lastly, could you guess what happens if you use a period that is half (or one-third or another simple fraction)
of the correct period?

<figure><video src="/images/strob_half.mp4" controls></video><figcaption>The stick figure illuminated with continuous light and with rapidly flashing light at a period equal to one-half of the period of the rotating stick. Why does the image double up?</figcaption></figure>
