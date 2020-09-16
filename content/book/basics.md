---
title: Basic Structure of a Program
keywords: SpinWheel, arduino, setup, programming
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
A program is a set of written commands for your computer to follow.
Here you will see what such a program might look like in one particular computer language.
Before reading this, be sure to read our [Initial Setup Guide](/quickstart). 
:::

Approach this page the way you would approach the first few lines of a foreign language you want to learn.
Try to pick out words that make sense, without worrying about the overall structure,
correct syntax, or proper grammar. As time passes and you have learned new things, come back to this page
and see whether you can understand a bit more of it.

In different communities, computer programs are referred to by different names:
program, sketch, script, etc.
Arduino tends to call them sketches because you use them to sketch out what you want your device to do.
We also like the name script, because it invokes the idea of a sequence of instructions. The programs you write are a set of instructions you give to the device and the order in which you want them to be executed.

## Writing your First Sketch

Computers follow instructions. They do not solve problems on their own. So, when writing a program for the SpinWheel's onboard computer, you need to be very explicit in the instructions that you write!

### The Skeleton of an Arduino Program

The particular language we are using requires our programs to have a certain structure.
The most bare-bones program looks like this:

```c++
void setup() {

}

void loop() {

}
```

This program does absolutely nothing.
It contains two blocks (or sections) of code which start and end 
with the brackets: `{` and `}`.
For our program to do anything, we need to fill these blocks with instructions.
The first block is called `setup` and runs only once, immediately after the device is powered up.
This block is used for setting up any initial conditions we might require.

Next there is the `loop` block. This block is executed repeatedly "in a loop",
starting immediately after `setup` is done and repeating itself until the power is turned off.
Most of our instructions will be written in this block.
They will frequently involve measuring time or motion
and then producing a color or a pattern of colors depending on the SpinWheel's measurement.

<figure><video src="/images/bookpics/setup_loop.mp4" muted autoplay playsinline loop></video><figcaption> When you turn on the SpinWheel, `setup()` is run once and then the `loop()` block is run repeatedly until the SpinWheel is turned off. </figcaption></figure>

### Extra Elements of a SpinWheel Program

To produce a program capable of sending instructions to the hardware of the SpinWheel
(e.g. the LEDs and motion sensor), our program requires a few more lines:

```c++
// Include extra resources and commands
// specific to the SpinWheel.
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Instruct the specific SpinWheel hardware
  // to be ready to receive instructions.
  SpinWheel.begin();
}

void loop() {

}
```

Adding `#include "SpinWearables.h"` and `using namespace SpinWearables;` before the `setup` block ensures that the rest of the program has access to extra resources and commands specific for programming your SpinWheel. 
It is also necessary to add `SpinWheel.begin();` in the `setup` block. 
This line makes sure that the SpinWheel hardware is ready for the instructions that we will add in `loop` in the next chunk of code. 
When you start writing other programs for the SpinWheel, these extra lines will be essential.

Notice the faded bluish lines that begin with two slashes `//`. This text is called
a "comment." 
By starting the line with `//`, the computer is told to 
completely disregard everything else on the line. 
If you reread the comments above, you will notice that they give the same information as we wrote in the paragraph above.
We will use comments extensively to write down explanations for ourselves and any other humans that might be reading the code,
without worrying about the computer being confused by them.

The `loop` block is still empty and this program still will not do anything interesting.
However, our `setup` section is complete: it prepares the SpinWheel to
receive instructions. Through our activities, we will rarely need anything more sophisticated
in `setup`.

Finally, let us turn on an LED by simply adding a single command to the block of code we started above.

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

