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

Your kit contains a SpinWheel, a battery, and if you ordered one, a paper copy of the SpinWheel Field Guide. 
It also includes a piece of double stick tape to attach the battery.
A micro USB cable is needed to charge and program the SpinWheel and is not included with the kit. 
You likely already own a micro USB cable (a Kindle or an old Android smartphone would use such a cable), but you can also buy a micro USB cable online.

The SpinWheel has four main components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

![Unboxing the device. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/unboxing.small.png "Unboxing the device."){style="max-width:90%"}

::: warning :
The SpinWheel contains sensitive electronic components that are securely soldered onto the printed circuit board but that can break if jostled excessively. For this reason, it is important that you are gentle with your SpinWheel when you plug it into your computer to program or plug it in to charge, and be gentle when putting it into storage in a backpack, purse, or pocket. Storing the SpinWheel in a smaller pocket within your bag or in the box you received it in will help keep it safe. 
:::


## Quick Start

![<a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/arduino_library_setup.small.png "Arduino setup.")

1. You'll notice that the battery is not attached to the SpinWheel when you receive it. Before attaching the battery, slide the switch on the back of the SpinWheel to be on "USB." To attach the battery, firmly insert the battery connector into the battery jack on the circuit board. If you have difficulty, then read the section on "Attaching the Battery" below. 

2. Once the battery is in, you can start using the SpinWheel as a wearable accessory! It comes preloaded with several basic animations. To turn on the SpinWheel, flip the switch on the back to "BAT" (for "battery"). You should see it turn on and light up brightly! 

3. You can press the button on the back of the SpinWheel to toggle between different animations. 

4. To turn off the SpinWheel, flip the switch to "USB".

5. To charge, plug a micro USB cable into the USB jack on the back of the SpinWheel, keep the switch on "USB" and charge using a computer or USB-to-wall converter. The switch should be set to "USB" whenever it is plugged into your computer, whether to charge or to program. You should also keep the switch in this position when you are not using the SpinWheel and for long term storage to protect the battery from discharging. Note: the battery may require charging before use. Reaching full charge takes approximately 1 hr.

Your kit may have come with a paper booklet (the SpinWheel [Field Guide](/book)) with some hands-on adventures and reference materials to assist you as you are programming the SpinWheel. The activities in the booklet are also found in expanded versions online. We highly recommend that you make use of both. 

## Attaching the Battery

When you try to insert the battery, you may find that the connection between the battery and the SpinWheel is very tight. 
This is normal and it may take some force to insert it. 
We recommend using your thumbs on either side of the connector to push it up into the jack. 
You do not need to insert it all of the way for a secure connection.
While it is fine to use force on the plastic connector, it is very important not to pierce or bend the battery itself.
After you add the battery, you can use the two-sided tape included in your package to attach it to the back of the SpinWheel as shown in the photo below.

![This is what the back of your SpinWheel will look like when the battery is attached to the board. When the SpinWheel is off, charging, or being programmed, make sure that the switch is in the "USB" position as shown.](/images/quickstart/battery_back.jpg "Here is an image of what the battery will look like when it added onto the board.")



## Setting Up the Arduino Software

While you can use the SpinWheel with the preloaded animations, much of the joy of the SpinWheel comes from your ability to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. We use the Arduino programming language to communicate with the SpinWheel. Start by installing the Arduino software on your computer, which you can download for free from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software#download). Select the correct version for your computer's operating system.

Once the software is installed, we have to configure it to communicate with the SpinWheel.

1. Plug your SpinWheel into your computer with a micro USB cable and flip the switch to the position labeled "USB". 

2. Open the Arduino software. 

3. Open the `Tools` menu and go to `Port`. You will see a list of serial ports on your computer; you need to find the one for the SpinWheel. If there are multiple ports and you are unsure which one to use, simply unplug the SpinWheel and see which serial port disappears when you do so. This port corresponds to your SpinWheel's serial port. If you do not see a port appear/disappear, you may need to try another micro USB cable. <!--(see Troubleshooting guide for more details).-->

4. Go back to the Tools menu and select `Tools → Board`. Select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which <span class="footnote">“dialect” <span>Computer languages have dialects just like human languages!</span></span> to use to talk to the SpinWheel.

![Use `Tools → Port` and `Tools → Board` to pick the port corresponding to the SpinWheel and the "Leonardo" board type. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/port_and_board_screenshot.png "Use `Tools→ Port` and `Tools→ Board` to change the settings on the Arduino software.")

Properly selecting the board and port are essential for the Arduino software to communicate with the SpinWheel. If you are unable to upload code to the Spinwheel in the next section, double check that you have the correct board and port selected.

## Programming the SpinWheel

Learning to code is just like learning a new language - you will understand only a couple of words and commands at first, but as your skills grow you will be able to command the computer to do more sophisticated tasks! To get the first set of examples of this new language and the other libraries necessary to run the SpinWheel code, download our SpinWearables Arduino Library using `Sketch → Include Library → Manage Libraries...`. In the search bar of the Library Manager, search for `SpinWearables` and then click `Install`. You will be automatically promted to install two other required libraries ('NeoPixel' for controlling the LEDs and `ICM 20948` for reading the motion sensor).

![Installing Arduino libraries. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/quickstart/adding_libraries_screenshot.png "Installing Arduino libraries."){style="max-width:90%"}

The new files can be found under `File → Examples → SpinWearables`. Open any file to see an example of the language used to communicate with the SpinWheel. You will learn more about this language in future lessons.
We encourage you to experiment with these examples! If you want to save any changes, you will be prompted to save the sketch in a new location (can be anywhere on your computer), so you can always open the original example again.

![Upload programs to your SpinWheel using the `Upload` button (highlighted in white).](/images/quickstart/upload_button_screenshot.png "Upload programs to your SpinWheel using the `Upload` button (highlighted in white)."){style="max-width:388px"}

To test that your SpinWheel is working properly, you can install a new program, or sketch, from the example files to animate your SpinWheel. Choose a file to install by opening `File → Examples → SpinWearables` and picking one of the examples. For instance, pick [`BlinkingFirmware`](/codedoc/examples/BlinkingFirmware) and upload it by pressing the upload button (the arrow at the top). Now your SpinWheel will have the new colorful blinking pattern (from `BlinkingFirmware`) you just uploaded. 

Doing this will overwrite the preloaded sketch that came on your SpinWheel. If you want your SpinWheel to have the sketch that was preloaded on the SpinWheel again, simply open the [`SpinWheelStockFirmware`](/codedoc/examples/SpinWheelStockFirmware) example and upload it.

In future SpinWheel activities, you will be writing new programs to animate the SpinWheel. To transfer a program from your computer to your SpinWheel, simply connect your SpinWheel to your computer, change the switch to "USB", open the code of your new program in the Arduino software and press the upload button. 
 
Congratulations! You are now ready to continue with the rest of the SpinWheel activities!
