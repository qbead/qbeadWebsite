---
title: SpinWheel Initial Setup
keywords: SpinWheel, arduino, setup
---

Thanks for your interest in the SpinWheel! Your kit contains: 1 SpinWheel, 1 battery, and 1 paper copy of the SpinWheel Field Guide. A micro USB cable is not included with the kit, but any micro USB cable will work with your SpinWheel.

The SpinWheel has four components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

You'll notice that the battery is not attached to the SpinWheel. Simply plug the battery connector into the appropriate jack on the circuit board and you can start using the SpinWheel as a wearable accessory, as it is already preloaded with several basic programs. To turn the SpinWheel on, flip the switch on the back. You should see it turn on and light up brightly! You can press the button on the back of the SpinWheel to toggle between different programs.

Your kit also contains a booklet with various activities you can complete (the SpinWheel Field Guide). Some of them do not require you to make any modifications to the SpinWheel.

However, much of the joy of the SpinWheel comes from your potential to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. You can do that by first installing the Arduino software, which you can download from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software).

Plug your SpinWheel into your computer with a micro USB cable. While using the USB cable (for charging or for programming) flip the switch to the position labeled USB -- that lets the battery rest and charge, while it still lets the SpinWheel be powered directly from the USB cable. Keeping the switch in this location while also having the cable unplugged is how you should store the device long term as that protects the battery from discharging.

Open the Arduino software. You should be able to see your device appear in `Tools→ Port`. There will be some text describing the serial port which you need to select in order for the software to connect to the SpinWheel. If there are multiple ports and you are unsure which one is the right one, simply check which one disappears when you unplug the SpinWheel.

Under the Tools menu, select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the device (just like a language you speak can have different dialects!).

Learning to code is just like learning a new language - it may not be easy at first, but once you learn the basics, you will be able to write code to communicate effectively with computers! To get the first set of examples of this new language, download [our collection of sample code](/software/SpinWearablesFirmware.zip) (this will download a zip file). Then you can use `Sketch→ Include Library→ Add .ZIP Library` and navigate to the zip file to add it. You can always download this file anew if in your experimentation you have lost the original -- and experimentation is encouraged.

To test your device is working properly, you can install a new set of animations on your SpinWheel by opening `File→ Examples→ SpinWearables` and picking one of the examples. For instance, pick `BlinkingFirmware` and upload it by pressing the upload button (the arrow at the top). Now, your SpinWheel will contain all the pre-loaded animations it came with, plus the new colorful blinking one (from `BlinkingFirmware`) you just uploaded.

Congratulations! You are now ready to continue with the rest of the SpinWheel activities!

