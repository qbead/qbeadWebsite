---
title: Basic Programming Patterns
keywords: physical computing, computer science, arduino, programming
---

Writing a computer program of your own, whether a desktop app, an interactive
website, or the hidden brain of a robot, starts by writing a sequence of
instructions in one of the many available computer languages. Some such
languages are incredibly complex and picky about the correctness of the written
instructions: a small "grammar" error and the computer cannot understand what
you wanted from it. Other languages are simpler, and even somewhat lenient in
the format of the instructions written in them. Using such languages usually
requires a more powerful computer, as it takes a lot of resources to teach a
computer how to deal with even a fraction of the vagueness and imprecision of
human languages.

The vast majority of computer languages do share a number of patterns, just
like many human languages share ideas like the distinction between a noun and a
verb, or the difference between a word and a sentence. We will describe the
most important such patterns in this chapter. We will use a very popular older
language that runs well on limited hardware like the SpinWheel's
microcontroller. The name of the language is `C++`.

# Variables

Computer programs do one thing and one thing only: process information. That
information can be the time when a click happened in a game, or the recording of your
voice on your phone, or it can be a picture of the road in a self-driving car.
Before processing such data, we need a way to instruct the computer to store it
in its memory. This is done through **variables**.

For the moment we will discuss only two types of variables: integer numbers and
fractions.  Integers are easier for the computer to work with, because it does
not need to track all the data behind the decimal point. Treating them
separately from fractions lets us have faster code, which is especially
important for small computers like ours.

To **define** a new integer variable you need the following line in your code:

```c++
int my_special_integer = 6;

```

This reserves a location in the memory of the computer, called a cell, lets us refer to that cell
by the name `my_special_integer` and stores the value `6` in it. We can name
the variable however we wish as long as it is a single word or multiple words
separated with underscores. We usually pick names that tell us something about
the purpose of the variable. We can put whatever value we wish as long as it is
not too big (bigger than roughly 30 000). There are ways to store bigger
numbers too, but they take more memory, which we might not have much of in a
small wearable micro computer.

Similarly, if we want to work with fractions, we use the variable type `float`
instead of `int`. The name comes from the early history of computers and is
unimportant for our purposes.

```c++
float pi = 3.1415;
```

Above we stored the number $\pi$ in a variable with the name `pi`, which would
let us use it in other parts of our code if we need to do computations that
involve circles.

# Functions

Functions, also known as routines, are commands that take a few variables and
do something useful with them. They could compute a new value based on the
variables that were given to them and then provide this value so that we
can store it for future use. They could also do something that affects the world
around them, like blinking an LED, playing a sound, or sending a message.

Some functions are already built into the programming language, similar to how
a new cell phone comes with pre-installed apps. We can use these functions without
having to write them ourselves.
Here is an example function called `max` that takes two
numbers and it returns the larger of the two.

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

The value stored in `resulting_number` in this case would be `7`. The variables
number\_a and number\_b are called the `arguments` of the function. 

Here is another example where one of the arguments for our function is
specified directly, without first being stored in a variable. In this case, the
value stored in `resulting_number` will be `8`:

```c++
int my_number = 6;
int resulting_number = max(my_number, 8);
```

As you have seen, the typical syntactic rules for the use of a function is to
put its arguments inside parenthesis immediately after the name of the
function. You might have seen this in math class with trigonometric functions
like $\sin{(x)}$ or $\cos{(x)}$.

