---
title: Gesture Recognition and Recurrent Neural Networks on an Arduino
keywords: neural network, gesture recognition, arduino
---

This lesson is part of the SpinWheel series. The
[SpinWheel](https://www.kickstarter.com/projects/spinwheel/447670470)
is a small Arduino-compatible sensor-enabled wearable device, meant to be used
for teaching physics and computer science through an artistic medium. You can
support our non-profit
[Kickstarter](https://www.kickstarter.com/projects/spinwheel/447670470)
to help us reach more curious young minds and to get the device and teaching
kit showcased in this lesson.

::: intro-box
For the majority of our lessons we use the [SpinWheel](https://www.kickstarter.com/projects/spinwheel/447670470) and its [engaging aesthetics](https://spinwearables.com) as a hook and introduction to many STEM topics accessible to K12 students without prior experience. Here we decided to do something different and show how that same platform can be used to study much more advanced topics. In this writeup we will see:

- simple linear algebra and neural networks on a microcontroller
- hardware speed testing to decide how big of a NN to use
- recurrent NN from scratch as a filter and a gesture recognizer
- recording training data from a microcontroller
- visualizing information propagating through the NN
:::

::: warning
Lessons are still under development!
:::

## Brief review: Neural Networks and Recurrent Neural Networks

::: further-reading
We will not attempt to teach what a neural network is from scratch, as there is
a rich ecosystem of online resources on the topic.
[Nielsen's online book](http://neuralnetworksanddeeplearning.com/index.html)
is a great in-depth resource, but starting with
[visual introductions like Alammar's](https://jalammar.github.io/visual-interactive-guide-basics-neural-networks/)
might be more approachable, including a
[second part focusing on the simpler mathematical building blocks](https://jalammar.github.io/feedforward-neural-networks-visual-interactive/).
A lovely visual representation of the training process for a neural network can
be seen on
[Tensorflow's playground](http://playground.tensorflow.org).
Coursera and Stanford, among others, have online classes on the topic as well:
[1](https://www.coursera.org/learn/machine-learning),
[2](https://cs230.stanford.edu/),
[3](http://cs231n.stanford.edu/).
To delve deeper in **recurrent** neural networks, consider the
[Standford CS230 notes](https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-recurrent-neural-networks),
or [Karpathy's writeup](https://karpathy.github.io/2015/05/21/rnn-effectiveness/).
:::

As you can see in the detailed resources cited above, an artificial neuron is a small piece of code that:

- takes numerical input values (one value per "synapse")
- sums them up with by giving each one varying degree of importance in the sum (its "weight" or the strength of the synapse)
- applies a "threshold function", i.e. it responds differently if the sum is small or large 
- outputs this final value

Thus, by layering such artificial neurons we can input the motion sensor data
and output, after a few layers, a number representing the gesture we
have been performing while holding the device. A very important step would be
to teach or "train" the neural network to made that decision. Just like in
biology, this will be done by changing the strength of the connections between
the neurons, i.e. by finding appropriate values for the aforementioned weights.

By grouping the neurons in layers it becomes easier to write down the necessary
computer code as standard linear algebra operations. Moreover, **as gesture
recognition requires understanding the entire history of a motion**, we will
dedicate a few neurons to work as a memory, turning our neural network into a
recurrent neural network. This leads us to our architecture of choice.

### The Recurrent Neural Network of choice for our task

Our motion sensor can easily report measured acceleration and rotation 50 times
a second. This will be the input for our recurrent neural network: a
6-dimensional vector containing the acceleration and rotation speed
measurements for each of the 3 directions of space:
$$\text{input vector:}\ \ \ \vec{v}_\textrm{in}.$$
We will also reserver a vector $\vec{s}$ as a memory. With each new sensor
measurement sent to the network (50 times a second), we will update that memory
in the following way:
$$\text{memory update rule:}\ \ \ \vec{s}\leftarrow \sigma(W_s\cdot\vec{s}+U\cdot\vec{v}_\textrm{in}+\vec{b}_r),$$
Where the matrices $W_s$ and $U$ (synapse connection weights) as well as the
vector $\vec{b}_r$ (bias) are parameters to be trained. $\sigma$ is the thresholding function, for which we have chosen to use $relu$, because it is easy to compute on simple hardware.

Out of this memory we can now compute the output of the recurrent layer of the
neural network:
$$\text{recurrent layer output:}\ \ \ \vec{v}_\textrm{rec}=\sigma(W_o\cdot\vec{c}+\vec{b}_o),$$
where $W_o$ and $\vec{b}_o$ are more parameters that need to be trained.

We can repeat multiple such recurrent layers, where the output of the previous
layer is used as an input for the next layer with its own unique memory vector.
We ended up using 2 recurrent layers for our implementation, but a typical
16MHz arduino can run quite a few more of them at a rate of 50Hz if necessary.
Our memory vectors and our output vectors all have 6 dimensions.

At the very end of the neural network, we need to take the output of the last
recurrent layer and turn it into a decision of which gesture is being
performed. For simplicity we will use only three rather simple gestures for our first network:

- keeping the device steady
- shaking the device in one direction
- shaking the device in the orthogonal direction

Thus, our output vector $\vec{v}_\textrm{out}$ will have three components, each
representing the probability (or certainty of belief) that the device is
performing the corresponding gesture. As they need to sum up to one, it is
natural to use the $\textrm{softmax}$ function on a final non-recurrent neural
network layer:
$$\text{classification result:}\ \ \ \vec{v}_\textrm{out}=\textrm{softmax}(W\cdot\vec{v}_\textrm{rec}+\vec{b}),$$
where $W$ and $\vec{b}$ are the final set of parameters in need of training.

## Implementing a Recurrent Neural Network on an Arduino

The typical Arduino hardware does not directly support floating point numbers.
The compiler still lets you use them, but the generated machine code emulates
them by using the underlying integer data types. This emulation is usually
judged to be much too slow, as a simple multiplication of two floating point
numbers will take many times more than the time for an integer numbers
multiplication. If this significant overhead is making our network too slow for
the 50Hz rate at which we want to run it, we can retrain the network to use
only integers. This is, however, much more succeptible to bugs, so let us first
benchmark the performance of a typical floating point network running on a
16MHz Arduino.

We will need to implement a mock neural network to do these tests. This file
(also embedded below) contains such an implementation, together with all the
linear algebra operations that we will need.

The `network()` function is the one that looks at the globally defined array
`input`, computes one iteration of our recurrent neural network on it, and
stores the results in the globally defined array `output`. It then finds which
element of `output` is the largest, and reports it as the most probable gesture
being recorded by the device.
