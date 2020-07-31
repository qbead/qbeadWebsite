---
title: Rotation
keywords: rotation, angular velocity, polar coordinates
---

::: intro-box
In this lesson, we'll talk more about rotation. 
We'll introduce concepts like angular velocity and polar coordinates that make it more easy to describe circular motion. 
:::

Imagine you are getting on a merry-go-round. 
Out of the many colorful options, you choose to ride your favorite horse on the outer row. 
The operator starts the ride, and you begin traveling around under flashing lights and bright mirrors. 
Now what would have been physically different about this ride had you chosen a different horse? 
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
When dealing with circular motion or rotation (for instance, for a ball on a string or a horse on a merry-go-round),  it is useful to describe position using an angle ($\theta$, pronounced 'theta'). The change between the original angle of the ball and its final angle is typically specified as the change in $\theta$ (or $\Delta \theta$) and is known as angular displacement. Displacement is a useful term to describe an object's change in position and can be defined as an angle (angular displacement) or distance (linear displacement). This concept is easier to understand through diagrams. In the image below you can see how linear displacement and angular displacement are related to each other.


<figure><video src="/images/bookpics/ang_lin_displacement.mp4" muted autoplay playsinline loop></video>
<figcaption>This picture shows the difference between angular displacement ($\theta$) and linear displacement. </figcaption></figure>



<figure><video src="/images/bookpics/compare_rotations.mp4" muted autoplay playsinline loop></video>
<figcaption>Two movements can have the same angular displacement but different linear displacements.</figcaption></figure>

# Angular Velocity 
To describe the motion of a ball as it is spun around on a string and other circular motion, we use something called angular velocity. 
Usually when we think of velocity, we are thinking of <span class="footnote">linear velocity<span>this type of velocity is sometimes also called translational velocity</span></span> defined as the change in position (displacement) over the time. 
Angular velocity is very similar, but it is instead defined as the change in angle over time. 
While angular velocity and linear velocity are related they are not the same. 
For instance, take our ball, if we change the length of the string, we can keep our angular velocity the same, but the linear velocity will be different. 
You can experiment with how changing the length of the string changes the angular and linear velocity using the interactive animation below.

<style>
#angRot {
  width: 400px;
  height: 400px;
  position: relative;
  justify-content: center;

}
#angBox{
  width: 800px;
  height: 400px;
  position: absolute;
  border-style: solid;

}
#angAnimation {
  width: 10px;
  height: 10px;
  position: absolute;
  background-color: red;
  top: 200px;
  left: 200px;
}

#trajectory {
width: 10px;
  height: 10px;
  position: absolute;
  border-style: solid;
  border-width: thin;
  }
  
#angOutput {
	left: 450px;
  	top: 0px;
  	position: absolute;
  }
</style>


<div id="angRot">

<div id="angBox">
<canvas class="trajectory" width=400 height=400></canvas>
<div id ="angAnimation"></div>

<div id="angOutput">
<div id="dataBar">
<span class="spacer">Radius : </span><input type="number" min="0" max="10"  id="rvalue">
<button id="angButton">Show</button>
</div>
<span class="spacer">Velocities </span><br> 
<span class="spacer">Linear (units/second): </span><span class="vis" id="linV">  </span><br> 
<span class="spacer">Angular (degrees/second): </span><span class="vis" id="angV">   </span>
</div>
</div>
</div>

<script>

var radius = document.getElementById("radiusBar");
const drawBox = document.getElementById("angBox");
const angImage = drawBox.getElementsByClassName('trajectory')[0].getContext('2d');
var rElement = document.getElementById("rvalue");


function myMove() {
	var r = rElement.value;
	if (r> 0){
	var linVol = 2*Math.PI*r/4; // animation takes 4 seconds
	var angVol = 90;
	}
	else{
	var linVol = 0;
	var angVol = 0;
	}
	document.getElementById("linV").innerHTML=linVol.toFixed(2);
	document.getElementById("angV").innerHTML=angVol.toFixed(2);


	var m_canvas = document.createElement('canvas'); // A frame buffer for only the path
  	m_canvas.width = 400;
  	m_canvas.height = 400
  
	angImage.clearRect(0,0,400,400);
	angImage.beginPath();
	angImage.arc(200, 200, r*10, 0, 2 * Math.PI);
	angImage.stroke();
	angImage.beginPath();
	angImage.moveTo(200, 200);
  	angImage.lineTo((r*10+200), 200);
	angImage.stroke();


  var elem = document.getElementById("angAnimation");   
  var pos = 0;
  
  var id = setInterval(frame, 10);
  function frame() {
    if (pos == 360) {
      clearInterval(id);
    } else {
      pos++; 
      elem.style.top = 195- Math.sin(pos*Math.PI/180)*r*10 + 'px'; 
      elem.style.left = 195+ Math.cos(pos*Math.PI/180)*r*10 + 'px'; 
    }
  }
  
}

angButton.onclick = myMove;

</script>


Did you notice how as you made the radius larger, the linear velocity increased but the angular velocity stayed the same? In this example, we have chosen to keep the angular velocity the same, no matter the radius. Because the distance the ball has to travel farther with a larger radius, the ball has to move faster to complete a full circle in the same amount of time. Every time we increase the radius, the linear velocity has to increase to keep the angular velocity the same.


# Angular Acceleration

