---
title: Making a Tilt Sensor
keywords: tilt sensor, gravitation, motion, acceleration
---

::: intro-box
The motion sensor in the SpinWheel can be used to detect the direction of gravity,
which in turn can be visualized, creating a colorful digital level or tilt sensor.
Here is one way to do this, which will also introduce you in a new way to the notion
of vectors.
:::

On our planet what is horizontal and what is vertical
is defined with respect to the direction of Earth's gravitational pull.
This makes it easy to measure how level a surface is
by observing whether gravity can pull something off the surface,
e.g., make a steel ball roll off.
One can even use a toy like a [ball-in-a-maze puzzle](https://en.wikipedia.org/wiki/Ball-in-a-maze_puzzle) as a simple tilt sensor.

![A toy in which the tilt can force a ball to roll in a given direction. <a class="imagecredit" href="https://commons.wikimedia.org/wiki/File:Round_maze.jpg">image credit Wikimedia</a>](/images/bookpics/round_maze.jpg)

More commonly, an actual bubble level is used,
where a small bubble encosed in a container with liquid
is used to point out whether a surface is flat.
The bubble tries to go as far up as possible,
i.e., it rises against the direction of gravity.
If the surface is not flat,
the buble will not be centered in the domed top of the container.

![A bubble level. <a class="imagecredit" href="https://publiclab.org/notes/mathew/10-26-2015/deploying-passive-particle-monitors">image credit Public Lab</a>](/images/bookpics/onebubble.jpg)

We can do the same measurement using the SpinWheel.
It contains a motion sensor, which is capable of measuring acceleration.
Moreover, as the sensation of accelerating can not be distinguished
from the senation of being pulled by gravity,
this same sensor also reports Earth's gravity.

::: further-reading
The indistinguishability of gavity and acceleration is a fascinating topic
that has puzzled scientists and physics students for centuries.
It is what has inspired Einstein to work on his general theory of relativity.
You can learn more about it in our [lesson on inertia and free fall](/inertia).
:::

Now we need to find a convenient way to encode this notion of "direction of gravity"
in a way that a piece of computer code can understand.
The main difficulty is that gravity does not only have a certain strength (or intensity),
but also a direction,
therefore one single number is not sufficient to fully describe the measurement.
For instance, notice how in the bubble level above,
it is not only the distance between the bubble and the center of the dome that matters,
but also, the direction in which the bubble has been displaced.
For our solution, we can continue being inspired by other types of bubble levels.

![A bubble level with separate sensors for each axis of tilt. <a class="imagecredit" href="https://publiclab.org/notes/mathew/10-26-2015/deploying-passive-particle-monitors">image credit Public Lab</a>](/images/bookpics/twobubble.jpg)

Notice how in this new level, we are using two separate tubes,
perpendicular to each other,
instead of one single dome.
Now we can use one number per bubble,
simply denoting its displacement away from the middle of its tube.
Those two numbers together contain all the information about the tilt of the surface.
We just described a <span class="footnote">position in the two-dimensional plane<span>Something that can not be expressed by a single number.</span></span>,
by using a <span class=footnote>pair of numbers<span>Each giving the displacements along a single axis.</span></span>.
Mathematicians call this operation [vector decomposition](/vectors).

You can gain some more intuition about this decomposition procedure below.
The black arrow is <span class="footnote">the two-dimensional object
<span>Having not only length but also a direction in a 2D plane.</span></span>
that we want to represent by splitting it in a component along the $x$ axis
and a component along the $y$ axis (green and blue, respectively).

<style>
#grid2d {
  text-align: center;
}
.grid2dcontrol > input {
  width: 40px;
}
.xcom {
  color: #228e2c;
}
.ycom {
  color: #2676b3;
}
</style>

<div id= "grid2d">
<div id="vectorGrid">
<canvas class="trajectory1D" width=400 height=400></canvas>
</div>
<div id="values">
<div class="grid2dcontrol xcom">X component: <span id="xshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="xvalue"></div>
<div class="grid2dcontrol ycom">Y component: <span id="yshow">0</span></div>
<div><input type="range" min="-10" max="10"  id="yvalue"></div>
<div class="grid2dcontrol">Magnitude: <span id="magshow">0</span></div>
<!--<div class="grid2dcontrol">Angle: <span id="angshow">0</span>&deg;</div>-->
</div>
</div>

