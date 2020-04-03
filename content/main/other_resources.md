---
title: Other Educational ResourcesSpinWearables
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
header-image: /images/behindthescenes/sky_lit_up_device_crop2.jpg
---

<script>
window.onload = function (){
  var lists = document.querySelectorAll('ul.other_resources');
  lists.forEach(function (ul){
    var elems = ul.querySelectorAll('li');
    elems.forEach(function (li){
      var img = li.querySelector('img');
      var a = li.querySelector('a');
      img.src = '/images/otherresourcespics/' + a.href.replace(/\//g,'.').replace(/:/g,'.') + '.png';
    });
  })
};
</script>
<style>
ul.other_resources {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
ul.other_resources > li {
  display: flex;
  flex-direction: row;
  margin: 10px 0;
  align-items: center;
}
.row-small-reverse ul.other_resources > li {
  flex-direction: row-reverse;
}
ul.other_resources > li > img {
  max-width:30%;
  margin: 1rem;
}
</style>

<div class="row">
<div class="column">
<h1>Video Channels</h1>
</div>
<div class="column column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://physicsgirl.org/">Physics Girl</a></p></li>
<li><img src=""> <p><a href="https://kurzgesagt.org/">Kurtzgesagt</a></p></li>
<li><img src=""> <p><a href="https://www.3blue1brown.com/">Blue3Brown1</a></p></li>
<li><img src=""> <p><a href="https://www.veritasium.com/">Veritasium</a></p></li>
<li><img src=""> <p><a href="https://www.numberphile.com/">Numberphile</a></p></li>
<li><img src=""> <p><a href="https://www.cgpgrey.com/">CGP Grey</a></p></li>
</ul>
</div>
</div>

<div class="row row-small-reverse">
<div class="column column-long">
TODO https://swe.org/k-12-outreach/youth-programs/ https://girlswhocode.com/code-at-home/ https://stemactivitiesforkids.com/ engineerday.com/  
</div>
<div class="column">
<h1>Activities Lists and Orgs</h1>
</div>
</div>

<div class="row">
<div class="column">
<h1>Kits</h1>
</div>
<div class="column column-long">
<ul class="other_resources">
TODO our kit and others
</ul>
</div>
</div>

<div class="row row-small-reverse">
<div class="column column-long">
TODO https://mos.org/MOSatHome https://adventuresinfamilyhood.com/20-virtual-field-trips-to-take-with-your-kids.html
</div>
<div class="column">
<h1>Virtual Museums</h1>
</div>
</div>

<div class="row">
<div class="column">
<h1>Computer Games</h1>
</div>
<div class="column column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://www.minecraft.net/en-us/">Minecraft</a></p></li>
<li><img src=""> <p><a href="https://www.kerbalspaceprogram.com/">Kerbal Space Program</a></p></li>
<li><img src=""> <p><a href="https://www.factorio.com/">Factorio</a></p></li>
<li><img src=""> <p><a href="https://www.citiesskylines.com/">Cities and Skylines</a></p></li>
</ul>
</div>
</div>

<div class="row row-small-reverse">
<div class="column column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://www.tinkercad.com/">Tinkercad</a></p></li>
<li><img src=""> <p><a href="https://www.blockscad3d.com/">BlocksCAD</a></p></li>
</ul>
</div>
<div class="column">
<h1>Introductory CAD/Electronics Online Tools</h1>
</div>
</div>

<div class="row row-small-reverse dark-transparent">
<div class="column column-long"><img src="/images/tree_keychain.jpg"></div>
<div class="column large-text">
<style>
#kickstarter {
  margin: auto;
  width: 90%;
  text-align: center;
  padding: 1em;
}

#kickstarter > a {
  margin: 0.2em;
  padding: 0.5em 1em;
  text-align: center;
  text-decoration: none;
}
</style>
<div id="kickstarter">
<p id="signup-form"><strong>For the SpinWheel:</strong></p>    
<p>You can follow us for updates on the project or support us by donating or purchasing the SpinWheel.</p>
<a href="https://www.kickstarter.com/projects/spinwheel/the-spinwheel-the-colorful-wearable-programming-kit" class="round-button">Take me to the Kickstarter page!</a>
<p><strong>You can also follow us on:</strong></p>
<p><strong>[Twitter](https://twitter.com/SpinWearables) and [Instagram](https://instagram.com/spinwearables?igshid=1hk2qphff1j1b)</strong></p>
</div>
</div>
</div>

<div class="row dark">
<div class="column">
Contact us at [mail@spinwearables.com](mailto:mail@spinwearables.com)!

At the following link you can see [some draft teaching materials that will come with the final SpinWheel](/book).
    
We have more SpinWheel-related information for [parents and educators here](/for_parents).

[Behind-the-scenes pictures of the device and testing runs](/behindthescenes) are also available.

And for the electrical engineers, we have [the technical specifications of the device](/specs).
</div>
</div>