void loop() {
  // Set the large LED number 0 to
  // have red=255, green=0, and blue=0 color.
  SpinWheel.setLargeLED(0, 255, 0, 0);
  // Update the currently shining LEDs
  // based on the instructions provided up to here.
  SpinWheel.drawFrame();
}
```

Try to copy this code into a new file in the Arduino software and upload it to your SpinWheel. To open a new sketch in Arduino, click on `File → New`. 
This will open a blank sketch with only the empty `setup` and `loop` blocks from above.
It should cause one single large LED to turn on in bright red.
You can modify the `setLargeLED` line to change the appearance of the SpinWheel.
The first item (also called a "parameter") in the parentheses 
 <span class="footnote">identifies the affected LED<span>The number goes from 0 to 7.</span></span>
and the other <span class="footnote">three numbers are the red,
green, and blue components<span>They have to be numbers between 0 (color is off) and 255 (color is on at full brightness).</span></span> of the desired color. Together, this line of code looks something like: `SpinWheel.setLargeLED(LED_you_want_to_change, amount_of_red, amount_of_green, amount_of_blue)`. 

::: further-reading
To remind yourself how to make any color you want using only red, green, and blue, check out the [Biology of Sight](/sight) adventure. 
:::

Check out the diagram below to see how to refer to each individual LED of the SpinWheel:

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

Play around with lighting up all of the different large LEDs, or combinations of them! Before trying to modify the code through the Arduino interface, you can experiment with this virtual SpinWheel to light up the LEDs of your choice. What happens when you run the following code on the virtual SpinWheel or on your physical SpinWheel? How would you modify this code to light up the opposite set of large LEDs?


<div class="ssw-codecontent" markdown=0>
<pre class="ssw-codeblock">
void loop() {
</pre>
<textarea class="ssw-codeblock">
  SpinWheel.setLargeLED(0, 255, 0, 0);
  SpinWheel.setLargeLED(2, 255, 0, 0);
  SpinWheel.setLargeLED(7, 255, 255, 255);
  SpinWheel.setLargeLED(5, 255, 255, 255);
  SpinWheel.drawFrame();
</textarea>
<pre class="ssw-codeblock">
}
</pre>
</div>

These virtual SpinWheels show up in many of our adventures as a way to test and experiment with your code and see what the result might look like before uploading to your real SpinWheel! The virtual Spinwheels will only show the `loop` block of the code. Make sure to add the `setup` block when copying into the Arduino software!

::: further-reading
If you are eager to customize the SpinWheel in other ways (for instance by lighting up the small LEDs), check out the [list of ways to manipulate the SpinWheel's LEDs](/allcommands) we have created. 
For each of the functions introduced, there is a virtual SpinWheel to allow you to experiment with the code and become comfortable with how it works.
:::

## Creating changing patterns

In order to produce more dynamic patterns on our SpinWheel, we have to modify the loop section. Currently, every loop produces the same result; the same LED is lit up with the same color. To begin writing more complex code, we need to introduce the idea of *variables*.
Variables allow us to store information in the program and change that information as needed.

To **define** a new variable we can add the following line to the loop block:

```c++
int which_LED = 1;

```
This reserves a location in the memory of the computer, 
lets us refer to that location by the name `which_LED`,
and stores the value `1` there. By itself, this variable doesn't impact the output of the SpinWheel, but we can use it to store the location of the LED we want to light up.

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

void loop() {
  int which_LED = 1;
  SpinWheel.setLargeLED(which_LED, 255, 0, 0);
  SpinWheel.drawFrame();
}
```
Try to copy this code into a new file in the Arduino software and upload it to your SpinWheel. If you change the value of `which_LED`, you'll see a different LED light up.

::: further-reading
To learn more about variables and other important concepts for creating programs, check out our [lesson on the building blocks of programming](/progpatterns). 
We encourage you to go back and forth between these pages as you deepen your understanding of programming the SpinWheel.
:::

In this code, every loop still produces the same result; `which_LED` has the same value every time `loop()` is run. Lets modify the code to change the selected LED every time loop is run.

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

// We have to declare which_LED outside of the loop to change it every loop
int which_LED = 0; 

void loop() {

  // clear all LEDs
  SpinWheel.clearAllLEDs();
  
  // Turn on 1 LED
  SpinWheel.setLargeLED(which_LED, 255, 0, 0);
  SpinWheel.drawFrame();
  
  // change the LED to use
  which_LED = which_LED + 1;
  
  // pause the code to delay running the next loop
  delay(500);
  
}
```
In this code, every loop increases the value of `which_LED` by 1. This value is then used in `SpinWheel.setLargeLED()` to indicate which LED to light up. This concept is further illustrated below. As each `loop()` block is run, the value stored in memory for `which_LED` is changed. Because the `loop` block runs many times a second, we have added the line `delay(500)` to pause the code for 500 milliseconds (0.5 seconds) before finishing the loop. Without the delay, the lights would change too quickly for us to see the change.

<video src="/images/bookpics/brightness_loop.mp4" muted autoplay playsinline loop></video>

You may have noticed that after a few seconds your SpinWheel stops lighting up. This is because the value in `which_LED` no longer corresponds to one of the 8 LEDs on the SpinWheel. For example, if `which_LED` equals 10, the code will try to turn on LED number 10. Since it doesn't exist, nothing happens. To light up the SpinWheel again, unplug it and toggle the BAT/USB switch. This restarts the code, running `setup` again and starting `which_LED` over at 0.

You have now written your first piece of code for the SpinWheel!

::: further-reading
What if instead you wanted this pattern to repeat itself over and over again? 
Check out the adventure on [creating computer generated animations](/animation) to learn how!  
:::

### Additional Programming Notes

There are a couple more things you might have noticed about the style of this programming language:

- We tend to have only one "command" per line. This makes the code more readable.
- Each command is followed by a semicolon `;`. That makes it easier for the computer to separate different commands.
- Commands tend to be some name followed by parentheses `()`.
- Inside these parentheses we frequently put some extra information: this information can control how a command performs. For instance, in `setLargeLED` we have one parameter that selects the LED we want to modify and three parameters for the color of that LED.
- There are other ways in which LED colors can be modified and motion be detected. We will be discussing many such tools in future pages.

::: further-reading
We invite you to play with the SpinWheel examples available in the Arduino software and to peruse [the many suggested activities we have prepared for you](/book). To learn more about the programming language used by the SpinWheel, check out our lesson on the [building blocks of coding](/progpatterns). If you are already accustomed to programming, you might want to see the [list of all functions provided with the SpinWheel](/allcommands) or to peruse the [code of the SpinWearables library](/codedoc/SpinWearables.h.html). 
:::




