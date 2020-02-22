---
title: SpinWheel Basic Programming Interface
keywords: SpinWheel, arduino, setup, programming, API
---

The [SpinWheel library](/software/SpinWearablesFirmware.zip) `SpinWearables.h` has a number of easy to use functions with which to build elegant new visual patterns. A typical SpinWheel demo would have this general form:

```c++
#include "SpinWearables.h"
using namespace SpinWearables;

void setup() {
  // Prepare the SpinWheel hardware, in particular the
  // built-in motion sensor.
  SpinWheel.begin();
  
  // Set the overal brightness of the large LEDs.
  // It can be necessary if you want to avoid blinding
  // the people around you.
  SpinWheel.largeLEDs.setBrightness(20);
}

void loop() {
  // Ensure that recent motion data is 
  // read from the motion sensor (a.k.a. IMU,
  // a.k.a. Inertial Measurement Unity).
  // This is not necessary if you are not using
  // the motion measurements.
  SpinWheel.readIMU();
  
  // Here you add any drawing code you might want.
  // ...
  // ...

  // And finally, you command the SpinWheel to
  // display the drawing you have prepared.
  SpinWheel.drawFrame(); 
}
```

If you want to clear a previously drawn frame (as opposed to draw over it) you can use the `SpinWheel.clearAllLEDs()` function. Or you can use `SpinWheel.clearSmallLEDs()` or `SpinWheel.clearLargeLEDs()` if you want to erase only the small or large LEDs.

If you want to set all small LEDs to a single color, you can use `SpinWheel.setSmallLEDsUniform(r, g, b)` where `r`, `g`, and `b` are the red/green/blue components of the color to be shown (in the range from 0 to 255).

Similarly you can use `SpinWheel.setLargeLEDsUniform(r, g, b)` to set the color of all large LEDs.

The functions `SpinWheel.setSmallLED(i, r, g, b)` and `SpinWheel.setLargeLED(i, r, g, b)` set the color of only one LED (the one indexed by the number `i`). This number goes from 0 to 11 for the small LEDs and from 0 to 7 for the large LEDs.
