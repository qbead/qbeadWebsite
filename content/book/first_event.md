---
title: An Introduction to the SpinWheel
keywords: physical computing, computer science, arduino, programming
header-video: /images/banners/linewheel_crossfade.mp4
---

::: intro-box
**Thank you for signing up to help test the SpinWheel!**

We hope that by the end of this event you will be more comfortable with the Arduino platform and that you will have successfully used this knowledge to program the SpinWheel yourself. With our volunteers' help, you will complete the SpinWheel's initial setup. We will then provide a quick presentation on programming. Our volunteers will then be there to answer any questions you may have as you complete the "Biology of Sight" adventure. We hope you enjoy using the SpinWheel! If you want to, at the very bottom you can also read about more general ways to program the SpinWheel.

:::


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

<iframe src="/quickstart" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>

<iframe src="/progpatterns" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>

<iframe src="/sight" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>

<iframe src="/quickapi" frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>
