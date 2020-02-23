---
title: SpinWheel Initial Setup
keywords: SpinWheel, arduino, setup
---

Thanks for purchasing a SpinWheel kit! Your kit contains: 1 SpinWheel, 1 battery, 1 keychain, and 1 paper copy of the SpinWheel Field Guide. A micro USB cable is not included with the kit, but any micro USB cable should work with your SpinWheel.

The SpinWheel has four components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

The battery was detached from the circuit board so we could ship the kit to you. Simply plug the battery connector into the appropriate jack on the circuit board and you can start using the SpinWheel as a wearable accessory, as it is already preloaded with several basic programs. To turn the SpinWheel on, flip the switch on the back. You should see it turn on and light up brightly! You can press the button on the back of the SpinWheel to toggle between different programs.

Your kit also contains a booklet with various activities you can complete (the SpinWheel Field Guide). Some of them do not require you to make any modifications to the SpinWheel.

However, much of the joy of the SpinWheel comes from your potential to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. You can do that by first installing the Arduino software, which you can download from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software).

Plug your SpinWheel into your computer with a micro USB cable. Keep the switch in the "Off" position (this detaches the battery in the SpinWheel circuitry, but it still keeps the SpinWheel connected to the USB cable - note: you do not need to physically detach the battery here! Keep it plugged into your SpinWheel, just flip the switch to “Off”). 

Open the Arduino software. You should be able to see your device appear in `Tools→ Port`. There will be some text describing the serial port, followed by “Arduino Leonardo”. Select the port that says “Arduino Leonardo” so that the software knows which device to talk to. 

Under the Tools menu, also select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the device (just like a language you speak can have different dialects!).

Learning to code is just like learning a new language - it may not be easy at first, but once you learn the basics, you will be able to write code to communicate effectively with computers!. To get the first set of examples of this new language, download our collection of sample code [here](/software/SpinWearablesFirmware.zip) (this will download a zip file; you might want to move this to a folder specifically for your SpinWheel files). Then you can use `Sketch→ Include Library→ Add .ZIP Library` and navigate to the zip file to add it. 

Now you can install a new set of animations on your SpinWheel by opening `File→ Examples→ SpinWearables` and picking one of the examples. For instance, pick `BlinkingFirmware` and upload it by pressing the upload button (the arrow at the top). Now, your SpinWheel will contain all the pre-loaded animations it came with, plus the new colorful blinking one (from BlinkingFirmware) you just uploaded. To get to your new BlinkingFirmware animation (also called a “Sketch” in Arduino), press the button on the back of your SpinWheel.

Congratulations! You are now ready to continue with the rest of the SpinWheel activities!

