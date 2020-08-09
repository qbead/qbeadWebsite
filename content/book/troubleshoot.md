---
title: Troubleshooting Guide
keywords: troubleshooting, testing, help
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>


::: intro-box
It can be frustrating when your code doesn't work 
or you can't get the Arduino software to recognize your SpinWheel.
We've created this page to help you become more comfortable troubleshooting SpinWheel issues.
:::


These tips will help you tackle the difficulties you encounter as you set up your SpinWheel and work through your first adventures. They will help you learn how to get better at diagnosing problems yourself.
As you get more comfortable with programming the SpinWheel, 
you will refer to this guide less and less and 
discover pride in getting a piece of code to work on your own.
If you have tried everything here and are still confused, 
please email mail@spinwearables.com with your problem (including a screen shot if possible) and we can help sort it out.

## I can't plug my battery into my SpinWheel

The battery fits very snuggly into its jack on the SpinWheel, so attaching your battery can be challenging. You can push with plenty of force on the plastic plug of the battery - just make sure to be careful not to twist or damage the battery's wires. Make sure the notch at the top of the battery plug is lined up with the notch on the jack on the SpinWheel itself. Use both thumbs to push the battery into place. The battery does not need to fit all the way into the jack; you just need to make sure you get good contact with the two metal leads inside the jack. 

Important! If you are using your SpinWheel with the battery (not connected to a computer), makes sure the switch on the back is on "BAT". If you are using your SpinWheel plugged into your computer, make sure the switch on the back is on "USB". 

## Arduino won't recognize my SpinWheel

If nothing appears in the port menu when you plug in the SpinWheel there are a few things to try:

1. First, unplug the SpinWheel from your computer and then plug it in again.
When you do this, make sure that you first close the `Tools` menu. 
If you didn't close it before unplugging it, you will not see a change 
because it doesn't automatically refresh itself. 

2. If this doesn't work, another thing to try is restarting the Arduino software. 
Occasionally this will clear up the problem.

3. If neither of these works, it suggests that your micro USB cable may be the problem. 
Do you have another cable you can try? If so, first try this. 
While most cables do work, 
some microUSB manufacturers have stopped including the extra wires necessary for passing information in their microUSB cables to cut costs if the cable is only meant to be used for charging. 
If your SpinWheel turns on but isn’t detected by the Arduino software, 
we recommend trying a different cable 
(we have had better luck with older cables and those from Kindles: 
cables that were intended to be used to transfer information and not just for charging). 


## My code won't upload onto my SpinWheel

If this is the first sketch you are trying to upload, 
start here and make sure that you have the correct port and board selected. Reminder: your board should say Arduino Leonardo, and your port should correspond to the port your USB cable is plugged into (see above). 
If you recently closed the software and opened it again, make sure to double check your board and port assignments, as this may be your issue.

1. This error message `avrdude: ser_open(): can't open device "/dev/cu.usbmodem142101": No such file or directory` indicates that you have the wrong board selected. To fix this, navigate to `Tools → Board:` and click on `Arduino Leonardo`.

2. If instead you have the message `avrdude: butterfly_recv(): programmer is not responding` repeating itself, then you haven't picked the right port. See the above section "Arduino won't recognize my SpinWheel" for more help.

3. Another possible problem can occur if you haven't yet installed the SpinWearables library. If you don't remember doing this, then you can install it using `Sketch → Include Library → Manage Libraries...`. In the search bar of the Library Manager, search for `SpinWearables` and then click `Install`. 

4. If you have done all of these things, you can try unplugging your SpinWheel and plugging it back in again
or try restarting the Arduino software. 
These steps will clear things up from time to time.

If your code won't upload but you have you installed other scripts successfully:

1. Try uploading another Example SpinWheel sketch. 
If this doesn't work, try the above recommendations to make sure you have the right board and port selected and to ensure that you have the necessary libraries. 

2. If other sketches work, then it is likely because of a modification that was made to the sketch you are trying to upload.
Keep reading the section on "I've tried writing my own sketch, 
but it doesn't work..." or the specific section for the adventure you are working on to get some more troubleshooting ideas.

## I've tried writing my own sketch, but it doesn't work ...

When you begin to write your own code or modify the existing sketches, 
troubleshooting becomes more challenging.
Everyone gets stuck at times when writing new code. 
This can be very frustrating, particularly when you are new to a programming language.
However, as you write more code, you will become more comfortable with this troubleshooting process.
To help you as you do this, 
here are some suggestions:

1. First make sure that you have the important setup information for each script that we presented in the [basic structure of a SpinWheel sketch lesson](/basics). 

2. Is the error that you no longer have the right port or board selected? This is easy to forget to check, but will lead your code to fail.

3. Try breaking up the task into simpler parts and testing each one individually. 
This will help you find the problem and then be more likely to be able to fix it. 
For instance, maybe you are missing a semicolon or forgot to close a parenthesis. As you break up your task into smaller parts, you may also find it helpful to look at your code line-by-line and make sure you are not missing any important pieces.

4. One thing that can help is trying out small pieces of the code on one of the virtual SpinWheels. 
Not all modifications can be tested in this way, but it can help diagnose the problem.

5. Another suggestion to help identify an error in your code is to explain your code to a "rubber duck." This doesn't mean that you need to go hunt down a rubber duck.
It simply means that by explaining what you are trying to do with every line to someone else 
(even an inanimate object who can give no feedback like a rubber duck)
you can sometimes better spot the problem. 

Arduino also has lots of helpful online resources you can find in your favorite search engine - while this won't help you with specific SpinWheel commands, you can learn a lot about general Arduino programming by looking through all of the past troubleshooting tips and tricks generated by other Arduino users. 


## I'm stuck on an Adventure...

If you are stuck trying to figure out what a piece of code that we introduce does, 
we recommend first looking at the detailed comments that we provide for each sketch.
If this doesn't answer your question, then keep reading below. If you are confused by the content in a particular adventure, we suggest you take a look at the corresponding lesson for that adventure. Check out the [table of contents](/book) to find which lessons are associated with which adventures.


### Biology of Sight

### Intro to Animation

### Animations and Patterns

### Step Counter

More instructions on finding the serial monitor

### Dancing with Color


If you have tried all of these recommendations and are still stuck, just email us at mail@spinwearables.com and we can help you troubleshoot.

