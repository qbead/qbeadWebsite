---
title: Behind the Scenes
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
header-image: /images/behindthescenes/soldering-2.jpg
subtitle: A more in-depth look at designing and building the SpinWheel.
---

<div class="wide">
<div class="row">
<div class="column long-text">
## The Idea

The idea for a stylish wearable device to encourage the pursuit of science and engineering originated in 2017 with one of our regular outreach events on Yale’s campus. We invited high schoolers to campus to use breadboards, LED strips, and a motion sensor to create a [motion-sensing bracelet](https://www.engineeringday.com/2017/01/29/motion-sensing-bracelet/).

The feedback after the event was overwhelmingly positive and confirmed our conviction that building something beautiful can overcome initial fears about math and science. We were particularly encouraged when students professed their surprise that math and engineering could be so beautiful and a commitment to exploring these concepts further. 

<strong><em>“Before, I had never really worked with electronics but now I am definitely going to start messing with it more.”</em></strong>
 
<strong><em>"I am excited to learn to read the codes and be able to change things for the lights. I will try to explore Arduino in the future."</em></strong>

<figure>
<img src="/images/behindthescenes/early_bracelet.jpg">
<figcaption>
High schoolers assembling and showcasing the bracelets that they made.
</figcaption>
</figure>

<figure>
<img src="/images/behindthescenes/2018-discovery-museum_1.jpg">
<figcaption>
We have also found that the LED bracelets are an engaging demo when there isn't time for students to build one of their own. 
</figcaption>
</figure>
    
</div>
</div>
</div>

<div class="row">
<div class="column long-text">
Building on this idea, we have developed the SpinWheel. Through motion sensors and programming capabilities, it provides a rich platform for teaching physics and computer science. Potential lesson plans include vectors and kinematics, physics of light and color mixing, intro to programming, and even signal processing. The hands-on “adventures” that come with the device build on these lessons and bring together science and art.

(A similar desire, to present math as beautiful and creative subject, was behind the later creation of our [Fractals and Art lesson plan](https://www.engineeringday.com/2018/09/28/fractal-art/), but we digress...)
</div>
</div>


<div class="wide">
<div class="row">
<div class="column long-text">
## Turning it into a self-contained device
    
We continue to use the LED-strip bracelet as a platform to teach electronics; however, this activity requires experienced volunteers to help with debugging and wiring. With the SpinWheel, we desired to create something self-contained: a beautiful wearable device that the student can confidently use to explore the marvels of science on their own. This led us to our current design, which is both more resilient and quite a bit more elegant than the initial LED-strip bracelet. 

In the rest of this page, we will further describe the design process and our choice of tools.
</div>
</div>
</div>

<div class="row dark">
<div class="column long-text">
 In an advanced section of the ["The SpinWheel Science and Exploration Field Guide"](/book), we will discuss the design and testing process in more detail, in the hope that young makers will feel empowered enough to create their own devices. In particular, we would like to demystify what can be the most terrifying part of the process: debugging an initially failing new design.
    
<figure>
<img src="/images/for_parents/final_cover.jpg">
<figcaption>
The cover of the SpinWheel Science and Exploration Field Guide. 
</figcaption>
</figure>    
    
</div>
</div>

<div class="wide">
<div class="row">
<div class="column long-text">
### Initial parameters, component selection, and rough shape

Since accessibility was our top priority, we decided to base our device on the wonderful, open source Arduino platform. This platform has been extensively tested by the world-wide maker community and features a simple installation procedure. For the main controller on the board, we chose the Atmega32u4 chip, which is directly supported by the Arduino software. This particular chip has a built-in USB interface that the students can use for programming. The open hardware community, and in particular the Arduino organization, has used this chip in many designs, providing a wealth of documentation that made our work much easier.


Moreover, our desire to use the minimal amount of extra components led us to choose the Atmega32u4 chip, as this particular chip has a built-in USB interface that the students can use for programming. This same chip is used in the popular Arduino Leonardo and Arduino Micro boards. The open hardware community, and in particular the Arduino organization, have used this chip in many designs, providing a wealth of documentation and reference circuit diagrams that made our work much easier.

In addition to the microcontroller, we picked a 9-degrees-of-freedom motion sensor (for acceleration, rotation, and magnetic field sensing), a LiPo battery charger, and the required support components.
    
We simultaneously iterated through the physical parameters for the device to arrive at something that was wearable, beautiful, and included sufficient LEDs to represent cardinal directions, measured tilt, and other physical quantities.

<figure>
<img src="/images/behindthescenes/draft_layout_inset.jpg">
<figcaption>
The first draft of what would become the final layout of the SpinWheel, with enough LEDs to not only be beautiful, but also be able to represent cardinal directions, measured tilt, and other physical quantities.
</figcaption>
</figure>
</div>
</div>
</div>

<div class="wide">
<div class="row">
<div class="column long-text">
### Creating the circuit diagrams and the board layouts
Once we had our components and a rough sketch of the layout, we began designing the circuit board using computer aided design (CAD) tools. In a typical electronic design software, one starts by drawing the abstract circuit diagrams. In our case, this mostly mostly involved copying the reference schematics provided by the manufacturers of the microcontroller, motion sensor, and battery charger. The main challenge was fitting all of the components into a compact form factor and completing the circuit without crossing electrical components.


<figure>
<img src="/images/behindthescenes/schem_and_render.png">
<figcaption>
The schematics and 3D renders of the SpinWheel.
</figcaption>
</figure>
</div>
</div>
</div>

<div class="wide">
<div class="row">
<div class="column long-text">
### Testing the newly printed boards

Before we were comfortable pushing the project forward, we wanted to test the SpinWheel design under various conditions. For that purpose we ordered multiple unpopulated breadboards, on which to build and test the prototype device.

<figure>
<img src="/images/behindthescenes/first_batch_pcb.jpg">
<figcaption>
The first batch of printed circuit boards delivered to us for testing.
</figcaption>
</figure>

Given its small components, the SpinWheel is best assembled by robots. However, the cost of production is prohibitively high unless boards are ordered in bulk. Therefore, we decided to assemble a small number of test boards by hand before sending the SpinWheel off to our robotic colleagues. This permitted us to double check the performance of each component (and indeed led us to change some of our initial design choices), thus ensuring that the final device will work reliably.

<figure>
<img src="/images/behindthescenes/soldering-bridget-2.jpg">
<figcaption>
Bridget checking connections on a newly hand-soldered SpinWheel.
</figcaption>
</figure>

</div>
</div>
</div>

<div class="wide">
<div class="row">
<div class="column long-text">
### More about the software

The SpinWheel is suitable for a very rich Computer Science curriculum, covering many difficulty levels and topics as outlined above. However, our main focus was to have easy on-boarding for students who have never programmed before. Therefore, we are structuring the libraries so that a very small amount of code is sufficient to create interesting patterns and responses from the device. Advanced users will also have the option to use a lower-level set of operations to create even more imaginative patterns.
</div>
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

<div class="wide">
<div class="row">
<div class="column long-text">
## Final results

This is the SpinWheel: a brilliant, easily-programmable, wearable device through which students can explore computer science and physics while creating a beautiful accessory for themselves.:

<figure>
<img src="/images/behindthescenes/colorful_earring_cropped.jpg">
<figcaption>
The SpinWheel.
</figcaption>
</figure>

<figure>
<img src="/images/behindthescenes/wearing_earring_cropped.jpg">
<figcaption>
The SpinWheel as jewelry. Works as a keychain or an impropmptu compass as well.
</figcaption>
</figure>
</div>
</div>
</div>

<div class="row dark">
<style>
form {
  margin: auto;
  width: 90%;
  text-align: center;
  padding: 1em;
}

form > input {
  margin: 0.2em;
  /*border-radius: 1.5em;*/
  padding: 0.5em 1em;
  text-align: center;
  border: none;
}
</style>
<form action="https://docs.google.com/forms/u/1/d/e/1FAIpQLScpB8NUWgx-FhHzPOE5s-GHF2pZI4DTbhna-90F1GGhoF2YQQ/formResponse" method="post" id="signup-form">
<p><strong>If you'd like to be alerted when our Kickstarter is live, sign up for updates on the project:</strong></p>
<label>My Email:</label>
<input id="email" type="email" autocomplete="email" tabindex="0" aria-label="Your email" name="emailAddress" placeholder="email address" value="" required="" aria-invalid="true">
<input class="round-button" id="button" type="submit" value="Notify me when launched!" />
<!--<p style="width:70%;margin:1em auto 1em auto;">We will not email you more than twice, as we respect your time!</p>-->
</form>
<!--
<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScpB8NUWgx-FhHzPOE5s-GHF2pZI4DTbhna-90F1GGhoF2YQQ/viewform?embedded=true" height="600" frameborder="0" marginheight="0" marginwidth="0" style="width:100%;">Loading…</iframe>
-->
</div>
