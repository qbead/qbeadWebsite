---
title: SpinWheel Initial Setup
keywords: SpinWheel, arduino, setup
---

We're so excited that you are ready to use your SpinWheel! Your kit contains: 1 SpinWheel, 1 battery, and 1 paper copy of the SpinWheel Field Guide. A micro USB cable is needed to charge and program the SpinWheel and is not included with the kit. You likely already own a micro USB cable (your Kindle or an old android smartphone might use this charger), but you can also buy a micro USB cable online.

The SpinWheel has four components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

![Unboxing the device.](/images/quickstart/unboxing.small.png "Unboxing the device.")

You'll notice that the battery is not attached to the SpinWheel. Simply plug the battery connector into the battery jack on the circuit board and you can start using the SpinWheel as a wearable accessory, as it is already preloaded with several basic programs. To turn on the SpinWheel, flip the switch on the back to "BAT". You should see it turn on and light up brightly! You can press the button on the back of the SpinWheel to toggle between different programs. To turn off the SpinWheel, flip the switch to "USB". To charge, plug a micro USB cable into the USB jack, flip the switch to "USB" and charge using a computer or USB-to-wall converter.

![Installing Arduino libraries.](/images/quickstart/arduino_library_setup.small.png "Installing Arduino libraries.")

Your kit contains a booklet with various activities you can complete (the SpinWheel Field Guide). The activities in the booklet are also found in expanded versions online. We highly recommend that you make use of both. While you can use the SpinWheel with the preloaded programs, much of the joy of the SpinWheel comes from your potential to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. We use the Arduino programming language to communicate with the SpinWheel. Start by installing the Arduino software on your computer, which you can download from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software).

Plug your SpinWheel into your computer with a micro USB cable. While using the USB cable (for charging or for programming) flip the switch to the position labeled "USB" -- that lets the battery rest and charge, and lets the SpinWheel be powered directly from the USB cable. You should also keep the switch in this position when you are not using the SpinWheel and for long term storage to protect the battery from discharging. 

Open the Arduino software. You should be able to see your device appear in the Tools menu under `Tools→ Port`. You will see a list of serial ports on your computer; you need to find the one for the SpinWheel. If there are multiple ports and you are unsure which one is the right one, simply check which one disappears when you unplug the SpinWheel.

Now you can go back to the Tools menu and select `Tools→ Board`. Select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the device (computer languages have dialects just like human languages!).

![Use `Tools→ Port` and `Tools→ Board` to change the settings on the Arduino software.](/images/quickstart/port_and_board_screenshot.png "Use `Tools→ Port` and `Tools→ Board` to change the settings on the Arduino software.")

Learning to code is just like learning a new language - it may not be easy at first, but once you learn the basics, you will be able to write code to communicate effectively with computers! To get the first set of examples of this new language, download [our collection of sample code](/software/SpinWearablesFirmware.zip) (this will download a zip file). Then you can use `Sketch→ Include Library→ Add .ZIP Library` and navigate to the zip file to add it. You can always download this file anew if in your experimentation you have lost the original -- and experimentation is encouraged.

![Add new programs to your Arduino library using the `Include Library` menu options.](/images/quickstart/adding_libraries_screenshot.png "Add new programs to your Arduino library using the `Include Library` menu options.")

To test that your device is working properly, you can install a new set of programs to animate your SpinWheel by opening `File→ Examples→ SpinWearables` and picking one of the examples. For instance, pick `BlinkingFirmware` and upload it by pressing the upload button (the arrow at the top). Now, your SpinWheel will contain all the pre-loaded animations it came with, plus the new colorful blinking one (from `BlinkingFirmware`) you just uploaded.

![Upload programs to your SpinWheel using the `Upload` button (highlighted in white).](/images/quickstart/upload_button_screenshot.png "Upload programs to your SpinWheel using the `Upload` button (highlighted in white).")

In future SpinWheel activities, you will be writing new programs to animate the SpinWheel. To transfer a program from your computer to your SpinWheel, simply connect your SpinWheel to your computer, open your new program in the Arduino software and press the upload button.
 
Congratulations! You are now ready to continue with the rest of the SpinWheel activities!
