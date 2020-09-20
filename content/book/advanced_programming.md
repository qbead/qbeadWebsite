---
title: Advanced Programming
keywords:  types, memory, loop, for, while
---

<link rel="stylesheet" href="/simspinwheel/simspinwheel.css">
<script src='/simspinwheel/simspinwheel.js'></script>

::: intro-box
Now that you are pretty familiar with some basic coding structures and
how to use them on the SpinWheel, it is time to learn some more advanced
coding structures and concepts. If you would like to refresh yourself on some
of the basic programming structures before this lesson, you can read our 
[Basic Structure of a Program](/basic) page. 
:::

## Control Statements
In programming, a control statment is any statement (or line of code) which determines whether or not other statments or other lines of code
will be executed. There are a few different types of control statements. We will cover two different types in this lesson: *if statments* and *loops*. 
These more advanced structures are essential tools that enable a programmer (like yourself) to write more complicated instructions. 

### If Statements
You might have already seen an if statment in the [Dancing with Color adventure](/dancing). If statements generally contain a line or lines of code in a 
block that is only executed `if` a given statement is true. The general layout of an if statement is shown below

```c++
if(condition){
  // some code which will be run if the condition is true. 
}
```

Now let's come up with a way to use an if statement on the SpinWheel. We will do this by modifying 
an example in the [Basic Structure of a Program Lesson](/basic). In this example, we only light up the 
corresponding LED `if` the condition is true. In this case the condition is `which_LED % 2 == 0` which 
is a line of code that checks whether or not the variable `which_LED` is an even number. If it is an 
even number, then the corresponding LED will light up. If `which_LED` is not an even number, we will 
skip the block of code and no light up the corresponding LED. 

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

// Variable to specify which LED to light up.
int which_LED = 0; 

void loop() {

  // check if which_LED is even
  if(which_LED % 2 == 0 ){
    // clear all the LEDs 
    SpinWheel.clearAllLEDs();
    
    // Light up the specified LED.
    SpinWheel.setLargeLED(which_LED, 255, 0, 0); 
    SpinWheel.drawFrame();
  }
  
  // Add in a delay to make the LEDs change at a reasonable speed.
  delay(500);
  // Increase the value of which_LED by 1.
  which_LED = which_LED + 1; 
}
```

If statements are also often called `if/else` statements. This is because we can include an `else` statement
in addition to an `if` statement to specify a block of code which will be executed if the condition of the 
`if` statement is false. The general layout of an if/else statement is shown below. 

```c++
if(condition){
  // some code which will be run if the condition is true.
}
else{
 // some code which will be run if the condition is false
}
```
 
If we want to further extend this structure we can also add an `else if` statement to allow us to check multiple
conditions at once. The general layout of a program using these three types of statements is shown below.

```c++
if(conditionA){
  // some code which will be run if conditionA is true.
}
else if(conditionB){
 // some code which will be run if conditionA is false and conditionB is true.
}
else{
 // some code which will be run if the conditionA is false and conditionB is false.
}
```

Now let's return to our original example and add in some if/else statements. Here we use these statements
to change the color of the LED that lights up depending on the value of `which_LED`. 

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

// Variable to specify which LED to light up.
int which_LED = 0; 

void loop() {
  // clear all the LEDs 
  SpinWheel.clearAllLEDs();
  
  // if which_LED is less than 3
  // make the LED red
  if(which_LED < 3){  
    // Light up the specified LED.
    SpinWheel.setLargeLED(which_LED, 255, 0, 0); 
  }
  // if which_LED is less than 6
  // make the LED blue
  else if(which_LED < 6){
    // Light up the specified LED.
    SpinWheel.setLargeLED(which_LED, 0, 255, 0); 
  }
  // if which_LED is greater than 6
  // make the LED green
  else{
   SpinWheel.setLargeLED(which_LED, 0, 0, 255);  
  }

  // light up the corresponding LED
  SpinWheel.drawFrame();
  
  // Add in a delay to make the LEDs change at a reasonable speed.
  delay(500);
  // Increase the value of which_LED by 1.
  which_LED = which_LED + 1; 
}
```

If you're curious about other ways to integrate `if/else` statements into your SpinWheel code, 
refer to the advanced adventures such as the [Dancing with Color adventure](/dancing).

### Loops

Loops are another type of control statement which determine the number of times a set of instructions are exectued. In this lesson, 
we will discuss two different types of loops: *for loops* and *while loops*. 

A for loop is typically used to execute a set of instructions a specified number of times. The general layout of a for loop is 
shown below. As we can see in this example, there are a few different parts of a for loop. One part is the initializer, which is a statement
to be executed one time before the execution of the code block. Typically this is used to initialize a *looping variable* which keeps track of 
what loop the program is on. Another part of a for loop is the condition. This condition will be checked at the start of each time through the 
loop. If the condition is not true, the code block inside the for loop will not be executed. The final part of a for loop is the statement. The 
statement is a line of code which will be executed every time after the code block has been executed. 
```c++
for ( initializer; condition; statement ){
    // code block to be executed
}
```
To better understand this, we will step through an example (shown below). When the computer begins to execute this for loop, 
it first executes the initializer. In this case, the initializer sets the value of our looping variable to 0. Then the condition 
is checked. In this case `i = 0` which of course is less than 2. Therefore, the code block will be executed and the value of i
(which is now 0) will be printed. Now, we will execute the statement, `i++`. This increases the value of i to be 1. Now, we start this 
process again. As the initializer is only executed once, this time through the loop we begin by checking the condition. The value of i 
is still less than 2, so we still execute the code block and print the value of i (which is now 1). We will then execute the statement 
and the value of i is now 2. This time through the loop, when we check the condition, the value of i is no longer less than 2. 
Therefore, the code block would no longer be executed and the computer would move to the next instruction.  


```c++
for (int i = 0; i < 2; i++ ){
    // code block to be executed
    Serial.print(i); 
    Serial.println(); 
}
```

Another type of loop is a *while loop*. A while loop executes its code block only *while* a given condition is true. The
general structure of a while loop is shown below. 
```c++
while(conditon){
    // code block to be executed while the condition is true
}
```

We can additionally adapt our example from before to have the same output, but to use a while loop. This will perform the 
same task as the for loop above and will print the value of i as long as it is less than 2. 

```c++
int i = 0; 
while(i < 2){
    Serial.print(i);
    Serial.println();
    i++;
}
```
::: warning :
If you put a condition in a while loop which will always be true, the loop will run forever creating what 
is called an *infinite loop*. You can always manually stop the execution of code if you suspect an infinite loop, 
but it is always a good idea to double check for this type of error before running. 
:::