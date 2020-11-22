---
title: Make a Compass
keywords: magnetism, compass
header-image: /images/banners/compass.png 
---

::: intro-box
By detecting Earth's magnetic field,
the SpinWheel can act as a compass.
However, both an old-school compass with a magnetic needle
and the magnetic sensor inside of the SpinWheel
can be confused if you put them near a piece of iron.
Here we will see how to write a program that corrects for
this error, the same type of program that runs
inside of smartphone apps when they give you directions.
:::

<!-- The part about the iron and calibrating against the error feels abrupt, since they haven't even made the compass yet. Can we simplify this to just the 1st sentence, plus something like "Here, we will walk through how to program your SpinWheel to work as your very own compass" or something?
-->

Making a compass is done in a similar way to creating [the tilt sensor](/tilt). Be sure to check out the tilt sensor adventure before diving into the rest of this one. <!--Also, you can refresh your memory on magnetic fields by reviewing our [magnetism](/magnetism) lesson.-->

<!-- I know the magnetism lesson isn't ready yet but I think it would be useful to link to it here
-->

To turn your SpinWheel into a compass, we will use the magnetic field vector components `mx`, `my` instead of the gravitational field `ax`, `ay`.
This way, the SpinWheel's display will point along the direction
of Earth's magnetic field, giving us an indication of which way is north and which way is south. This is analogous to how the tilt sensor showed us the direction of gravity,
allowing us to determine whether or not a surface was flat.

However, instead of measuring only <span style="color:#d42c2b;">**Earth's magnetic field**</span>,
the sensor will measure both <span style="color:#d42c2b;">**Earth's magnetic field**</span>,
and <span style="color:#9266bc;">**the field created by objects near the sensor**</span>. 
This is a problem as other components near the SpinWheel's magnetic sensor
create additional magnetic fields. 
Using this **total measured magnetic field**
would result in an imprecise compass,
therefore we need to find a way to remove these 
<span style="color:#9266bc;">**extra magnetic fields**</span>,
so that only
<span style="color:#d42c2b;">**Earth's magnetic field**</span> remains.

<!-- Perhaps for an "extra experimentation" box: 
Want to observe this phenomenon before your eyes? Grab your physical compass, and figure out which way is north. Then, put your compass near something metal and see what happens to your directional measurement.
-->

Every smartphone manufacturer also faces this same problem.
In addition to magnetic fields from 
various components inside of smartphones, temporary magnetization
can also be caused by external objects, like keys kept in the same pocket.
To correct for the magnetic fields caused by other nearby objects, 
pathfinding apps sometimes ask you to move your phone
along a figure "8" to calibrate the sensors before they provide directions. 

These <span style="color:#9266bc;">**extra magnetic fields**</span>
are always present and will remain fixed with respect to the sensor.
This means that even when we rotate the sensor,
<span style="color:#9266bc;">**this component**</span> of the measured result will not change.
However, such a rotation would cause <span style="color:#d42c2b;">**Earth's magnetic field**</span>
to be oriented differently with respect to the sensor,
causing the measurements to change along each axis of the sensor. 

We can use this to our advantage!
By rotating the device in complete circles,
we can average out <span style="color:#d42c2b;">**the Earth's magnetic field**</span>
leaving only <span style="color:#9266bc;">**the magnetic field caused by the device**</span>.
Having <span style="color:#9266bc;">**this value**</span> saved, we can now subtract it from future measurements,
thus leaving us only with the desired result:
<span style="color:#d42c2b;">**Earth's magnetic field**</span>.

Below you can see a simulation of how these measurements may be taken.
The SpinWheel rotates in space, taking constant measurements
(each measurement is represented by a black dot).
The <span style="color:#d42c2b;">**magnetic field external to the SpinWheel caused by the Earth's magnetic field, i.e. the red vector,**</span>
is fixed.
The <span style="color:#9266bc;">**extra magnetic field caused by the device itself,
i.e. the smaller purple vector**</span>,
rotates with the SpinWheel.
Their **sum, shown as the black vector** in the second animation, is what the SpinWheel actually measures.

