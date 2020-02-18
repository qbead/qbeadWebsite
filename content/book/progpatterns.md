---
title: Basic Programming Patterns
keywords: physical computing, computer science, arduino, programming
---

Writing a computer program of your own, whether a desktop app, an interactive
website, or the hidden brain of a robot, starts by writing a sequence of
instructions in one of the many available computer languages. Some such
languages are incredibly complex and picky about the correctness of the written
instructions: a small "grammar" error and the computer can not understand what
you wanted from it. Other languages are simpler, and even somewhat lenient in
the format of the instructions written in them. Using such languages usually
requires a more powerful computer, as it takes a lot of resources to teach a
computer how to deal with even a fraction of the vagueness and imprecision of
human languages.

The vast majority of computer languages do share a number of patterns, just
like many human languages share ideas like the distinction between a noun and a
verb, or the difference between a word and a sentence. We will describe the
most important such patterns in this chapter. We will use a very popular older
language that runs well on limited hardware like the SpinWheel's micro
controller. The name of the language is `C++`.

# Variables

Computer programs do one thing and one thing only: process information. That
information can be when a click happened in a game, or the recording of your
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

This reserves a cell in the memory of the computer, lets us refer to that cell
by the name `my_special_integer` and stores the value `6` in it. We can name
the variable however we wish as long as it is a single word or multiple words
separated with underscores. We usually pick names that tell us something about
the purpose of the variable. We can put whatever value we wish as long as it is
not too big (bigger than roughly 30 000). There are ways to store bigger
numbers too, but they take more memory, which we might not have much off in a
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
do something useful with them. Maybe they compute a new value based on the
variables that were given to them and then they provide this value so that we
can store it for future use. Or maybe they do something that affects the world
around them, like blinking and LED, playing a sounds, or sending a message.

Here is an example of the former, a function called `max` that takes two
numbers and it returns the larger of the two.

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

The value stored in `resulting_number` in this case would be `7`.

Here is another example where one of the arguments for our function is
specified directly, without first being stored in a variable. In this case the
value stored in `resulting_number` will be `8`:

```c++
int my_number = 6;
int resulting_number = max(my_number, 8);
```

As you have seen the typical syntactic rules for the use of a function is to
put its arguments inside parenthesis immediately after the name of the
function. You might have seen this in math class with trigonometric functions
like $\sin{(x)}$ or $\cos{(x)}$.

We can nest functions and use arithmetic operations as well. For instance, here
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

The programming language would not always have all the functions you might
need. A large part of programming is creating your own functions and building
interesting complex useful functions out of small simple functions. Here we
will give an example of how to write your own function that takes two numbers
and it returns their average. If the two numbers are $x$ and $y$, we want to
computed $\frac{x+y}{2}$. We will name the function `avg`. Let us first write
an example of how this function would be used if it already existed:

```c++
float number_a = 3.5;
float number_b = 2.5;
float resulting_number = avg(number_a, number_b);
```

In this code example `resulting_number` will have the value of `3.0`.

To define this new function we need to write down its name, together with the type of data it will be producing and followed by a block of computational instructions:

```c++
float avg(float first_argument, float second_argument) {
  return 0.5*(first_argument+second_argument);
}
```

The very first `float` in this piece of code is necessary because the computer
needs to know what type of values the function will provide (in this case they
are fractions). Then we have the name we have picked for our function, namely
`avg`. Then, in parentheses, just as if we are applying the function, we have a
list of the arguments the function will be taking. We have to specify their
types, so we wrote `float` to denote working with fractions. We also gave
temporary names for these arguments, so that we can refer to them in the
expression that is making up the function. In our case, this expression is
simply the sum of the two arguments multiplied by one-half. We use the `return`
keyword just in front of this expression, in order to mark it as the result
coming from (**returned by**) this function.

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

# The first function to run when a program starts

`setup` and `loop` are functions you always have to define, because the computer searches for them when it starts a new program.

# conditions and loops are for the next lesson

# rename the lesson

# link to https://www.arduino.cc/en/Tutorial/Foundations
