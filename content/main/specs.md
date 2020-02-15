---
title: Technical Specifications
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
header-image: /images/specs/schem_bg_noblur.png
subtitle: What makes the SpinWheel tick.
---

<div class="row">
<div class="column">
Some details for those who want to delve deeper in the components behind the SpinWheel.
</div>
</div>
    
<div class="row">
<div class="column large-text">
**Controller**

An `ATmega32U4` 8-bit controller with 32K bytes of memory, clocked at 16MHz, about 16 times faster than the Apollo Guidance Computer used for the lunar landing. Running the Arduino Leonardo bootloader, programmable over USB from any computer.
</div>
<div class="column column-long"><video src="/images/behindthescenes/pretty_device.mp4" muted autoplay playsinline loop></video></div>
</div>

<div class="row row-small-reverse dark-transparent">
<div class="column column-long"><img src="/images/behindthescenes/earring_3.jpg"></div>
<div class="column large-text">
**Colored Light-emitting Diodes**

8 `IN-PI55` 5mm RGB light-emitting diodes controlled asynchronously over a single wire and 12 `IN-B101FCH` 1mm RGB light-emitting diodes driven syncronously from the controller in a software persistence-of-vision mode.
</div>
</div>


<div class="row">
<div class="column large-text">
**Motion Sensor**

The `ICM-20948` sensor providing acceleration, rotation, and magnetic field measurements on all 3-axes.
</div>
<div class="column column-long"><img src="/images/behindthescenes/glamour_shot.jpg"></div>
</div>

<div class="row row-small-reverse">
<div class="column column-long"><img src="/images/behindthescenes/back_battery.jpg"></div>
<div class="column large-text">
**Battery**

A `100mAh` LiPo battery that can be charged over USB. Lasts for hours in normal operation, but if you want literally blindingly-bright SpinWheel that can deplete it under 20minutes. Disclaimer: we used "literally" in its literal sense.
</div>
</div>

<div class="row dark">
<div class="column">
You can see design files and firmware in our [git repository](https://github.com/SpinWearables).
</div>
</div>
