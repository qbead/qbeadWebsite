---
title: The SpinWheel - Behind the Scenes
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
header-image: /images/banners/schem_logo_optim.png
---

<div class="row">
<div class="column dark">
## The Idea
</div>
</div>

<div class="row">
<div class="column long-text">
The idea for a stylish wearable device that could be used to teach computer science and physics has been brewing in our team for a couple of years. In 2017, for one of our regular outreach events on Yale's campus, we invited high school students to participate in the first version of this activity. We used breadboards, LED strips, and a motion sensor to create a [motion-sensing bracelet](https://www.engineeringday.com/2017/01/29/motion-sensing-bracelet/).

The premise, under which the lesson plan was built, was that enticing the students to build something beautiful would be motivation enough to overcome any initial science and math phobias. The feedback from the students was great, and we were particularly encouraged when students self-identifying as the "artsy kids" professed their surprise that math and engineering could be so beautiful.
</div>
</div>

<div class="row-small-reverse">
<div class="column colorful">
High schoolers assembling and showcasing the bracelets that they made.
</div>
<div class="column"><img src="/images/behindthescenes/early_bracelet.jpg"></div>
</div>

<div class="row">
<div class="column long-text">
A platform like this, by virtue of including beautiful color patterns, motion sensing, and programming, is rich enough to teach a very wide physics and computer science curriculum. The prepared topics include, among others, vectors and kinematics, light and science of vision, intro programming, even signal processing and event loops. As such, it fulfills our desire to prepare a lesson that would excite both the science enthusiasts, as well as the kids that might have prematurely self-selected out of science and engineering. (A similar desire, to present math as beautiful and creative subject, was behind the later creation of our [Fractals and Art lesson plan](https://www.engineeringday.com/2018/09/28/fractal-art/), but we digress.)
</div>
</div>

<div class="row">
<div class="column dark">
## Turning it into a self-contained device
</div>
</div>

<div class="row">
<div class="column long-text">
We continue to use the LED-strip bracelet as a platform to teach electronics; however, this activity requires experienced tutors to help with debugging and wiring. In the appropriate setting this is a great teaching opportunity, but we also desired to create something self-contained: a beautiful wearable device that the student can confidently use to explore the marvels of science on their own. This led us to the design of the SpinWheel, which is both more resilient and quite a bit more elegant than the initial LED-strip bracelet. Below, we will describe our journey, design process, and choice of tools.
</div>
</div>

<div class="row">
<div class="column colorful long-text">
In an advanced chapter of the ["The SpinWheel Science and Exploration Field Guide"](/book) companion text we will discuss the design and testing work in more detail, in the hope that young makers will feel empowered enough to create their own devices of similar complexity. In particular, we would like to simplify the most terrifying part of the process: the debugging of an initially failing new design.
</div>
</div>

<div class="row">
<div class="column dark">
### Initial parameters, component selection, and rough shape
</div>
</div>

<div class="row">
<div class="column long-text">
We knew that ease of programming for the students would be among the most significant design constraints. We wanted the minimum possible requirements for the programming environment, something stress tested by the world-wide maker community, with a simple installation procedure. This led us to base our device on the wonderful open source Arduino platform. In particular, for the main controller on the board (the programmable device that controls the LEDs and reads the motion sensor), we decided to use one of the controllers supported directly by the Arduino software.

Moreover, our desire to use the minimal amount of extra components led us to choose the Atmega32u4 chip, as this particular chip has a built-in USB interface that the students can use for programming. This same chip is used in the popular Arduino Leonardo and Arduino Micro boards. The open hardware community, and in particular the Arduino organization, have used this chip in many designs, providing a wealth of documentation and reference circuit diagrams that made our work much easier.

In addition to the micro controller, we picked a 9-degrees-of-freedom motion sensor (for acceleration, rotation, and magnetic field sensing), a LiPo battery charger, and the required support components.

In parallel to this process, we were iterating through the physical parameters for the device: we wanted something wearable and beautiful. The particular control chip we decided to use also limited the number of LEDs we can realistically support. We attempted to create the most elegant design that was also sufficiently rich to meaningfully visualize useful measurements for the science lessons.
</div>
</div>

<div class="row">
<div class="column"><img src="/images/behindthescenes/draft_layout_inset.jpg"></div>
<div class="column colorful">
The first draft of what would become the final layout of the SpinWheel, with enough LEDs to not only be beautiful, but also be able to represent cardinal directions, measured tilt, and other physical quantities.
</div>
</div>

<div class="row">
<div class="column dark">
### Creating the circuit diagrams and the board layouts
</div>
</div>

<div class="row">
<div class="column long-text">
With CAD tools, the creation of the final design files is a straightforward, albeit long, process. Thankfully, our board is sufficiently simple that we did not require advanced tooling. The main difficulty was how compact the final design had to be.

In a typical electronic design software, one starts by drawing the abstract circuit diagrams. In our case, this mostly mostly involved copying the reference schematics provided by the manufacturer of the controller, motion sensor, and battery charger. The more difficult task was translating this abstract diagram into the physical layout, and in particular, routing all the traces carrying electrical signals between all the components without crossing them.
</div>
</div>

<div class="row-small-reverse">
<div class="column colorful">
The schematics and 3D renders of the SpinWheel.
</div>
<div class="column"><img src="/images/behindthescenes/schem_and_render.png"></div>
</div>

<div class="row">
<div class="column dark">
### Testing the newly printed boards
</div>
</div>

<div class="row">
<div class="column long-text">
Before we were comfortable pushing the project forward, we wanted to test the SpinWheel design under various conditions. For that purpose we ordered multiple unpopulated breadboards, on which to build and test the prototype device.
</div>
</div>

<div class="row">
<div class="column"><img src="/images/behindthescenes/first_batch_pcb.jpg"></div>
<div class="column colorful">
The first batch of printed circuit boards delivered to us for testing.
</div>
</div>

<div class="row">
<div class="column long-text">
The SpinWheel, given its small components, is meant to be assembled by robots (which has large setup costs, but for a thousand boards the cost per board becomes relatively small). However, we had to solder multiple test boards by hand, before sending the SpinWheel off to our robotic colleagues. This permitted us to double check the performance of each component (and indeed led us to change some of our initial choices), ensuring that the final device will work reliably.
</div>
</div>

<div class="row-small-reverse">
<div class="column colorful">
Elise attaching test probes to a newly hand-soldered SpinWheel.
</div>
<div class="column"><img src="/images/behindthescenes/elise_testing.jpg"></div>
</div>

<div class="row">
<div class="column dark">
### More about the software
</div>
</div>

<div class="row">
<div class="column long-text">
The SpinWheel is suited for a very rich Computer Science curriculum, covering many difficulty levels, and topics spanning low-level programming, graphics, event loops, and many abstraction techniques. However, our main focus is to have easy onboarding for students who have never programmed and might even think there is no fun in that field. We are structuring the libraries so that a very small amount of code is sufficient to create interesting patterns and responses from the device. That would involve a large assortment of ready-to-use patterns like the example below. The advanced users will also have the option to use a lower-level set of operations that create even more imaginative patterns.
</div>
</div>

<div class="row">
<div class="column"
style="text-align: left;
overflow: hidden;
padding: 1em;">
```cpp
void loop() {
 // Calculate an angle at which to
 // shine, based on current time:
  int angle = millis()/400;
 // Update the state of the LEDs:
  SpinWheel.setSmallLEDsArc(angle);
}
```
</div>
<div class="column"><video src="/images/behindthescenes/circling.mp4" muted autoplay playsinline loop></video></div>
</div>

<div class="row">
<div class="column dark">
## Final results
</div>
</div>

<div class="row">
<div class="column long-text">
This is the SpinWheel, a brilliant, easily-programmable, wearable device through which students can explore computer science and physics while creating a beautiful accessory for themselves:
</div>
</div>

<div class="row-small-reverse">
<div class="column colorful">
The SpinWheel.
</div>
<div class="column"><img src="/images/behindthescenes/colorful_earring_cropped.jpg"></div>
</div>

<div class="row">
<div class="column"><img src="/images/behindthescenes/wearing_earring_cropped.jpg"></div>
<div class="column colorful">
The SpinWheel as jewelry. Works as a keychain or an impropmptu compass as well.
</div>
</div>
