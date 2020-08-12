---
title: Arduino 101
keywords: physical computing, computer science, arduino, programming
---

::: intro-box
The SpinWheel relies on the Arduino software to be programmed.
This guide provides the important information for understanding how this software works. 
:::

Many simple computer chips for DIY projects make use of the Arduino software, 
a platform for writing and uploading code onto a physical circuit board. 
The Arduino software makes use of a simplified version of C++, 
a programming language that we will begin to introduce below.
This page will take you through the basics of using the Arduino software 
and should be used as a guide as you read the other lessons and adventures.


## Installing Arduino

To be able to write your own programs and control your computer chip, 
you first have to download the Arduino software. 
You can download it for free from [arduino.cc/en/Main/Software](https://arduino.cc/en/Main/Software#download). 
Be careful to select the correct version for your computer's operating system (for instance, if you have a  Windows computer, choose the one for the version of Windows you have).
If you get stuck, Arduino has provided [instructions](https://www.arduino.cc/en/Guide) for each operating system that you can check out for more help.

## Configuring Arduino for your device

Before we can upload a simple program, 
we have to configure the Arduino software to communicate with the device.
To do this you need to first select the `Port` under `Tools` in the main menu. 
You will see a list of serial ports on your computer; 
to find the right one, simply plug and unplug your device.
The one that disappears and reappears is the one to choose. 

Next you will have to select `Board` for the device you want to program. For instance, for the SpinWheel you would select the Arduino Leonardo as the board (a.k.a. processor), so that the software knows which <span class="footnote">“dialect” <span>Computer languages have dialects just like human languages!</span></span> to use to talk to the SpinWheel.

Properly selecting the board and port is essential for the Arduino software to communicate with whatever software you are working with.

::: further-reading
For more help with this for the SpinWheel, first read our [Initial Setup Guide](/quickstart) and then check out our [troubleshooting guide](/troubleshoot), if you are still stuck.  
:::

## The skeleton of an Arduino program

Computers follow instructions, and do not solve problems on their own. So, you need to be very explicit in the instructions that you write in your programs!
The particular language we are using imposes a certain structure on our programs.
The most bare-bones program looks like this:

```c++
void setup() {

}

void loop() {

}
```

This program does absolutely nothing.
It contains two blocks (or sections) of code which start and end 
with the brackets `{` and `}`.
For our program to do anything, we need to fill these blocks with instructions.
The first block is called `setup` and executes only once, immediately after the device is powered up.
This block is used for setting up any initial conditions we might require.

Next there is the `loop` block. This block is executed repeatedly "in a loop",
starting immediately after `setup` is done and repeating itself until the power is turned off.
Most of our instructions will be written in this block.

## Uploading a simple Arduino sketch to your device

Now we can try uploading a simple sketch!

![Upload programs to your SpinWheel using the `Upload` button (highlighted in white).](/images/quickstart/upload_button_screenshot.png "Upload programs to your SpinWheel using the `Upload` button (highlighted in white)."){style="max-width:388px"}

First, open a new sketch in the Arduino software (`File → New`). Notice how it has the `setup()` and `loop()` blocks already in place. Next, copy the text below into that new sketch and click `Upload`.


```c++
// This is the setup function that will automatically run
// first when the device starts.
void setup() {
}

// Define a variable in which we will store a counter that goes up by one on
// each step.
int counter = 1;

// This function runs repeatedly after the setup function finishes.
void loop() {
  // Increment the value of the counter.
  counter = counter + 1;
}
```

You may have noticed that nothing happens when you upload this sketch to your device. That is because this sketch simply adds one to a variable `counter` with each loop. In the next section, we will add to this sketch to see how counter increases in value.

## Receiving communication from your device

It can be very useful to have a way to receive message from the computer chip you are programming. 
For instance, in the code above you want to be able to see how counter is increasing with time.
Having this information can be very important when debugging - or attempting to find errors in - code to have a way to keep track of what the value of different variables are. 

Different computer languages provide different ways of doing this. 
If you are working with Arduino, 
then you can use the `Serial Monitor` to see these messages being sent back over the USB cable. 
To access the `Serial Monitor`, navigate to `Tools → Serial Monitor`.

Then if you want to see how a particular variable changes, 
we can setup the device to send messages at the right connection speed using `Serial.begin(9600)` 
and print the message you want using the `Serial.println()` function.
In the code below, you will use `Serial.println(counter)` 
in order to send the value of `counter` back to the computer.

```c++

// This is the setup function that will automatically run
// first when the device starts.
void setup() {
  // The next line ensures that the communication hardware
  // on our device is ready to send messages.
  // The name "Serial" is such for historical reasons
  // (it is the name for this type of communication).
  Serial.begin(9600); // The 9600 is the speed of the connection.
}

// Define a variable in which we will store a counter that goes up by one on
// each step.
int counter = 1;

// This function runs repeatedly after the setup function finishes.
void loop() {
  // Send a message to the connected computer.
  // The message will just be the value of the counter.
  Serial.println(counter);
  // Increment the value of the counter.
  counter = counter + 1;
  // Wait for 500 milliseconds (half a second) before you 
  // start the loop function again.
  delay(500);
}
```
You may have noticed that we use the `delay()` function here. 
As `loop` repeats many times in a second, we use the delay function 
so that the speed that counter is displayed through the Serial monitor
is slow enough to follow. In this case, we tell it to pause for 500 milliseconds
or half a second (there are 1000 milliseconds in a second).


These concepts will be useful as you begin to code a computer chip, 
like the one inside the SpinWheel. 
We will refer back to this guide and hope that you will use it as a reference.