<!-- Perhaps could use some more instructions about how to manipulate this interactive widget - I am not super clear on what I should be doing (but perhaps my confusion is related to my comment about the spurious fields above).
-->

<style>
.threediv {
  text-align: center;
  width: 100%;
  font-size: 0.9rem;
}
.threediv > * {
  display: block;
  margin: auto;
}
.threediv > p {
  width:400px;
}
.threediv > p > span {
  font-weight:var(--font-weight-strong);
}
</style>

<div id="threediv" class="threediv"><p>The magnetic fields with respect to an observer (i.e. your point of view)</p><div id="threejsanim" class="threejsanim"></div><p>The magnetic fields with respect to the SpinWheel (i.e. from the SpinWheel's point of view):</p><div id="threejsanim2" class="threejsanim"></div>Tilt back and forth:<input id="fbtilt" type="range" min="-100" max="+100" value="30">Tilt sideways:<input id="lrtilt" type="range" min="-100" max="+100">Rotate face:<input id="frotate" type="range" min="-100" max="+100"><div><button id="clearsphere">Clear Points</button><button id="autorot">Autorotate</button></div>
<p>The three axes of the SpinWheel are colored as <span style="color:#92bd80;">X</span>, <span style="color:#8fb0d3;">Y</span>, and <span style="color:#f58559;">Z</span>. Also colored are the <span style="color:#d42c2b;">Earth's magnetic field that we want to measure</span>, the <span style="color:#9266bc;">magnetic field caused by the SpinWheel's metallic components,</span> and **the sum of these vectors, the total magnetic field** that the SpinWheel's sensor measures. </p>
</div>

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

function makeScene(dogrid=true) {
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

  if (dogrid==true) {
    var grid = new THREE.GridHelper( 1500, 70 );
    grid.position.set(0,-100,0);
    scene.add(grid);
  }

  return scene;
}

var camera, scene, renderer;
var camera2, scene2, renderer2;
var box;
const size = 400;
const animdiv = document.getElementById('threejsanim');
const animdiv2 = document.getElementById('threejsanim2');
const fgtilt = document.getElementById('fbtilt');
const lrtilt = document.getElementById('lrtilt');
const frotate = document.getElementById('frotate');

var Boutnormal = new THREE.Vector3(1,2,0.5).normalize();
var Bout = Boutnormal.clone().multiplyScalar(40);
var Binnormal = new THREE.Vector3(1,0.1,2).normalize();
var Bin = Binnormal.clone().multiplyScalar(12);
var Boutarrow2;
var Btotarrow2;
var pointcloudgeom;
var MAXPOINTS = 10000
var pointsarray = new Float32Array(3*MAXPOINTS);
var pointslen = 0;
var newpoint = false;

fgtilt.addEventListener('input', function (){newpoint=true;clearInterval(intervalid);})
lrtilt.addEventListener('input', function (){newpoint=true;clearInterval(intervalid);})
frotate.addEventListener('input', function (){newpoint=true;clearInterval(intervalid);})

function init() {
  scene = makeScene();
  
  box = makeSpinWheel();
  scene.add(box);

  for (var i = 1; i<=5; i++) {
    for (var j = 1; j<=5; j++) {
      var Boutarrow = new THREE.ArrowHelper(
        Boutnormal,
        new THREE.Vector3(i*40-120,0,j*40-120),
        40, 0xd42c2b,
        5, 2
      );
      scene.add(Boutarrow);
    }
  }

  var Binarrow = new THREE.ArrowHelper(
    Binnormal,
    new THREE.Vector3(0,2,0),
    12, 0x9266bc,
    5, 2
  );
  box.add(Binarrow);

  var xarrow = new THREE.ArrowHelper(
    new THREE.Vector3(1,0,0),
    new THREE.Vector3(0,2,0),
    25, 0x92bd80,
    0, 4
  );
  box.add(xarrow);

  var yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,-1),
    new THREE.Vector3(0,2,0),
    25, 0x8fb0d3,
    0, 4
  );
  box.add(yarrow);

  var zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,2,0),
    25, 0xf58559,
    0, 4
  );
  box.add(zarrow);

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

