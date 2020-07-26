---
title: Learning to Program the SpinWheel
keywords: SpinWheel, arduino, setup
---

::: intro-box
This document will help you learn the basics of programming the SpinWheel's
LEDs to different color patterns.
Before reading this, be sure to read our [quick start guide](/quickstart). 
:::

Approach this page the way you would approach the first page of a foreign language you want to learn.
Try to pick out separate words and commands that make sense, without worrying about the overall structure,
correct syntax, or proper grammar. As time passes and you have learnt new things, come back to this page
and see whether you can understand a bit more of it.

In different communities, computer programs are referred to by different names:
program, sketch, script, etc.
Arduino tends to call them sketches, because in them you sketch out what your device is supposed to do.
We also like the name script, because it invokes the idea of a sequence of instructions:
the instructions you give to the device and the order in which you want them to be executed.

Computers are not particularly smart, so you need to be very explicit in your instructions.
The particular language we are using imposes a certain structure on our programs.
The most bare-bones program would look like this:

```c++
void setup() {

}

void loop() {

}
```

This program does absolutely nothing.
<span class="footnote">It contains two blocks<span>Marked by the brackets { and }.</span></span>
we need to fill out with instructions.
The `setup` which executes only once, immediately after the device is powered up.
This block is used for (surprise) setting up any initial conditions we might require.

And then there is the `loop` block. This block is executed repeatedly "in a loop",
starting immediately after `setup` is done and repeating itself until the power is turned off.
Most of our instructions will be written in that block.
They will frequently take the form of measuring time or motion,
and then producing a color or a pattern of colors depending on the measurement.

A program that is capable of instructing the hardware specific to the SpinWheel
(e.g. the LEDs and motion sensor) would require a few more incantations:

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

Notice the faded bluish text prepended by two slashes `//`. This text is called
a "comment", and it is something completely disregarded by the computer. We will
use it extensively to write down explanations for the humans that might be reading the code,
without worrying about the computer being confused by them.

The `loop` block is still empty and this program still will not do anything interesting.
However, to great extent our `setup` function is complete: it prepares the SpinWheel to
receive instructions. Through our activities, we will rarely need anything more sophisticated
in `setup`.

Finally, let us turn on an LED, by simply adding a single command to the 

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
  // Update the currently shinning LEDs
  // based on the instructions provided up to here.
  SpinWheel.drawFrame();
}
```

Try to copy this code in the Arduino software and upload it.
It should cause one single large LED to turn on in bright red.
Try to modify the `setLargeLED` line (the first parameter in the parenthesis is
the <span class="footnote">number of the affected LED<span>The number goes from 0 to 7.</span></span>
and the other <span class="footnote">three numbers are the red,
green, and blue components<span>They have to be numbers between 0 (color is off) and 255 (color is on at full brightness).</span></span> of the desired color.)

There are a couple more things you might have noticed about the style of this language:

- We tend to have only one "command" per line. This helps with readability.
- Each command is ended by a semicolon `;`. That makes it easier for the computer to separate different commands.
- Commands tend to be some name followed by parenthesis `()`.
- Inside these parenthesis we frequently put some extra information: this information can modify exactly how a command performs. For instance in `setLargeLED` we have one parameter to select the LED we want to modify and three parameters for the color of that LED.
- There certainly are other ways in which LED colors can be modified and motion be detected. We will be discussing many such tools in futures pages.

::: further-reading
If you are already accustomed to programming, you might want to see the [list of all functions provided with the SpinWheel](/allcommands). In either case, we advise you to play with the [SpinWheel examples available in the Arduino software and to peruse the many suggested activities we have prepared for you](/book). If you would like to specifically focusing on learning more about this programming language, you can see our [programming patterns page](/progpatterns).
:::
