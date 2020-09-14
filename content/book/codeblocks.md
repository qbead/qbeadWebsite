---
title: Color Coding
keywords: SpinWheel, getting started, experimenting
---

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

void loop() {

}
```

```c++
SpinWheel.setLargeLEDsUniform(255, 0, 255);
SpinWheel.drawFrame();
```

```c++
void setup() {

}

void loop() {

}
```


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

```c++
SpinWheel.setLargeLED(0, 255, 0, 0);
SpinWheel.drawFrame();
```

```c++
SpinWheel.setLargeLED(0, 255, 0, 0);
SpinWheel.setLargeLED(2, 255, 0, 0);
SpinWheel.setLargeLED(7, 255, 255, 255);
SpinWheel.setLargeLED(5, 255, 255, 255);
SpinWheel.drawFrame();
```

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();  
  // The next line ensures that the communication hardware
  // on our device is ready to send messages.
  // The name "Serial" is such for historical reasons
  // (it is the name for this type of communication).
  // The 9600 is the speed of the connection.
  Serial.begin(9600); 
}

void loop() {
  // This line gets the information from the SpinWheel’s
  // motion sensor.
  SpinWheel.readIMU();
  // Send a message to the connected computer.
  // The message will just be the value of the SpinWheel’s 
  // rotation around the x-axis.
  Serial.println(SpinWheel.gx);
  // Wait for 500 milliseconds (half a second) before you 
  // start the loop function again.
  delay(500);
}
```

```c++
int which_LED = 1;

```

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

```c++
int my_special_integer = 6;

```

```c++
float pi = 3.1415;
```

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(number_a, number_b);
```

```c++
int my_number = 6;
int resulting_number = max(my_number, 8);
```

```c++
int number_a = 5;
int number_b = 7;
int resulting_number = max(sqrt(number_a-1) * 2, min(number_b, 2));
```

```c++
float x = 3.5;
float y = 2.5;
float resulting_number = avg(x, y);
```

```c++
float avg(float first_argument, float second_argument) {
  return 0.5*(first_argument+second_argument);
}
```

```c++
float root4(float x) {
  float intermediate_value = sqrt(x);
  return sqrt(intermediate_value);
}
```

```c++
a = calculation1();
delay(1000);
b = calculation2();
```

```c++
void delay_seconds(int number_of_seconds) {
  int number_of_milliseconds = 1000 * number_of_seconds;
  delay(number_of_milliseconds);
}
```

```c++
// I am writing this comment to remind me 
// that the next line stores the number 5 
// in the variable named my_test_variable.
int my_test_variable = 5;
```

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  SpinWheel.begin();
}

// variable to specify which LED to light up
int which_LED = 0; 

void loop() {
  SpinWheel.setLargeLED(which_LED, 255, 0, 0); 
  SpinWheel.drawFrame(); 
  // add in a delay to make the LEDs change at a reasonable speed
  delay(500);
  // Increase the value of which_LED by 1.
  which_LED = which_LED + 1; 
}
```

