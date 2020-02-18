---
title: Dancing Companion
keywords: dancing, kinematics, color, light, programming
header-image: /images/banners/dancer_color.png 
---

::: further-reading
todo: Refer to the "step counter" and "kinematics" and "rotations" and to the "biology of sight" and "light and color" pages throughout this page. Focus on how something about motion can be turned into something about color.Talk about hue vs intensity.
:::

draft: 

We will first make a few patterns of the form `draw_pattern(parameter)` and when we have a few cute patterns, well make `parameter` depend on motion.

1. make a cute pattern, for instance a rainbow or a snake or something - see examples here https://blog.krastanov.org/2019/01/30/motion-sensing-jewelry/
2. using something like `void loop() {draw_pattern((millis()%10000)/100.)}` test the pattern
3. explore different versions of using motion instead of time for the parameter - directly proportional, time integrated, non linear filter, etc (do not use these names)

Have videos, similarly to the blog post from above.

This also has useful examples https://www.engineeringday.com/2017/01/29/motion-sensing-bracelet/
