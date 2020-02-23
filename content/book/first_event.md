---
title: An Introduction to the SpinWheel
keywords: physical computing, computer science, arduino, programming
header-video: /images/banners/linewheel_crossfade.mp4
---

::: intro-box
**Thank you for signing up to help test the SpinWheel!**

We hope that by the end of this event you will be more comfortable with the Arduino platform and that you will have successfully used this knowledge to program the SpinWheel yourself. With our volunteers' help, you will complete the SpinWheel's initial setup. We will then provide a quick presentation on programming. Our volunteers will then be there to answer any questions you may have as you complete the "Biology of Sight" adventure. We hope you enjoy using the SpinWheel! If you want to, at the very bottom you can also read about more general ways to program the SpinWheel.

:::

The SpinWheel has four components: a power source (the battery), a sensor (for motion and magnetic fields), a set of lights (the light emitting diodes, or LEDs), and a micro computer (the brain of the device).

Much of the joy of the SpinWheel comes from your potential to change it, and make it do whatever you wish! To do this, you will need a way to reprogram the computer on the SpinWheel. You can do that by by using [the Arduino programming package](https://arduino.cc/en/Main/Software) that is already available on the computers provided for this activity.

Plug your SpinWheel into your computer with a micro USB cable and open the Arduino software. You should be able to see your device appear in `Tools→ Port`. There will be some text describing the serial port which you need to select in order for the software to connect to the SpinWheel. If there are multiple ports and you are unsure which one is the right one, simply check which one disappears when you unplug the SpinWheel.

Under the Tools menu, select Arduino Leonardo as the board (a.k.a. processor), so that the software knows which “dialect” to use to talk to the device (just like a language you speak can have different dialects!).

Learning to code is just like learning a new language - it may not be easy at first, but once you learn the basics, you will be able to write code to communicate effectively with computers! Today we will do this together by exploring a few SpinWheel code examples.

<style>
  iframe {
    width: 100%;
  }
</style>

<script>
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
    var l = obj.contentWindow.document.getElementById('license');
    l.parentElement.removeChild(l);
    var n = obj.contentWindow.document.getElementsByClassName('nav')[0];
    n.parentElement.removeChild(n);
    var i = obj.contentWindow.document.getElementById('isso-thread');
    i.parentElement.removeChild(i);
  }
</script>

<iframe src="/sight" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>

<iframe src="/quickapi" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>
