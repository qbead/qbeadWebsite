---
title: Rotation
keywords: rotation, angular velocity, polar coordinates
---

::: intro-box
In this lesson, we'll talk more about rotation, introducing concepts like angular velocity and polar coordinates. 
:::

::: warning :
This lesson is still under-development. Check back soon for more links and the full lesson!
:::

Imagine you are getting on a merry-go-round. 
Out of the many colorful options, you choose to ride your favorite horse in the middle row. 
The operator starts the ride, and you begin traveling around under flashing lights and bright mirrors. 
Now what would have been physically different about this ride had you chosen the horse to your right or left? 
You'll be able to answer this by the end of the lesson!

![When learning about rotation, try to connect these concepts to the experince of riding a merry-go-round. <a class="imagecredit" href="https://www.pikrepo.com/ftrla/selective-focus-photography-of-merry-go-round-during-nighttime">image credit Pikrepo</a>](/images/bookpics/MerryGoRound.jpg)

This lesson will focus on understanding the many things around us that spin. 
Whether it's a frisbee, a tire wheel, a dancer, or even yourself on an amusement park ride, rotation is all around us. 
When objects move in straight lines, 
we call this linear motion. 
In previous lessons, we’ve discussed how to describe linear motion.
How about rotational motion? What tools do we have to explain this motion?

::: further-reading 
If you aren't already familiar with the concepts of displacement, velocity, and acceleration, we recommend first reading our [vectors and kinematics lesson](/vectors) lesson. 
::: 

# Angular Displacement
When dealing with circular motion or rotation (for instance, for a ball on a string or a horse on a merry-go-round), then it is useful to describe its position using an angle ($\theta$). The change between the original angle of the ball and its final angle is typically specified as the change in $\theta$ (or $\Delta \theta$) and is known as angular displacement. Displacement is a useful term to describe an object's change in position and can be defined as an angle (angular displacement) or distance (linear displacement). This concept is easier to understand through diagrams. In the image below you can see how linear displacement and angular displacement are related to each other.

## add image of a ball moving in a straight line to demonstrate displacement and ball on string with an angle sketched out to define angular displacement

# Angular Velocity 
To describe the motion of this ball as it is spun around on a string, we use something called angular velocity. Usually when we think of velocity, we are thinking of something called linear velocity, which is defined as the change in position over the time. Angular velocity is very similar, but it is instead defined as the change in angle over the time. While angular velocity and linear velocity are related they are not the same. For instance, take our ball, if we change the length of the string, we can keep our angular velocity the same, but the linear velocity will be different. You can experiment with how changing the length of the string changes the angular and linear velocity using the interactive animation below.

## add widget where gives angular and linear velocity with a slidebar for the radius of the ball spinning around 

Did you notice how as you made the string longer, the linear velocity increased but the angular velocity stayed the same? This is because to trace the larger circle at the same rate, it has to move faster when it is farther away. If you measured the linear velocity at points moving out from the origin, you could see that they steadily increase. However, the angular velocity remains the same because the ball is still covering the same 360 degrees of the circle. 

# Angular Acceleration

To describe the change in velocity of an object, scientists use a concept called acceleration. For instance, as a ball picks up speed as it rolls down a ramp. The acceleration will change depending on the tilt of the ramp. If it is steeper, it will pick up speed more quickly and has a higher acceleration. In a similar way, you can use angular acceleration to describe the rate of change of angular velocity.

To help understand better the idea of angular acceleration, we have two animations below. On the left, the ball on a string is spinning at a constant angular velocity. As its angular velocity is not changing, the angular acceleration is zero. However, on the right, you can see that the ball's angular velocity increases and then decreases. The faster that this change in angular velocity occurs the larger the angular acceleration will be. If you adjust the sliders below, you can see that the time that it takes to change between the minimum and maximum acceleration changes. 

## add widget/animation that demonstrates angular acceleration

Did you notice how if you increase the angular acceleration that the time it takes to get to the maximum velocity decreases? This is because with a faster angular acceleration, it takes less time to get to the maximum angular velocity. Conversely, with a smaller angular acceleration, it will take more time to get to the maxiumum angular velocity. This is similar to how a sprinter that can accelerate faster will beat in a race another sprinter who has the same top speed but a slower acceleration. Since the first sprinter can reach their top speed faster, they will be ahead of the other sprinter in the race, even if they can run equally fast. 


# Polar Coordinates
In the [vectors and kinematics lesson](/vectors), 
we introduced the idea of coordinates, which describe a point in space. 
In this lesson, we used something called 'Cartesian coordinates.' 
If we think of a line connecting the origin to the point, 
Cartesian coordinates provide the x and y position $(x, y)$. 
This is very useful for straight lines, (give more examples). 
In other cases, something called polar coordinates can be more useful. 
Polar coordinates define points in space differently. 
Rather than giving the x and y position, they specify points as their position on a circle. 
The two polar coordinates describes the radius of the circle ($r$) and its direction ($\theta$) $(r, \theta)$. 
This is easier to describe using a visual:

## add visual here of cartesian vs polar coordinates
caption: Here you can see how both polar and cartesian coordinates can be used to describe a point's location.

It sometimes is important to switch from Cartesian to polar coordiantes or in the reverse from polar to Cartesian coordinates. $x$, $r$, and $\theta$ are related to each other using the cosine function, which relates $\theta$ to the ratio between $x$ and $r$ ($cos(\theta) = x/r$). The sine function ($sin(\theta) = y/r$) relates $/theta$ to the ratio between $y$ and $r$.

##add visualization of this

Going back to our discussion above about angular displacement, you can see how polar coordinates make it easy to describe the ball's location. Polar coordinates make it easier to describe the ball's motion as well. By steadily increasing theta (or the angle), you can draw a circle with a specific radius.

## add an animation here, maybe of a ball on a string

# Summary 

Let's tie all of these concepts together to describe your ride on the merry-go-round! 
Now, imagine a second ride where you chose the yellow horse to your left (closer to the center) instead. 
How would the following properties of your trip change: Angular displacement, angular velocity, linear velocity, angular acceleration?

Answer: (Could we hide this in a dropdown box that you have to click to open?)

Your angular displacement, angular velocity, and angular acceleration would stay the same on both rides. 
The two horses lie along the same radial line, so in polar coordinates, their $\theta$ coordinate would be the same, but $r$ would change. 
Since $\theta$ remains the same, both horses have equal angular displacements. 
For angular velocity and acceleration, every horse on the ride would have the same value. 
This is because the entire merry-go-round starts, moves, and stops together at the same rate.

What would change between the two horses is your linear velocity. 
Switching to the yellow horse decreases your $r$ coordinate, and means you are traveling in a smaller circle. 
Just like for the ball on a string, when $r$ decreases, your linear velocity also decreases.

How would your angular acceleration change as you ride on the merry-go-round?

Answer: (Could we hide this in a dropdown box that you have to click to open?)

When you first get on the merry-go-round, your angular velocity and angular acceration are both zero. Once the merry-go-round starts moving, your angular velocity increases until it reaches a constant velocity. During that time, your angular acceleration will describe this increase in angular velocity. However, once you reach the constant angular velocity of most of the merry-go-round ride, your angular velocity is no longer changing and so your angular acceleration is again zero. At the end of the ride, your angular velocity is going to decrease back to zero at a rate controlled by the angular acceleration. Then when once the merry-go-round has stopped moving, your angular velocity and acceleration are again zero.
 

::: further-reading 
To apply some of these concepts to the SpinWheel, go to [Dancing with Color](/dancing) adventure.
::: 
