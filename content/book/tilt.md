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

Gravity is vector, vector has components, sensor detects these components, used to present useful stuff about tilts.
See vector lesson about vectors.
See inertia lesson about how gravity and acceleration can not be distinguished.

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


![This picture demonstrates the three axes that the SpinWheel can detect acceleration along. For instance, if you have the SpinWheel resting flat on the table and pick it up, the SpinWheel's acceleration sensor will detect acceleration only along the z axis. More complicated motions will have an x, y, and z axis component. <a class="imagecredit" href="https://monochra.com/">image credit Mariya Krastanova</a>](/images/bookpics/dance_axis.png)


You can drag, ctrl+drag, or scroll on the 3D image to rotate, pan, or zoom the camera.

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


```c++
void loop() {
  SpinWheel.readIMU();

  int x = SpinWheel.ax*255;
  int y = SpinWheel.ay*255;

  SpinWheel.setLargeLEDsUniform(0xffffff);

  if (x>10) {
    SpinWheel.largeLEDs.setPixelColor(7,x-8,0,x-8);
    SpinWheel.largeLEDs.setPixelColor(3,x-8,0,x-8);
  }
  else if (x<-10) {
    SpinWheel.largeLEDs.setPixelColor(5,-x+8,0,-x+8);
    SpinWheel.largeLEDs.setPixelColor(1,-x+8,0,-x+8);
  }

  if (y>10) {
    SpinWheel.largeLEDs.setPixelColor(6,y-8,0,y-8);
    SpinWheel.largeLEDs.setPixelColor(2,y-8,0,y-8);
  }
  else if (y<-10) {
    SpinWheel.largeLEDs.setPixelColor(4,-y+8,0,-y+8);
    SpinWheel.largeLEDs.setPixelColor(0,-y+8,0,-y+8);
  }

  uint8_t angle = (-atan2(SpinWheel.ay, SpinWheel.ax)+3.1415/2)/2/3.1415*255;
  SpinWheel.setSmallLEDsPointer(angle, 500, 0xffffff);

  SpinWheel.drawFrame();
}
```


<figure><video src="/images/bookpics/preloaded_tilt3.mp4" muted autoplay playsinline loop></video><figcaption>   </figcaption></figure>


See dancing with colors and making a step counter.
