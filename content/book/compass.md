---
title: Make a Compass
keywords: magnetism, compass
header-image: /images/banners/compass.png 
---

Making a compass is in principle as easy as making the tilt sensor,
just use the magnetic field `mx, my` instead of the gravitational field
`ax, ay`. However there are calibration problems.


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


## Unfinished widget about measuring the magnetic field around the device

The issue is that all of the metal around the sensor creates a constant magnetic offset.

The widget should have two plots: one where the camera is from the outside like here
and a second plot of the measurements themselves in the reference frame of the device

<div id="threediv" class="threediv"><p>The SpinWheel from the point of view of an outside observer:</p><div id="threejsanim" class="threejsanim"></div><p>The Magnetic fields with respect to the SpinWheel (i.e. from the SpinWheel's point of view):</p><div id="threejsanim2" class="threejsanim"></div>Tilt back and forth:<input id="fbtilt" type="range" min="-100" max="+100" value="30">Tilt sideways:<input id="lrtilt" type="range" min="-100" max="+100">Rotate face:<input id="frotate" type="range" min="-100" max="+100"><div><button id="clearsphere">Clear Points</button><button id="autorot">Autorotate</button></div>
<p>The three axes of the SpinWheel are colored as <span style="color:#92bd80;">X</span>, <span style="color:#8fb0d3;">Y</span>, and <span style="color:#f58559;">Z</span>. Also colored are the <span style="color:#d42c2b;">external magnetic field we want to measure</span>, <span style="color:#111111;">the total field that the sensor directly measures</span>, and the <span style="color:#9266bc;">magnetic field caused by the metalic SpinWheel components that causes the difference</span>.</p>
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

## The code to get measurements

The Calibrate sketch.

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

## A widget to plot the measurements coming from the device

Here you can paste your own measurements and see that the sphere of points is indeed offset from
the origin. We can measure this offset and correct for it.

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

```c++
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

<a class="imagecredit" href="https://johnhegarty8.wixsite.com/johnhegarty">Header image credit: Jack Hegarty</a>
