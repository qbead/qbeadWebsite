---
title: SpinWheel Initial Setup
keywords: SpinWheel, arduino, setup
---

The SpinWheel has four components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes), and a micro computer.

The kit you receive will contain the battery, detached from the rest of the circuitry. Simply plug the battery connector in the appropriate jack on the board and you can start using the SpinWheel as a wearable accessory, as it is already preloaded with a number of basic programs. You can press the button to switch between different ones.

The kits also contains a booklet with various challenges you can undertake. A number of them do not require you to make any modifications to the SpinWheel and permit you to make various measurements related to the physics of the world around you.

However, much of the joy of the SpinWheel comes from your potential to change it, and make it do whatsoever you wish. To do that you will need a way to reprogram the computer on the SpinWheel. You can do that by first installing the Arduino software you can download from [arduino.cc/en/Main/Software](arduino.cc/en/Main/Software).

Open that software and plug your SpinWheel with a USB cable in your computer. Keep the switch in the "Off" positions (that detaches the battery, but it still keeps the SpinWheel connected to the USB cable). You should be able to see your device appear in `Tools→ Port`. Select it so that the software knows to which device to talk. Also select `Arduino Leonardo` as the processor, so that the software knows in what dialect to talk to the device.

Lastly, you want to install our set of examples, so you have a starting point from which to explore the capabilities of the SpinWheel. We know all of this can seem a bit overwhelming, but we will be there for you when you have questions, and our booklet will have a lot of examples. It is like learning a new language - one that lets you command computers. To get the first set of examples of this new language, download them from [here](/software/SpinWearablesFirmware.zip) and install them through `Sketch→ Include Library→ Add .ZIP Library`. 

Now you can install a different set of animations on your SpinWheel by opening `File→ Examples→ SpinWearables` and picking one from them. For instance, pick `BlinkingFirmware` and upload it by pressing the upload button (the second button at the top). Now your device will have all the animations it already had, plus a colorful blinking one. If this has all worked out, you can continue with the other activities that will show you how these small pieces of software work and how you can make your own.