We can nest functions and use arithmetic operations on the arguements as well. For instance, here
we will use two more functions, `min` which returns the smaller of two numbers
and `sqrt` which returns the square root of a given number. Could you explain
why the value stored in `resulting_number` in the following example is `4`?
Here is a hint: $\sqrt{5-1}=\sqrt{4}=2$.

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(sqrt(number_a-1) * 2, min(number_b, 2));
```

Notice that through all of this code we have used the equality sign `=` to mean
"store the value on the right in the memory cell on the left". This differs
from the usual mathematical meaning of the sign, which is usually meant to say
"check if the left and right side have the same value". You can blame early
computer scientists and their laziness for the misuse of this sign in most
modern programming languages.

# Creating your own function

A large part of programming is creating your own functions and building
interesting, complex and useful functions out of small simple functions. Here we
give an example of how to write your own function that takes two numbers, $x$ and $y$,
and it returns their average, $\frac{x+y}{2}$. 
We will name the function `avg`. Let us first write
an example of how this function would be used if it already existed:

```c++
float x = 3.5;
float y = 2.5;
float resulting_number = avg(x, y);
```

In this code example, `resulting_number` will have the value of `3.0`.

To define this new function, we need to write down its name, together with the type of data it will be producing, followed by a set of computational instructions:

```c++
float avg(float first_argument, float second_argument) {
  return 0.5*(first_argument+second_argument);
}
```

Let's step through each part of this code.

* `float avg(.....)`: The very first `float` in this piece of code is necessary because the computer
needs to know what type of values the function will provide (in this case they
are fractions). Then we have the name we have picked for our function, `avg`. 
* `float first_argument, float second_argument` : In parentheses, we have a list of the arguments the function
will be taking. Unlike when we call the function, we have to specify their types, 
so we wrote `float` to denote working with fractions. We also gave
temporary names for these arguments, so that we can refer to them in the
expression that is making up the function. 
* `{ ... }` : The open and close bracket surround the instructions of our code.
* `0.5*(first_argument+second_argument) ` : This where the math happens in our
function. It is simply the sum of the two arguments multiplied by one-half. 
* `return` : a keyword to mark this line as code as the result
coming from (**returned by**) this function to be returned to the code that called the function.

We can have multiple sequential instructions inside the block in case the
computation is more difficult. That is the purpose of the figure brackets `{ }`
- to separate all the code that defines our function from the rest of the
program. For instance, here we will show how to compute the 4th root of a
number:

```c++
float root4(float x) {
  float intermediate_value = sqrt(x);
  return sqrt(intermediate_value);
}
```

# Functions that do not return values

Functions are occasionally used to change something in the environment of the
device instead of being used as advanced calculators. Such functions do not return a value
and so they do not need any extra variables in which to store their output. One
example of such a function would be the `delay` function that simply pauses the
computer for a specified time. The following example will stop everything and
wait for 1000 milliseconds (which is one second):

```c++
delay(1000);
```

When creating our own functions of this type, we mark them as `void`, instead
of `int` or `float` or something else, to denote that their returned value is
void or "empty". For instance, here we define a function that always pauses the
program for exactly half a second:

```c++
void delay_half_a_second() {
  delay(500);
}
```

Notice how we did not need to use the `return` keyword. In this particular case
we also did not have any parameters in the parentheses that defined our
function, but we can very well have such parameters if we wish. For instance,
this function takes numbers of seconds as its input and pauses the program for
that long (by calculating the number of milliseconds corresponding to the given
number of seconds and using the `delay` function).

```c++
void delay_seconds(int number_of_seconds) {
  int number_of_milliseconds = 1000 * number_of_seconds;
  delay(number_of_milliseconds);
}
```

# Comments

As the code we write grows more and more, it helps to add notes in the code to
ourselves and our friends. That way it is easier to understand the purpose of
the code when we look at it again in the future. Such notes are usually called
"comments", and they are completely ignored by the computer. In the language
we are using they are denoted by a double slash `//` -- everything to the right
of these symbols, until the end of the line, is a message for fellow humans. We
will use such comments below in some more complicated examples of code.

```c++
// I am writing this comment to remind me that the next
// line stores the number 5 in the variable named my_test_variable.
int my_test_variable = 5;
```

# The first function to run when a program starts

After we have created all the variables we will need and all of our special
functions that will help us do what we want, we need to actually start the
program. But the program needs to know what to run first. In different
languages this is done differently, but in our particular case we do it by
defining two special functions: `setup` and `loop`. Our computer is instructed
to run these functions first: It looks at the `setup` function and runs it
first, before anything else. Usually this function is used to **set up** any
settings we might need in advance. Then the computer repeatedly runs the `loop`
function, which is named this way exactly because it **runs in a loop**.

Here is a large example that includes all these features. It will use the
`Serial.println()` function in order to send messages to the computer.

```c++
// First we define a convenient pausing function
// that waits a given number of seconds
void delay_seconds(int number_of_seconds) {
  int number_of_milliseconds = 1000 * number_of_seconds;
  delay(number_of_milliseconds);
}


// This is the setup function that will automatically run
// first when the device starts.
void setup() {
  // The next line ensures that the communication hardware
  // on our device is ready to send messages.
  // The name "Serial" is such for historical reasons
  // (it is the name for this type of communication).
  Serial.begin(9600); // The 9600 is the speed of the conection.
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
  // Wait for a second before you start the loop function again.
  delay_seconds(1);
}
```

::: further-reading
The Arduino community has very detailed resources on the programming language
that we are using. You can start with their
[tutorial](https://www.arduino.cc/en/Tutorial/Foundations) for instance.
:::
