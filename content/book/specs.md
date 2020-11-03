---
title: Technical Specifications
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
---

::: intro-box
Some details for those who want to delve deeper in the components behind the SpinWheel.
:::
    
## Controller

An `ATmega32U4` 8-bit controller with 32K bytes of memory, clocked at 16MHz, about 16 times faster than the Apollo Guidance Computer used for the lunar landing. Running the Arduino Leonardo bootloader, programmable over USB from any computer. The controller was picked because it is among the standard Arduino controllers, therefore it will not require any extra configurations to be performed by the user after installing the Arduino software. Another important considerations was that the USB support is built in this chip, saving space and complexity that would have been taken up if we had to add an extra chip specifically for USB communication.

<video src="/images/behindthescenes/pretty_device.mp4" muted autoplay playsinline loop></video>


## Colored Light-emitting Diodes

8 `IN-PI55` 5mm RGB light-emitting diodes controlled asynchronously over a single wire and 12 `IN-B101FCH` 1mm RGB light-emitting diodes driven syncronously from the controller in a software persistence-of-vision mode. The 5mm RGB lighs were picked because they are supported by the popular NeoPixel Adafruit library.

![The SpinWheel's LEDs](/images/behindthescenes/earring_3.jpg "An image of the SpinWheel as an earring")


## Motion Sensor

The `ICM-20948` sensor providing acceleration, rotation, and magnetic field measurements on all 3-axes. It is one of the more popular sensors, used in many devices by SparkFun and Adafruit, letting us reuse much of the work they have already put in supporting the device.

![The SpinWheel's LEDs can respond to its motion.](/images/behindthescenes/motion_sensor.jpg "The SpinWheel with the bottom LED lit up")

## Battery

A `100mAh` LiPo battery that can be charged over USB. Lasts for hours in normal operation, but if you want literally blindingly-bright SpinWheel that can deplete it under 20minutes. Disclaimer: we used "literally" in its literal sense.

![The SpinWheel's battery](/images/behindthescenes/back_battery.jpg "An image of the SpinWheel's battery")


You can see design files and firmware in our [git repository](https://github.com/SpinWearables).

