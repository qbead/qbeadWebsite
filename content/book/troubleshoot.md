---
title: Troubleshooting Guide
keywords: troubleshooting, testing, help
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>


::: intro-box
It can be frustrating when your code doesn't work 
or you can't get the software to recognize the SpinWheel.
We've created this page to help you become more comfortable troubleshooting what is wrong with the SpinWheel for yourself.
:::


These tips will help you tackle the difficulties you encounter and 
learn how to get better at diagnosing problems yourself.
As you get more comfortable with programming the SpinWheel, 
you will refer to this guide less and less and 
discover the pride to getting a piece of code to work on your own.
If you have tried everything here and are still confused, 
please email mail@spinwearables.com with your problem and we can help sort it out.

## Arduino won't recognize my SpinWheel

If nothing appears in port when you plug in the SpinWheel there are a few things to try:

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
start here and make sure that you have the correct port and board selected. 
If you recently closed the software and opened it again this may be your issue.

1. This error message `avrdude: ser_open(): can't open device "/dev/cu.usbmodem142101": No such file or directory` indicates that you have the wrong board selected. To fix this, navigate to `Tools → Board:` and click on `Arduino Leonardo`.

2. If instead you have the message `avrdude: butterfly_recv(): programmer is not responding` repeating itself, then you haven't picked the right board. Try the other board and this should now work. If it doens't, then seee the above section "Arduino won't recognize my SpinWheel" for more help.

3. Another possible problem can occur if you haven't yet installed the SpinWearables library. If you don't remember doing this, then you can install it using `Sketch → Include Library → Manage Libraries...`. In the search bar of the Library Manager, search for `SpinWearables` and then click `Install`. 

4. If you have done all of these things, you can try unplugging your SpinWheel and plugging it back in again
or try restarting the Arduino software. 
This will clear things up from time to time.

Have you installed other scripts succesfully? 

1. If so, try uploading another Example SpinWheel sketch. 
If this doesn't work, try the above recommendations to make sure you have the right board and port selected and to ensure that you have the necessary libraries. 

2. If other sketches work, then it is likely because of a modification to the sketch you are trying to upload.
Keep reading the section on "I've tried writing my own sketch, 
but it doesn't work..." or the specific section for the adventure you are working on.


## I'm stuck on an Adventure...

If you are stuck trying to figure out what a piece of code that we introduce does, 
we recommend first looking at the detailed comments that we provide for each sketch.
If this doesn't answer your question, then keep reading below.

### Biology of Sight

### Intro to Animation

### Animations and Patterns

### Step Counter

More instructions on finding the serial monitor

### Dancing with Color

## I've tried writing my own sketch, but it doesn't work ...

When you begin to write your own code or modify the existing sketches, 
troubleshooting becomes more challenging.
Everyone gets stuck at times when writing new code. 
This can be very frustrating, particularly when you are new to a language.
However, as you write more code, you will become more comfortable with this process.
To help you as you do this, 
here are some suggestions:

1. First make sure that you have the important setup information for each script that we presented in the [basic structure of a SpinWheel sketch lesson](/basics). 

2. Is the error that you no longer have the right port or board selelcted? This is easy to forget to check, but will lead your code to fail.

3. Try breaking up the task into simpler parts and testing each one individually. 
This will help you find the problem and then be more likely to be able to fix it. 
For instance, maybe you are missing a semicolon or forgot to close a parenthesis.

4. One thing that can help with the last section is to try out small pieces of the code on one of the virtual SpinWheels. 
Not all modifications can be tested in this way, but it can help diagnose the problem.

5. Another suggestion to help identify an error in your code is to explain your code to a "rubber duck." This doesn't mean that you need to go hunt down a rubber duck.
It simply means that by explaining what you are trying to do with every line to someone else 
(even an inanimate object who can give no feedback like a rubber duck)
you can sometimes better spot the problem. 


If you have tried all of these recommendations and are still stuck, just email us at mail@spinwearables.com and we can help you troubleshoot.

