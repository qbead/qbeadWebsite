---
title: SpinWheel Initial Setup
keywords: SpinWheel, arduino, setup
---

::: intro-box
We're so excited that you are ready to use your SpinWheel! This page provides details on
the contents of your kit, instructions for turning it on for the first time and begins the
process of setting you up to create new and exciting programs on your SpinWheel!
:::

## Contents

Your kit contains a SpinWheel, a battery, and a paper copy of the SpinWheel Field Guide. A micro USB cable is needed to charge and program the SpinWheel and is not included with the kit. You likely already own a micro USB cable (a Kindle or an old Android smartphone would use such a cable), but you can also buy a micro USB cable online.

The SpinWheel has four main components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

![Unboxing the device](/images/quickstart/unboxing.small.png "Unboxing the device."){style="max-width:90%"}

::: warning :
The SpinWheel contains sensitive electronic components that are securely soldered onto the printed circuit board, but that can break if jostled excessively. For this reason, it is important that you are gentle with your SpinWheel when you plug it into your computer to program or plug it in to charge, and be gentle when putting it into storage in a backpack, purse, or pocket. Storing the SpinWheel in a smaller pocket within your bag or in the box you received it in will help keep it safe. 
:::


## Quick Start

![Setup](/images/quickstart/arduino_library_setup.small.png "Arduino setup.")

1. You'll notice that the battery is not attached to the SpinWheel. Simply plug the battery connector into the battery jack on the circuit board and you can start using the SpinWheel as a wearable accessory, as it is already preloaded with several basic animations. 

2. To turn on the SpinWheel, flip the switch on the back to "BAT" (for "battery"). You should see it turn on and light up brightly! 

3. You can press the button on the back of the SpinWheel to toggle between different animations. 

4. To turn off the SpinWheel, flip the switch to "USB".

5. To charge, plug a micro USB cable into the USB jack, keep the switch on "USB" and charge using a computer or USB-to-wall converter. You should also keep the switch in this position when you are not using the SpinWheel and for long term storage to protect the battery from discharging. Note: the battery may require charging before use.

Your kit contains a booklet (the SpinWheel Field Guide) with various activities you can complete. The activities in the booklet are also found in expanded versions online. We highly recommend that you make use of both. 

## Setting Up the Arduino Software

While you can use the SpinWheel with the preloaded animations, much of the joy of the SpinWheel comes from your potential to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. We use the Arduino programming language to communicate with the SpinWheel. Start by installing the Arduino software on your computer, which you can download for free from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software).

Plug your SpinWheel into your computer with a micro USB cable and flip the switch to the position labeled "USB". Open the Arduino software. You should see your device appear in the Tools menu under `Tools → Port`. You will see a list of serial ports on your computer; you need to find the one for the SpinWheel. If there are multiple ports and you are unsure which one to use, simply unplug the SpinWheel and see which serial port disappears when you do so. This port corresponds to your SpinWheel's serial port.

![Use `Tools → Port` and `Tools → Board` to pick the port corresponding to the SpinWheel and the "Leonardo" board type.](/images/quickstart/port_and_board_screenshot.png "Use `Tools→ Port` and `Tools→ Board` to change the settings on the Arduino software.")

Now you can go back to the Tools menu and select `Tools → Board`. Select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the SpinWheel (computer languages have dialects just like human languages!).

## Programming the SpinWheel

Learning to code is just like learning a new language - you will understand only a couple of words and commands at first, but as your skills grow you will be able to command the computer to do more sophisticated tasks! To get the first set of examples of this new language, download [our collection of sample code](/software/SpinWearablesFirmware.zip) (this will download a zip file). Then you can use `Sketch → Include Library → Add .ZIP Library` and navigate to the zip file to add it. Experimentation with the provided examples is encouraged, and the originals will always be available, so do not worry about making a mistake.

![Installing Arduino libraries.](/images/quickstart/adding_libraries_screenshot.png "Installing Arduino libraries."){style="max-width:90%"}

You might need to download two extra libraries, if they were not automatically downloaded. You can search for them in `Sketch → Include Library → Manage Libraries...`. Install `Adafruit_NeoPixel.h` from Adafruit (for the large LEDs) and `ICM_20948.h` from SparkFun (for the motion sensor).


The new files can be found under `File → Examples → SpinWearables`. Open any file to see an example of the language used to communicate with the SpinWheel. You will learn more about this language in future lessons.
Feel free to edit the examples without worry of overwriting them — the original example will always be there.

![Upload programs to your SpinWheel using the `Upload` button (highlighted in white).](/images/quickstart/upload_button_screenshot.png "Upload programs to your SpinWheel using the `Upload` button (highlighted in white)."){style="max-width:388px"}

To test that your SpinWheel is working properly, you can install a new program, or sketch, from the example files to animate your SpinWheel. Choose a file to install by opening `File → Examples → SpinWearables` and picking one of the examples. For instance, pick [`BlinkingFirmware`](/codedoc/examples/BlinkingFirmware) and upload it by pressing the upload button (the arrow at the top). Now your SpinWheel will have the new colorful blinking pattern (from `BlinkingFirmware`) you just uploaded. 

Doing this will overwrite the preloaded sketch that came on your SpinWheel. If you want your SpinWheel to have the sketch that was preloaded on the SpinWheel again, simply open the [`SpinWheelStockFirmware`](/codedoc/examples/SpinWheelStockFirmware) example and upload it.

In future SpinWheel activities, you will be writing new programs to animate the SpinWheel. To transfer a program from your computer to your SpinWheel, simply connect your SpinWheel to your computer, open the code of your new program in the Arduino software and press the upload button. 
 
Congratulations! You are now ready to continue with the rest of the SpinWheel activities!
