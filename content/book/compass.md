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
}
.threediv > * {
  display: block;
  margin: auto;
}
</style>


## Unfinished widget about measuring the magnetic field around the device

The issue is that all of the metal around the sensor creates a constant magnetic offset.

The widget should have two plots: one where the camera is from the outside like here
and a second plot of the measurements themselves in the reference frame of the device

<div id="threediv" class="threediv"><div id="threejsanim" class="threejsanim"></div>Tilt back and forth:<input id="fbtilt" type="range" min="-100" max="+100" value="30">Tilt sideways:<input id="lrtilt" type="range" min="-100" max="+100">Rotate face:<input id="frotate" type="range" min="-100" max="+100"></div>

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

  var grid = new THREE.GridHelper( 1500, 70 );
  grid.position.set(0,-100,0);
  scene.add(grid);

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
    new THREE.Vector3(0,2,0),
    70, 0x92bd80,
    10, 2
  );
  scene.add(xarrow);

  yarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,0,-1),
    new THREE.Vector3(0,2,0),
    70, 0x8fb0d3,
    10, 2
  );
  scene.add(yarrow);

  zarrow = new THREE.ArrowHelper(
    new THREE.Vector3(0,1,0),
    new THREE.Vector3(0,2,0),
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
  array = Float32Array.from(document.getElementById("pointcloudtext").value.replaceAll('\n','\t').split('\t'));
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