<script>
function canvas_arrow(context, fromx, fromy, tox, toy) {
  var headlen = 10;
  var dx = tox - fromx;
  var dy = toy - fromy;
  var angle = Math.atan2(dy, dx);
  context.moveTo(fromx, fromy);
  context.lineTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle - Math.PI / 6), toy - headlen * Math.sin(angle - Math.PI / 6));
  context.moveTo(tox, toy);
  context.lineTo(tox - headlen * Math.cos(angle + Math.PI / 6), toy - headlen * Math.sin(angle + Math.PI / 6));
}

const v_to_path2D = document.getElementById('vectorGrid');
const ctx2D = v_to_path2D.getElementsByClassName('trajectory1D')[0].getContext('2d');
var xElement = document.getElementById("xvalue");
var yElement = document.getElementById("yvalue");
xElement.value = 2;
yElement.value = 2;
var xcurrent = 0;
var ycurrent = 0;
ctx2D.textAlign = 'center';
ctx2D.textBaseline = 'middle';

function canvas_axis(context, maxX, maxY) {
  var midX = maxX/2;
  var midY = maxY/2;
  var stepX = maxX/20;
  var stepY = maxY/20;
  context.strokeStyle='rgba(0,0,0,0.5)';
  context.lineWidth=1;
  context.moveTo(midX, 0);
  context.lineTo(midX,maxY);
  context.moveTo(0, midY);
  context.lineTo(maxX, midY);
  context.stroke();
  context.strokeStyle='rgba(0,0,0,0.1)';
  for (var i=-10; i<=10; i++) {
    context.moveTo(0,midY+i*stepY);
    context.lineTo(maxX,midY+i*stepY);
    context.moveTo(midX+i*stepX,0);
    context.lineTo(midX+i*stepX,maxY);
  }
  context.stroke();
}

function plot_all(){
    xcurrent = 0.8*xcurrent + 0.2*xElement.value;
    ycurrent = 0.8*ycurrent + 0.2*yElement.value;
    var x = xcurrent;
    var y = ycurrent;
    x_scale = x*20 + 200;
    y_scale = -y*20 + 200;
  
    ctx2D.clearRect(0,0,400,400);
    ctx2D.beginPath();
    canvas_axis(ctx2D, 400, 400);
    ctx2D.font = '14px sans';
    ctx2D.fillStyle = '#228e2c';
    ctx2D.strokeStyle = '#228e2c';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(200,y_scale);ctx2D.stroke();
    ctx2D.fillText('X = '+xcurrent.toFixed(1),x*10+200,y_scale-10*Math.sign(y));
    ctx2D.fillStyle = '#2676b3';
    ctx2D.strokeStyle = '#2676b3';
    ctx2D.beginPath();ctx2D.moveTo(x_scale,y_scale);ctx2D.lineTo(x_scale,200);ctx2D.stroke();
    ctx2D.fillText('Y = '+ycurrent.toFixed(1),x_scale+40*Math.sign(x),-y*10+200);
    ctx2D.beginPath();
    ctx2D.strokeStyle='black';
    ctx2D.lineWidth=2;
    canvas_arrow(ctx2D,200,200,x_scale, y_scale);
    ctx2D.stroke();
    var magnitude = Math.sqrt(x*x  + y*y);
    var direction_angle = Math.atan2(y,x)/Math.PI*180;
    if (direction_angle < 0){
    	direction_angle = direction_angle + 360;
    }
    document.getElementById("xshow").innerHTML=xcurrent.toFixed(1);
    document.getElementById("yshow").innerHTML=ycurrent.toFixed(1);
    document.getElementById("magshow").innerHTML=magnitude.toFixed(1);
    //document.getElementById("angshow").innerHTML=direction_angle.toFixed(0);
}

setInterval(plot_all, 50);
</script>

::: further-reading
You can learn more about how to describe and work with quantities that have
a direction from our [lesson on vectors](/vectors).
:::

Now we have everything we need to start working with
measurements of tilt (direction of gravity) on the SpinWheel.
We will use the `readIMU()` function
to ask the Inertial Measurement Unit (IMU)
to measure the three components of the gravitational vector
(shown in grey in the visualization below).
Below you can see how the three axes, $x$, $y$, and $z$ are defined.
We will use only the $x$ and $y$ components as they are the ones
corresponding to the displacement of the air bubbles seen
in the bubble levels above.
You can gain intuition about how these components will behave by
exploring the interactive SpinWheel visualization below and
carefully observing how the green and blue components change.


