---
title: Turning Code Snippets from C to Javascript for In-page Demos
keywords: transpile, javascript, C, emulate, simulate
header-video: /images/banners/linewheel_crossfade.mp4
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>
<style>
.ssw-bt-debug {
  display: inline !important;
}
</style>

This lesson is part of the SpinWheel series. The
[SpinWheel](https://www.kickstarter.com/projects/spinwheel/447670470)
is a small Arduino-compatible sensor-enabled wearable device, meant to be used
for teaching physics and computer science through an artistic medium. You can
support our non-profit
[Kickstarter](https://www.kickstarter.com/projects/spinwheel/447670470)
to help us reach more curious young minds and to get the device and teaching
kit showcased in this lesson.

::: intro-box
We built the [SpinWheel](https://www.kickstarter.com/projects/spinwheel/447670470) and its [engaging aesthetics](https://spinwearables.com) around the Arduino platform because of its low bariers to entry. We also want our online learning resources to be interactive, in the style of [Explorable Explanations](https://explorabl.es/), as this significantly improves learning outcomes. Thus, we needed to find a way to "compile" example C code in our webpages and show how it would affect the physical device. Moreover, the device has motion sensors which is central to many of the lessons we want to teach, hence the need to find a way to simulate that in a web page as well. Read on to see our misadventures into hacking together the most fragile C-to-Javascript transpiler: 100 lines of silly code that open up great pedagogical opportunities.
:::

::: warning
Lessons are still under development!
:::

## The SpinWheel - the C++ code which we want to simulate in the browser

This is the SpinWheel:

<video src="/images/bookpics/preloaded_tilt3.mp4" muted autoplay playsinline loop></video>

And this is the result of a [lesson](/stepcounter) of how to turn this wearable keychanin/jewelry into a step counter. The large LEDs respond to the current motion, while the small LEDs accumulate the total motion, hence counting "steps".

<video src="/images/bookpics/stepcounter_final.mp4" muted autoplay playsinline loop></video>

The C++ code to do that is fairly simple (or it would be after you go through our lessons). We can show it here in its entirety, but even such a short piece of code can look intimidating to students. Instead, let us explore how we can present it in an **interactive** fashion inside of the browser.

```c++
float total_motion = 0;
float threshold = 0.1;
float conversion_factor = 0.01;

void loop() {
  // Read sensor
  SpinWheel.readIMU();
  // Calculate intensity based on the detected acceleration
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
}
```

## Scoping the "Transpiler" Project

Given the aforementioned constrains, we have to find a way to compile C++ code inside of the browser and then let it run, mimicking this wearable embedded device. Here were a few ideas we iterated through:

1. Maybe we can send the code to a backend server which will compile it to a form executable in the browser ([Emscripten](https://emscripten.org/) maybe?), then send it back to the page and hook it up to a mock rendering of the SpinWheel...
    - Definitely not something a group of volunteers with crazy schedules trying to prepare for their Thesis defenses want to spend weeks on!
    - Just the idea of sandboxing the server is already unpleasant...
    - And how do we hook in the motion sensor?
    - Reporting compilation errors back to students!? Terrible idea that will immediately turn them away from programming!
2. Have a much more restricted set of examples, where students can modify only a single variable and the rest of the code is rendered and immutable. The actual simulation of the device will then be a completely separate piece of Javascript code that we write case-by-case.
    - So much manual labor involved for such a limited and borderline boring experience...
3. Use regex to turn the C++ code into Javascript code!
    - Will we be able to live with the shame of such a hackish solution?

Yes, we will find a way to live with the shame. We will incorporate some of 2 as well, so that the fragility of our "transpiler" is not too obvious. A silver lining is that separation between editable code and pre-rendered code will guide the attention of the student to the part of the code that is most important to the concept under study.

Without further ado, here is an example of what a humble version of the final result would look like. Click on `Run`! Does it do what you would expect given the code?

<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  // Milliseconds since start
  int t = millis();
  // Brightness periodic with time
  int b = (t/10)%255;
</pre>
<textarea class="ssw-codeblock">
  // Turn on only the RED and GREEN channels
  SpinWheel.setLargeLEDsUniform(b, b, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>

Play a bit with the modifiable part. It is still fragile, with many ways to break it, but it is sufficient for guided explorations. We will also explain the `Debug` button shortly.


## Editable vs Immutable Parts of the Examples

As mentioned, we will let the students modify only small parts of the "C++" code. We do that by writing parts of the code snippets in preformatted `div`s, while the editable part is in `textarea` tags. The **entirety** of html or markdown that the lesson writer needs to write for the above example is this:

```html
<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
  // Milliseconds since start
  int t = millis();
  // Brightness periodic with time
  int b = (t/10)%255;
</pre>
<textarea class="ssw-codeblock">
  // Turn on only the RED and GREEN channels
  SpinWheel.setLargeLEDsUniform(b, b, 0);
</textarea>
<pre class="ssw-codeblock">
  SpinWheel.drawFrame();
}
</pre>
</div>
```

Our "transpiler" framework detects all `ssw-codecontent` classes and adds all of the extra functionality around them. As a side note, you might have noticed that we are sticking to using scare quotes around "transpiler"... We are not really ready to live with the shame of the hackish solution you will see below ;) Nonetheless, we are proud that it becomes so simple to add pieces of interactive C++ code to our lessons, without requiring the lesson-writers to learn yet another framework.

## The "Virtual" Device

We also needed to implement a virtual version of the device. Consider the `drawFrame()` function that takes the buffer of color values and actually renders it to the LEDs. The implementation of the physical version involves a method in a C++ class (which you can view rendered in a [beautiful literary programming style](/codedoc/SpinWearables.h.html)). It involves some crazy bit shifting and persistence of vision tricks running on the microcontroller. Thankfully, the Javascript version is much simpler. First, we recreate the device in html:

```html
<div>
<img src="/simspinwheel/spinwheel_invertgray_nosmalls.png">
<div class="ssw-large-led ssw-large-led0"></div>
⋮
<div class="ssw-large-led ssw-large-led7"></div>
<div class="ssw-small-led ssw-small-led0"></div>
⋮
<div class="ssw-small-led ssw-small-led11"></div>
</div>
```

And we place all these `small-led` and `large-led` `div`s using css.

```css
.ssw-large-led {
  position: absolute;
  width: 5%;
  height: 5%;
  border-radius: 50%;
  background: black;
}
.ssw-large-led0 {left:49%;top:39%;}
⋮
```

Finally, we just use Javascript to modify them. Each `<div class="ssw-codecontent">` has its own `SpinWheel` Javascript class that has methods with the same names as the C++ methods, so that the "transpiler" has an easy time hooking up to the virtual SpinWheel. For example, here is the Javascript version of the `drawFrame()`, without any painful bit-fidling that the hardware version required. We also include the class constructor, as it is responsible for acquiring handles for all the `div`s whose colors we will be changing (the virtual LEDs)

```javascript
constructor(container) {
  ⋮
  this._ssw_lLEDdiv = Array.from(container.getElementsByClassName("ssw-large-led"));
  this._ssw_lLEDarray = new Uint8Array(this._ssw_lLEDdiv.length*3);
  ⋮
}

drawFrame() {
  this.drawLargeLEDFrame();
  this.drawSmallLEDFrame();
}

drawSmallLEDFrame() {
  for (let i = 0; i<this._ssw_sLEDdiv.length; i++) {
    this._ssw_sLEDdiv[i].style.background = `rgb(${this._ssw_sLEDarray[3*i]},${this._ssw_sLEDarray[3*i+1]},${this._ssw_sLEDarray[3*i+2]})`;
  }
}
```

The `_ssw_lLEDdiv` array contains the handles for all `div`s, while the `_ssw_lLEDarray` contains the RGB color values (as populated by `setLargeLEDsUniform(r,g,b)` for instance.

## The Second Best Part: The Actual Transpiler

It is embarrassingly simple, but quite effective:

```javascript
base_code = base_code.replace(RegExp('(?:[^\\w])('+pair[0]+')(?:[^\\w])','g'),
                              x=>x.replace(pair[0], pair[1]));
```

`pair` is just the pair of keywords that we need to translate: the C++ one and the Javascript one. For instance one such pair would be `['int', 'var']`. Obviously, we are loosing some fidelity in the translation, especially around data types, and we can only use C++ constructs that close to the Javascript syntax, but for a well-controlled educational snippet of code that is all we need. A big part of engineering is to know when to not overengineer your solution.

The regex needs to be a bit more carefully designed, as we want to turn `int intensity` into `var intensity`, not `var varensity` which a simple replace would have given us. We use non-capturing groups for that. Consider the `(?:[^\w])` piece in `(?:[^\w])(keyword)(?:[^\w])`. It matches everything that is not (`^`) a word-character (`\w`), i.e. not `a-zA-Z0-9_`. However, it does not capture it due to the `?:` prefix for the group. Thus, this regex captures only `keyword` as long as it is not a substring in another word. Now we just need to build up our dictionary of keywords...

And we need to be a bit careful how we call that `loop` function - we need a timed callback, because a busy loop would cause the webpage to hang. The gist of our solutions is:

```javascript
var c = 200; // counts number of executions
function _ssw_loop() {
  loop();
  c--;
  if (c>0) {
    setTimeout(_ssw_loop, 50);
  }
};
_ssw_loop();
```

If we want to, we can even use [`async` to implement the popular Arduino `delay` function](https://www.sitepoint.com/delay-sleep-pause-wait/), which pauses the execution of the program.

You can click the `Debug` button to see what the generated Javascript code actually looks like.

## The Truly Best Part: The Virtual Motion Sensor

Run the code below, grab the image of the SpinWheel with your mouse, and shake it. What happened to the LEDs?

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

We still need to figure out how to present the colors in a more noticeable fashion, but **your virtual SpinWheel lit up with colors infered from your virtual motionsensor**. This also ended being embarrassingly simple to implement. We just added a `onmousemove` handler to the `div` containing the image of the SpinWheel. Then we calculate the numerical second derivative of the positions in the `_ddx` and `_ddy` properties of the class. Note that we are also using an exponential decay filter `_ddx = 0.1*(dx-_dx)/dt + 0.9*_ddx` in order to smooth out the signal.

```javascript
function elementDrag(e) {
  e = e || window.event;
  e.preventDefault();
  // calculate the new cursor position:
  pos1 = pos3 - e.clientX;
  pos2 = pos4 - e.clientY;
  var tnew = new Date().getTime();
  var dt = tnew-t;
  t = tnew;
  dx = pos1/dt*200;
  dy = pos2/dt*200;
  SpinWheel._ddx = 0.1*(dx-SpinWheel._dx)/dt + 0.9*SpinWheel._ddx;
  SpinWheel._ddy = 0.1*(dy-SpinWheel._dy)/dt + 0.9*SpinWheel._ddy;
  SpinWheel._dx = dx;
  SpinWheel._dy = dy;
  pos3 = e.clientX;
  pos4 = e.clientY;
  // set the element's new position:
  elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
  elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
}
```

Now all we have to do is flesh out our Javascript `SpinWheel` class such that it is up to feature parity with the C++ one running on our hardware, and start using this in all of our lessons. (We also plan to add functionality for the rotation sensor.)

We would be happy to hear your feedback on this little hack of ours. Feel free to contact us at `mail@spinwearables.com`! And consider supporting our kickstarter.


<a href="https://www.kickstarter.com/projects/spinwheel/447670470">
<figure><img src="/images/kickstarter_support.png"></figure><figcaption>We are trying to bring similar resources, from the middle-school level to the undergraduate level, to more curious minds. Supporting our non-profit Kickstarter would greatly help us.</figcaption>
</a>
 