To describe the change in velocity of an object, scientists use a concept called acceleration. For instance, if you roll a ball down down a ramp, it will pick up speed as it goes. This acceleration will change depending on the tilt of the ramp. If it is steeper, it will pick up speed more quickly and has a higher acceleration. In a similar way, you can use angular acceleration to describe the rate of change of angular velocity.

To help understand better the idea of angular acceleration, we have two animations below. On the left, the ball on a string is spinning at a constant angular velocity. As its angular velocity is not changing, the angular acceleration is zero. However, on the right, you can see that the ball's angular velocity increases and then decreases due the angular velocity changing. 

<video src="/images/bookpics/rotation_acceleration.mp4" muted autoplay playsinline loop></video>




# Polar Coordinates
In the [vectors and kinematics lesson](/vectors), 
we introduced the idea of coordinates, which describe a point in space. 
In that lesson, we used something called 'Cartesian coordinates.' 
If we think of a line connecting the origin to a point, 
Cartesian coordinates provide the x and y position $(x, y)$. 
This is very useful for describing straight lines and many mathematical functions,
such as those we created in the [Animations and Patterns](/animation) adventure.
In other cases, something called polar coordinates can be more useful. 
Polar coordinates define points in space differently. 
Rather than giving the x and y position, they specify points as their position on a circle. 
The two polar coordinates describes the radius of the circle ($r$) and the distance that has been traveled along the circle, which is measured as the angle $\theta$. Instead of reporting coordinates as $(x, y)$, polar coordinates are reported as $(r, \theta)$. 
This is easier to describe using a visual. In this image, we can see how the same point in space can be described using either Cartesian or polar coordinates.


![The same point can be described using cartesian coordinates (left image) and polar coordinates (right plot).
](/images/rotation_polarCoordinates.png)

It sometimes is important to switch from Cartesian to polar coordiantes or in the reverse from polar to Cartesian coordinates. Luckily, there is an easy way to convert between these variables: $x$ is simply  the product of $r$ and $cos{\theta}$ :
$$ x = r * \cos{\theta}$$
$y$, $r$, and $\theta$ are related to each other using the sin function where
$$ y = r * \sin{\theta} $$


![Conversion between polar and Cartesian coordinates requires the use of sin and cos functions.
](/images/rotation_polarCart_trig.png)

Going back to our discussion above about angular displacement, you can see how polar coordinates make it easy to describe the ball's location. As the ball moves in a circle, we can describe its location using the radius and angle. This is much simpler than determining $x$ and $y$ for each position. Polar coordinates make it easier to describe the ball's motion as well. By steadily increasing $\theta$ (or the angle), you can draw a circle with a specific radius.

<figure><video src="/images/bookpics/polar_animation.mp4" muted autoplay playsinline loop></video></figure>

# Summary 

Let's tie all of these concepts together to describe your ride on the merry-go-round! 
On your first ride, you chose a horse on the outer ring of the merry-go-round. Now, imagine a second ride where you chose the yellow horse to your left (closer to the center) instead. 
How would the following properties of your trip change: Angular displacement, angular velocity, linear velocity, angular acceleration?

![Here's a picture of this merry-go-round ride! Notice that the different radii for the canopy, inner horse, and outer horse. How will that affect their linear and rotational velocities? <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/merry-go-round.png)
<!-- TODO: Add final version once Mariya uploads it -->


<!-- TODO: Maybe hide this in a dropdown box that you have to click to open? -->

Your angular displacement, angular velocity, and angular acceleration would stay the same on both rides. 
In polar coordinates, the two horses have the same change in $\theta$ coordinate but different but $r$ values. 
Since $\theta$ remains the same, both horses have equal angular displacements. 
For angular velocity and acceleration, every horse on the ride would have the same value. 
This is because the entire merry-go-round starts, moves, and stops together at the same rate.

What would change between the two horses is your linear velocity. 
Switching to a horse closer to the center decreases  $r$ and means you are traveling in a smaller circle. 
Just like for the ball on a string, when $r$ decreases, your linear velocity also decreases.

What about if your friend chose the horse in front of you? In this case, your initial $\theta$ values would be different but your linear velocity and angular velocities would
be identical for the entire ride. This is because you have the same $r$ values and same change in $\theta$ over time. 


Finally, let's think about how the ride changes over time?
How would your angular acceleration change as you ride on the merry-go-round?


<!-- TODO: Maybe hide this in a dropdown box that you have to click to open? -->

When you first get on the merry-go-round, your angular velocity and angular acceration are both zero. Once the merry-go-round starts moving, your angular velocity increases until it reaches a constant velocity. During that time, your angular acceleration will describe this increase in angular velocity. Eventually, the ride will reach a constant angular velocity that it will remain at for a most of the ride. At this point, your angular velocity is no longer changing and your angular acceleration is zero. At the end of the ride, your angular velocity is going to decrease back to zero at a rate controlled by the angular acceleration. Then once the merry-go-round has stopped moving, your angular velocity and acceleration are again zero.
 
|Part of Ride  | Velocity | Acceleration
|---		|--- | ---
|Beginning     | Increasing | Positive
|Middle   	|Constant | Zero
|Almost Over   	| Decreasing | Negative
|Done | Zero | Zero

::: further-reading 
To apply some of these concepts to the SpinWheel, go to [Dancing with Color](/dancing) adventure.
::: 
