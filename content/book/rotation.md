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


<!--TODO: Intro will go here.-->
Imagine you are getting on a merry-go-round. 
Out of the many colorful options, you choose to ride your favorite horse in the middle row. 
The operator starts the ride, and you begin traveling around under flashing lights and bright mirrors. 
Now what would have been physically different about this ride had you chosen the horse to your right or left? 
You'll be able to answer this by the end of the lesson!

This lesson will focus on understanding the many things around us that spin. 
Whether it's a frisbee, a tire wheel, a dancer, or even you on an amusement park ride, rotation is all around us. 
When objects move in straight lines, 
we call this linear motion. 
In previous lessons, we’ve discussed how to describe linear motion.
How about rotational motion? What tools do we have to explain this motion?


# Angular Displacement
When dealing with circular motion or rotation (for instance, for a ball on a string or a horse on a merry-go-round), then it is useful to describe its position using an angle ($\theta$). The change between the original angle of the ball and its final angle is typically specified as the change in $\theta$ (or $\Delta \theta$) and is known as angular displacement. While $\theta$ can be defined using either degrees or radian, radians are commonly used. (which do we use?)

## add image of a ball moving in a straight line to demonstrate displacement and ball on string with an angle sketched out to define angular displacement

# Angular Velocity 
To describe the motion of this ball as it is spun around on a string, we use something called angular velocity. Usually when we think of velocity, we are thinking of something called linear velocity which is defined as the change in position over the time. Angular velocity is very similar, but it is instead defined as the change in angle over the time. While angular velocity and linear velocity are related they are not the same. For instance, take our ball, if we change the length of the string, we can keep our angular velocity the same, but the linear velocity will be different. You can experiment with this below:

## add widget where gives angular and linear velocity with a slidebar for the radius of the ball spinning around 

Did you notice how as you made the string longer, the linear velocity increased but the angular velocity stayed the same? This is because to trace the larger circle at the same rate, it has to move faster when it is farther away. If you measured the linear velocity at points moving out from the origin, you could see that they steadily increase. 

# Angular Acceleration
do we want to add this?


# Polar Coordinates
In the [vectors and kinematics lesson](/vectors), we introduced the idea of a vector. When defining vectors in this lesson, we used something called 'Cartesian coordinates.' If we think of a vector connecting the origin to the point, Cartesian coordinates provide the x and y position $(x, y)$. This is very useful for straight lines, (give more examples). In other cases, something called polar coordinates can be more useful. Polar coordinates define a vector differently. Rather than giving the x and y position, they specify the length of the vector ($r$) and its direction ($\theta$) $(r, \theta)$. This is easier to describe using a visual:

## add visual here of cartesian vs polar coordinates
caption: Here you can see how both polar and cartesian coordinates can be used to describe a point's location.

It sometimes is important to switch from Cartesian to polar coordiantes or in the reverse from polar to Cartesian coordinates. $x$, $r$, and $\theta$ are related to each other using the cosine function, which relates $\theta$ to the ratio between $x$ and $r$ ($cos(\theta) = x/r$). The sine function ($sin(\theta) = y/r$) relates $/theta$ to the ratio between $y$ and $r$.

##add visualization of this

Going back to our discussion above about angular displacement, you can see how polar coordinates make it easy to describe the ball's location. Polar coordinates make it easier to describe the ball's motion as well. By steadily increasing theta (or the angle), you can draw a circle with a specific radius.

## add an animation here, maybe of a ball on a string

Let's tie all of these concepts together to describe your ride on the merry-go-round! 
But, also imagine a second ride where you chose the yellow horse to your left (closer to the center) instead. 
How would the following properties of your trip change: Angular displacement, angular velocity, linear velocity, angular acceleration?

Answer: (Could we hide this in a dropdown box that you have to click to open)

Your angular displacement, angular velocity, and angular acceleration would stay the same on both rides. 
The two horses lie along the same radial line, so in polar coordinates, their theta coordinate would be the same, but r would change. 
Theta remaining the same results in the horses have equal angular displacements. 
For angular velocity and acceleration, every horse on the ride would have the same value. 
This is because the entire merry-go-round starts, moves, and stops together at the same rate.

What would change between the two horses is your linear velocity. 
Switching to the yellow horse decreases your r coordinate, and means you are traveling in a smaller circle. 
Just like for the ball on a string, when r decreases, your linear velocity also decreases.
 

::: further-reading 
To apply some of these concepts to the SpinWheel, go to [Dancing with Color](/dancing) adventure.
::: 