<div id="threediv"><div id="threejsanim"></div>Tilt back and forth:<input id="fbtilt" type="range" min="-100" max="+100" value="30">Tilt sideways:<input id="lrtilt" type="range" min="-100" max="+100">Rotate face:<input id="frotate" type="range" min="-100" max="+100"></div>

<style>
#threediv {
  text-align: center;
  width: 100%;
}
#threediv > * {
  display: block;
  margin: auto;
}
</style>

<script type="module">

import * as THREE from '/three/three.module.js';

import { OrbitControls } from '/three/OrbitControls.js';
 
function makeSpinWheel() {
  var outerbox = new THREE.Group();
  var box = new THREE.Group();
  var geometry = new THREE.CylinderGeometry(20,20,1,24);
  var material = new THREE.MeshPhongMaterial({color: 0x111111, transparent: true, opacity: 0.90});
  var disk = new THREE.Mesh( geometry, material );
  box.add(disk);
  var sgeometry = new THREE.CylinderGeometry(1.5,1.5,1,24);
  var sdisk = new THREE.Mesh( sgeometry, material );
  sdisk.position.set(21/1.414,0,21/1.414);
  box.add(sdisk);
  for (var i=0; i<4; i++) {
    var bgeometry = new THREE.BoxGeometry(5,1.5,5);
    var wmaterial = new THREE.MeshPhongMaterial({color: 0xbbbbbb});
    var square1 = new THREE.Mesh(bgeometry, wmaterial);
    var square2 = new THREE.Mesh(bgeometry, wmaterial);
    var x = (-1)**i;
    var z = (-1)**(i>>1);
    square1.position.set(x*10,1.25,z*10);
    square2.position.set(x*3,1.25,z*3);
    //square1.rotation.z += Math.PI/2;
    box.add(square1);
    box.add(square2);
  }
  box.rotation.y = Math.PI*3/4;
  outerbox.add(box);
  return outerbox;
}

function makeScene() {
  var scene = new THREE.Scene();
  scene.background = new THREE.Color( 0xffffff );

  var lights = [];
  lights[ 0 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 1 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 2 ] = new THREE.PointLight( 0xaaaaaa, 1, 0 );
  lights[ 0 ].position.set( 0, 200, 100 );
  lights[ 1 ].position.set( 0, 0, 100 );
  lights[ 2 ].position.set( 0, - 200, 100 );
  
  scene.add( lights[ 0 ] );
  scene.add( lights[ 1 ] );
  scene.add( lights[ 2 ] );

  var grid = new THREE.GridHelper( 1500, 70 );
  grid.position.set(0,-100,0);
  scene.add(grid);

  return scene;
}

var camera, scene, renderer;
var box;
var arrow;
var xarrow, yarrow, zarrow;
var sphere;
const size = 400;
const animdiv = document.getElementById('threejsanim');
const fgtilt = document.getElementById('fbtilt');
const lrtilt = document.getElementById('lrtilt');
const frotate = document.getElementById('frotate');
   
function init() {
  scene = makeScene();
  
  box = makeSpinWheel();
  scene.add(box);

  arrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,0,0),
    //40, 0xf58559,
    40, 0xaaaaaa,
    10, 4
  );
  scene.add(arrow);

  xarrow = new THREE.ArrowHelper(
    new THREE.Vector3(1,0,0),
    new THREE.Vector3(0,2,0),
    40, 0x92bd80,
    10, 4
  );
  box.add(xarrow);

  yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,-1),
    new THREE.Vector3(0,2,0),
    40, 0x8fb0d3,
    10, 4
  );
  box.add(yarrow);

  zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,2,0),
    40, 0xf58559,
    10, 4
  );
  box.add(zarrow);

  /*
  var sgeometry = new THREE.SphereGeometry( 3, 12, 12 );
  var smaterial = new THREE.MeshBasicMaterial( {color: 0xf58559} );
  sphere = new THREE.Mesh( sgeometry, smaterial );
  scene.add(sphere);
  */ 

  var fov = 60;
  var aspect = 2;
  var near = 0.10;
  var far = 500;
  camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera.position.z = 80;
  
  renderer = new THREE.WebGLRenderer( { antialias: true } );
  renderer.setSize( size, size/2 );
  animdiv.appendChild( renderer.domElement );

  var controls = new OrbitControls(camera, renderer.domElement);
}
 