function init2() {
  scene2 = makeScene(false);
  
  var xarrow = new THREE.ArrowHelper(
    new THREE.Vector3(1,0,0),
    new THREE.Vector3(0,0,0),
    25, 0x92bd80,
    0, 4
  );
  scene2.add(xarrow);

  var yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,-1),
    new THREE.Vector3(0,0,0),
    25, 0x8fb0d3,
    0, 4
  );
  scene2.add(yarrow);

  var zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,0,0),
    25, 0xf58559,
    0, 4
  );
  scene2.add(zarrow);

  Boutarrow2 = new THREE.ArrowHelper(
    Boutnormal,
    Bin,
    40, 0xd42c2b,
    5, 2
  );
  scene2.add(Boutarrow2);

  Btotarrow2 = new THREE.ArrowHelper(
    Boutnormal,
    new THREE.Vector3(0,0,0),
    0, 0x111111,
    5, 2
  );
  scene2.add(Btotarrow2);

  var Binarrow = new THREE.ArrowHelper(
    Binnormal,
    new THREE.Vector3(0,0,0),
    12, 0x9266bc,
    5, 2
  );
  scene2.add(Binarrow);

  pointcloudgeom = new THREE.BufferGeometry();
  var pcmaterial = new THREE.PointsMaterial( {size: 1, color: 0x111111} );
  var points = new THREE.Points(pointcloudgeom, pcmaterial);
  scene2.add(points);

  var fov = 60;
  var aspect = 2;
  var near = 0.10;
  var far = 500;
  camera2 = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera2.position.z = 50;
  camera2.position.y = 50;
  camera2.position.x = 50;
  
  renderer2 = new THREE.WebGLRenderer( { antialias: true } );
  renderer2.setSize( size, size/2 );
  animdiv2.appendChild( renderer2.domElement );

  var controls = new OrbitControls(camera2, renderer2.domElement);
}
 
function animate() {
  requestAnimationFrame( animate );
  const fb = fbtilt.value*Math.PI/2/100;
  const lr = lrtilt.value*Math.PI/2/100;
  const r = frotate.value*Math.PI/2/100;
  const euler = new THREE.Euler(fb,r,lr,'ZXY');
  box.setRotationFromEuler(euler);
  const quat = new THREE.Quaternion();
  const inverted = quat.setFromEuler(euler).conjugate();

  var localBoutnormal = Boutnormal.clone().applyQuaternion(inverted);
  Boutarrow2.setDirection(localBoutnormal);
  var localBtot = localBoutnormal.multiplyScalar(40).add(Bin);
  Btotarrow2.setLength(localBtot.length(), 5, 2);
  Btotarrow2.setDirection(localBtot.clone().normalize());

  if (newpoint) {
    pointsarray[3*pointslen] = localBtot.x;
    pointsarray[3*pointslen+1] = localBtot.y;
    pointsarray[3*pointslen+2] = localBtot.z;
    pointslen = (pointslen+1)%MAXPOINTS;
    pointcloudgeom.setAttribute('position', new THREE.BufferAttribute(pointsarray.subarray(0,3*pointslen), 3));
    pointcloudgeom.computeBoundingBox();
    newpoint = false;
  }

  renderer.render( scene, camera );
  renderer2.render( scene2, camera2 );
}
 
init();
init2();
animate();

var dir = 1;
function autoincrement() {
  if (fbtilt.valueAsNumber>=100) {
    fbtilt.valueAsNumber-=200;
  }  
  if (lrtilt.valueAsNumber>=100) {
    dir = -1;
    fbtilt.valueAsNumber+=11;
  }
  if (lrtilt.valueAsNumber<=-100) {
    dir = +1;
    fbtilt.valueAsNumber+=11;
  }
  lrtilt.valueAsNumber=lrtilt.valueAsNumber+6*dir;
  newpoint=true;
}

var intervalid = setInterval(autoincrement, 50);

const bautorot = document.getElementById('autorot');
const bclearsphere = document.getElementById('clearsphere');

bautorot.addEventListener('click', function (){
  clearInterval(intervalid);
  intervalid = setInterval(autoincrement, 50);
})
bclearsphere.addEventListener('click', function (){
  pointslen = 0;
  newpoint = true;
})

