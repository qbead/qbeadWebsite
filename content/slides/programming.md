---
title: Programming the SpinWheel
keywords: spinwheel, physical computing, arduino, color, programming
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

Based on the [Basic Structure of a Program](/basics) and [Coding Building Blocks](/progpatterns) pages.

# What does a computer program look like?

---

Approach this page the way you would approach the first few lines of a foreign language you want to learn.
Try to pick out words that make sense, without worrying about the overall structure,
correct syntax, or proper grammar. As time passes and you have learned new things, come back to this page
and see whether you can understand a bit more of it.

---

## The Skeleton of an Arduino Program

```c++
void setup() {

}

void loop() {

}
```

This program does absolutely nothing.

---

<figure><video src="/images/bookpics/setup_loop.mp4" muted playsinline loop></video><figcaption> When you turn on the SpinWheel, `setup()` is run once and then the `loop()` block is run repeatedly until the SpinWheel is turned off. </figcaption></figure>

---

## Extra Elements of a SpinWheel Program

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

---

Make it light up:

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

---

![SpinWheel LED numbering.](/images/spinwheel_with_numbers.png "SpinWheel LED numbering")

---

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

---

## Creating changing patterns

To begin writing more complex code, we need to introduce the idea of *variables*.
Variables allow us to store information in the program and change that information as needed.

To **define** a new variable we can add the following line to the loop block:

```c++
int which_LED = 1;
```

---

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

---

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

---

<video src="/images/bookpics/brightness_loop.mp4" muted playsinline loop></video>

---

### Additional Programming Notes

- Only one "command" per line. This makes the code more readable.
- Command are followed by a semicolon `;`. 
- Commands tend to be some name followed by parentheses `()`.
- Inside these parentheses we put some extra information: this information can control how a command performs.

# Building Blocks for your Program

---

## Variables

Before processing data, we have to tell the computer to store it
in its memory. This is done using **variables**.

---

!["Variables" are like labeled shelves for information. When you need to save a number for later use, you put it in a variable of your choice. Above we have number 3 stored in the variable `a`, number 4 stored in variable `b` and the number 7 is about to be stored in a variable named `e`. We can pick the names for the variables ourselves (any sequence of letters that is not interrupted by whitespaces). <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/variables.png)

---

We will only discuss two types of variables: integers and
decimals. Other types do exist, but we won't cover them here. 

To **define** a new integer variable you need the following line in your code:

```c++
int my_special_integer = 6;

```

---

If we want to work with decimals, we use the variable type `float`
instead of `int`. The name comes from the early history of computers and is
unimportant for our purposes (how the decimal point can "float" between the digits).

```c++
float pi = 3.1415;
```

---

## Functions

In computer programming, functions are commands that take a few variables and
do something useful with them. Functions are reusable pieces of code. 

---

Here is some code that uses an example function called `max` that takes two
numbers as input and returns the larger number. The input values are also called the
**arguments** of the function.

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

---

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

The value stored in `resulting_number` in this case would be `7`. 

---

![Functions are tools provided in a given programming language that are capable of ingesting a number of parameters and producting (a.k.a "returning") some new value that depended on the input parameters. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/functions.png)

---

```c++
int number_a = 5;
int number_b = 7;
int result = max(sqrt(number_a-1) * 2, min(number_b, 2));
```

<figure><video src="/images/bookpics/calc_tree.mp4" muted playsinline loop></video><figcaption>
</figcaption></figure>

---

## Creating your own functions

---

![Now we have the pieces to begin to create our own functions. In the beginning, this may be like creating a poem using a limited set of magnetic word tiles. With practice, your bank of pieces will increase in size, enabling you to write more complicated code. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/creating_own_functions.png)

---

```c++
float x = 3.5;
float y = 2.5;
float resulting_number = avg(x, y);
```

In this code example, `resulting_number` will have the value of `3.0`.

---

To define this new function, we need to write down its name, together with the type of data it will be producing, followed by a set of computational instructions:

```c++
float avg(float first_argument, float second_argument) {
  return 0.5*(first_argument+second_argument);
}
```

---

## Functions that do not return values

```c++
a = calculation1();
delay(1000);
b = calculation2();
```

---

## Comments

```c++
// I am writing this comment to remind me
// that the next line stores the number 5
// in the variable named my_test_variable.
int my_test_variable = 5;
```