function animate() {
  requestAnimationFrame( animate );
  const fb = fbtilt.value*Math.PI/2/100;
  const lr = lrtilt.value*Math.PI/2/100;
  const r = frotate.value*Math.PI/2/100;
  const euler = new THREE.Euler(fb,r,lr,'ZXY');
  box.setRotationFromEuler(euler);
  const g = new THREE.Vector3(0,1,0);
  const py0 = new THREE.Vector3(0,0,-1);
  const my0 = new THREE.Vector3(0,0,1);
  const y0 = new THREE.Vector3(0,0,-1).applyEuler(euler);
  const ly = y0.dot(g);
  const aly = Math.abs(ly)*40
  yarrow.setLength(aly, Math.min(10,aly), 4);
  var dy;
  if (ly > 0) {
    dy = py0;
  } else {
    dy = my0;
  }
  const px0 = new THREE.Vector3(1,0,0);
  const mx0 = new THREE.Vector3(-1,0,0);
  const x0 = new THREE.Vector3(1,0,0).applyEuler(euler);
  const lx = x0.dot(g);
  const alx = Math.abs(lx)*40
  xarrow.setLength(alx, Math.min(10,alx), 4);
  var dx;
  if (lx > 0) {
    dx = px0;
  } else {
    dx = mx0;
  }
  const pz0 = new THREE.Vector3(0,1,0);
  const mz0 = new THREE.Vector3(0,-1,0);
  const z0 = new THREE.Vector3(0,1,0).applyEuler(euler);
  const lz = z0.dot(g);
  const alz = Math.abs(lz)*40
  zarrow.setLength(alz, Math.min(10,alz), 4);
  var dz;
  if (lz > 0) {
    dz = pz0;
  } else {
    dz = mz0;
  }
  xarrow.setDirection(dx);
  yarrow.setDirection(dy);
  zarrow.setDirection(dz);
  /*
  const xy = x0.clone()
               .multiplyScalar(lx*40);
  xy.add(y0.clone()
           .multiplyScalar(ly*40));
  sphere.position.copy(xy);
  */
  renderer.render( scene, camera );
}
 
init();
animate();
 
</script>

![These are the three axes that the SpinWheel can detect acceleration and gravity along. In the interactive 3D diagram you can see how the vector of gravitational acceleration (in grey) is decomposed along these three axes. You can drag, ctrl+drag, or scroll on the 3D image to rotate, pan, or zoom the camera.<a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)


Our code needs little more than reading the $x$ and $y$ components
and trigger the corresponding LEDs.
This is a rather minimal example that reads
only the gravity and acceleration along $x$,
interpreting that value as a description of the tilt along that axis,
and then lits a corresponding LED along the same axis as appropriate.
The value is contained in the $SpinWheel.ax$ variable. 

```c++
#include "SpinWearables.h"
using namespace SpinWearables; 

void setup() {
  // Ensure all of the SpinWheel hardware is on.
  SpinWheel.begin();
}

void loop() {
  // Read all sensor data.
  SpinWheel.readIMU();

  // Save the x-axis measurement in a variable.
  int x = SpinWheel.ax*255;

  // Turn off all LEDs.
  SpinWheel.clearAllLEDs();

  // If the tilt is in a given direction,
  // turn on the corresponding LED.
  if (x>10) {
    SpinWheel.setLargeLED(5,-x, -x,-x);
  }
  else if (x<-10) {
    SpinWheel.setLargeLED(7, x, x, x);
  }

  SpinWheel.drawFrame();
}
```

You can upload this code directly from the Examples menu in the Arduino software.
`Examples → SpinWearables → Tilt_Sensor →  Simple` has a slightly more detailed
version of the above code, sensing both along $x$ and $y$.
However, you should feel free to explore your artistic tendencies,
making more elaborate visualizations.
A visualization similar to the one shown below can be found in
`Examples → SpinWearables → Tilt_Sensor →  Fancy`.

Both the
[`Simple`](/codedoc/examples/Tilt_Sensor/Simple/Simple.ino.html)
and the
[`Fancy`](/codedoc/examples/Tilt_Sensor/Fancy/Fancy.ino.html)
code examples can also be seen through the browser in literate programming renditions.

<figure><video src="/images/bookpics/preloaded_tilt3.mp4" muted autoplay playsinline loop></video><figcaption>   </figcaption></figure>

::: further-reading
We have [a list of visualization functions](/allcommands) that can be of use
when making more elaborate tilt visualizations.
You might also be interested in the [dancing with colors](/dancing)
or [step counter](/stepcounter) projects,
which explore different ways to depict motion with the SpinWheel.
:::