</script>

You can see that the cloud of measurements creates a sphere,
but one not centered at the $(0,0,0)$ point. Instead, $(0,0,0)$ corresponds to the location of the magnetic field sensor on the SpinWheel, shown as the intersection of the three axes in the animation above. 
The center of this sphere is the tip of the
<span style="color:#9266bc;">**purple vector, the magnetic field caused by the SpinWheel's metallic components**</span>. If you are having trouble visualizing this, try rotating the sphere in the animation above until the <span style="color:#f58559;">**orange vector**</span> points straight upwards.
Below, we will introduce a procedure we can use to find the center of the sphere, or the <span style="color:#9266bc;">**extra magnetic field,**</span> and subtract it from all future measurements. In this way, we will just display the <span style="color:#d42c2b;">**Earth's magnetic field**</span>. 

<!-- this is hard to observe at the moment -->

## Reading magnetic field measurements from the SpinWheel

To begin, let's perform some measurements with our SpinWheel.
The code below, which can also be found in 
[`Examples → SpinWearables → Compass →  Calibrate`](/codedoc/examples/Compass/Calibrate/Calibrate.ino.html),
will take direct measurements from the magnetic sensor
and immediately send them back to your computer
over your USB cable. When you upload this code, you will not see any LEDs light up on your SpinWheel. 
On your computer, you can use the
`Serial Plotter` Arduino tool to observe how the magnetic field values change
as you rotate the device.

::: further-reading
If you want to refresh your memory about accessing `Serial Plotter`, then check out the [Arduino 101](/arduino101) lesson. Reminder: you will see a single small LED light up in red when you use `Serial Plotter` or `Serial Monitor`.
:::

```c++
#include "SpinWearables.h"
using namespace SpinWearables; 

void setup() {
// Ensure all of the SpinWheel hardware is on.
  SpinWheel.begin();
// Set up communication with the host computer.
  Serial.begin(9600);
}

void loop() {
// Read all sensor data.
  SpinWheel.readIMU();

// Measure the magnetic field along the three axes of the sensor.
  float x = SpinWheel.mx;
  float y = SpinWheel.my;
  float z = SpinWheel.mz;

// Report it back to the host computer.
  Serial.print(x);
  Serial.print("\t"); // Print a tab separator.
  Serial.print(y);
  Serial.print("\t"); // Print a tab separator.
  Serial.print(z);
  Serial.print("\n"); // Print a new line.
}
```

To visualize the cloud of points that this creates,
you can also copy the data from your `Serial Monitor` into the text box below. Uncheck `Autoscroll` and `Show timestamp` to more easily copy and paste.
The webpage will then regenerate the image
based on the numbers that you provided.
Currently, the text you see in the textbox contains real data we measured
with one of the first SpinWheels we ever manufactured.
If you rotate the plot (by dragging it),
you can clearly see that the sphere of measurements
is not at the center of the sphere of points.
Instead, like you could see in the animation above,
there is an offset that we have to correct for.

<div id="pointclouddiv" class="threediv"><div id="pointcloudanim" class="threejsanim"></div><textarea id="pointcloudtext"></textarea></div>

<style>
#pointcloudtext {
  width: 200px;
  min-height: 100px;
}
</style>

<script type="module">

import * as THREE from '/three/three.module.js';

import { OrbitControls } from '/three/OrbitControls.js';
 
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

  return scene;
}

var camera, scene, renderer;
var pointcloudgeom;
const size = 400;
const animdiv = document.getElementById('pointcloudanim');
   
function init() {
  scene = makeScene();
  
  var xarrow, yarrow, zarrow;

  xarrow = new THREE.ArrowHelper(
    new THREE.Vector3(1,0,0),
    new THREE.Vector3(0,0,0),
    70, 0x92bd80,
    10, 2
  );
  scene.add(xarrow);

  yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,0,0),
    70, 0x8fb0d3,
    10, 2
  );
  scene.add(yarrow);

  zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,1),
    new THREE.Vector3(0,0,0),
    70, 0xf58559,
    10, 2
  );
  scene.add(zarrow);

  pointcloudgeom = new THREE.BufferGeometry();
  processData();
  var pcmaterial = new THREE.PointsMaterial( {size: 1, color: 0x111111} );
  var points = new THREE.Points(pointcloudgeom, pcmaterial);
  scene.add(points);
  
  var fov = 60;
  var aspect = 2;
  var near = 0.10;
  var far = 500;
  camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera.position.z = 80;
  camera.position.x = 80;
  camera.position.y = 80;
  
  renderer = new THREE.WebGLRenderer( { antialias: true } );
  renderer.setSize( size, size/2 );
  animdiv.appendChild( renderer.domElement );

  var controls = new OrbitControls(camera, renderer.domElement);
}
 
function animate() {
  requestAnimationFrame( animate );
  renderer.render( scene, camera );
}

function processData() {
  var array = new Float32Array;
  array = Float32Array.from(document.getElementById("pointcloudtext").value.replaceAll('\n','\t').replaceAll(' ', '\t').split('\t'));
  pointcloudgeom.setAttribute('position', new THREE.BufferAttribute(array, 3));
  pointcloudgeom.computeBoundingBox();
}
 
fetch('/data/compass.txt')
  .then(response => response.text())
  .then(function (data) {
    document.getElementById("pointcloudtext").value = data;
    init();
    animate();
  });

document.getElementById("pointcloudtext").addEventListener('input', processData);
</script>

## Compass with automatic calibration

Now, instead of recording all of this data and processing it
in order to correct our **magnetic field measurements**,
we can instruct the SpinWheel to continuously correct itself.
Initially, such an automatic correction will be significantly off,
but after a few minutes of playing with the device,
it will have measured enough data in order to perform accurate corrections. This correction procedure is known as calibration.

The code below works by first storing the biggest and smallest
measurements for each axis of the magnetic sensor.
Then we use these maxima and minima to find the offset of the sphere
along each axis and correct for it. You should see some of the small LEDs on your SpinWheel light up and point north. You can also find this code in 
[`Examples → SpinWearables → Compass →  Calibrated_Compass`](/codedoc/examples/Compass/Calibrated_Compass/Calibrated_Compass.ino.html).

```c++
#include "SpinWearables.h"
using namespace SpinWearables; 

void setup() {
// Ensure all of the SpinWheel hardware is on.
  SpinWheel.begin();
// Set up communication with the host computer.
  Serial.begin(9600);
}

float minx, miny, minz, maxx, maxy, maxz;

void loop() {
  // Read all sensor data.
  SpinWheel.readIMU();

  // Measure the magnetic field along the three axes of the sensor.
  float x = SpinWheel.mx;
  float y = SpinWheel.my;
  float z = SpinWheel.mz;

  if (x > maxx) maxx=x;
  if (y > maxy) maxy=y;
  if (z > maxz) maxz=z;
  if (x < minx) minx=x;
  if (y < miny) miny=y;
  if (z < minz) minz=z;

  float truex = x - (maxx+minx)/2;
  float truey = y - (maxy+miny)/2;
  float truez = z - (maxz+minz)/2;

  // Use this line if you want to skip the correction.
  //uint8_t angle = (-atan2(y, x)+3.1415/2)/2/3.1415*255;
  uint8_t angle = (-atan2(truey, truex)+3.1415/2)/2/3.1415*255;
  SpinWheel.setSmallLEDsPointer(angle, 800, 0xffffff);

  SpinWheel.drawFrame();
}
```

The main difference between the compass and [tilt sensor](/tilt) are the lines in this style:

```c++
  if (x > maxx) maxx=x;
  if (y > maxy) maxy=y;

  float truex = x - (maxx+minx)/2;
```

Here we continuously update the maximal and minimal values ever measured,
and then use them to correct the current measurement result.

As an extension, you can combine both the tilt and magnetic sensors. 
It is useful for a compass to have a tilt sensor, so that you can be sure that
you are only measuring the horizontal component of Earth's magnetic field. 
When you are using the SpinWheel as a compass, 
make sure to keep it level for best results!

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
