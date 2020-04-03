---
title: Assorted Educational Resources
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
      img.onclick = function() {window.location=a.href;};
    });
  })
};
</script>
<style>
.row-grid {
  display: block !important;
}
.column-grid {
  margin: 1rem !important;
  text-align: center !important;
}
ul.other_resources {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 100%;
  display: grid;
  grid-template-columns: repeat(auto-fill,minmax(360px, 1fr));
  grid-auto-rows: 1fr;
}
ul.other_resources > li {
  display: flex;
  flex-direction: row;
  margin: 10px 0;
  align-items: center;
  flex-basis: 350px;
}
ul.other_resources > li > img {
  width:30%;
  margin-right: 1rem;
  flex-grow: 0;
  flex-shrink: 0;
}
ul.other_resources > li > p {
  margin-left: 1rem;
  margin-right: 1rem;
  flex-grow: 1;
}
</style>

<div class="row row-grid">
<div class="column column-grid">
<h2>Video Channels</h2>
</div>
<div class="column column-grid column-long">
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

<div class="row row-grid">
<div class="column column-grid">
<h2>Activity Lists and Orgs</h2>
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://swe.org/k-12-outreach/youth-programs/">Society of Women Engineers - youth programs</a></p></li>
<li><img src=""> <p><a href="https://girlswhocode.com/code-at-home/">Girls Who Code</a></p></li>
<li><img src=""> <p><a href="https://stemactivitiesforkids.com/">STEM Activities Repository</a></p></li>
<li><img src=""> <p><a href="https://engineeringday.com">Engineering Day</a></p></li>
<li><img src=""> <p><a href="https://www.acs.org/content/acs/en/education/students/highschool/chemistryclubs/activities/food-and-chemistry.html">American Chemical Society's Food and Chemistry</a></p></li>
<li><img src=""> <p><a href="https://www.geekmomprojects.com/">Geek Mom Projects</a></p></li>
<li><img src=""> <p><a href="http://getbook.at/CraftyElectronics">The Crafty Kids Guide to DIY Electronics</a></p></li>
</ul>
</div>
</div>

<div class="row row-grid">
<div class="column column-grid">
<h2>Kits</h2>
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://spinwearables.com">Our SpinWheel Kit</a></p></li>
<li><img src=""> <p><a href="https://www.geekmomprojects.com/">Bright Wearables</a></p></li>
<li><img src=""> <p><a href="https://www.kiwico.com/">KiwiCo</a></p></li>
<li><img src=""> <p><a href="https://www.adafruit.com/">Adafruit</a></p></li>
<li><img src=""> <p><a href="https://www.sparkfun.com/">SparkFun</a></p></li>
</ul>
</div>
</div>

<div class="row row-grid">
<div class="column column-grid">
<h2>Virtual Museums</h2>
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://mos.org/MOSatHome">Museum of Science</a></p></li>
<li><img src=""> <p><a href="https://adventuresinfamilyhood.com/20-virtual-field-trips-to-take-with-your-kids.html">Adventures in Familihood's Museum List</a></p></li>
</ul>
</div>
</div>

<div class="row row-grid">
<div class="column column-grid">
<h2>Computer Games</h2>
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://www.minecraft.net/en-us/">Minecraft</a></p></li>
<li><img src=""> <p><a href="https://www.kerbalspaceprogram.com/">Kerbal Space Program</a></p></li>
<li><img src=""> <p><a href="https://www.factorio.com/">Factorio</a></p></li>
<li><img src=""> <p><a href="https://www.citiesskylines.com/">Cities and Skylines</a></p></li>
</ul>
</div>
</div>

<div class="row row-grid">
<div class="column column-grid">
<h2>Introductory CAD/Electronics Online Tools</h2>
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://www.tinkercad.com/">Tinkercad</a></p></li>
<li><img src=""> <p><a href="https://www.blockscad3d.com/">BlocksCAD</a></p></li>
<li><img src=""> <p><a href="https://www.tinkercad.com/circuits">Tinkercad Circuits</a></p></li>
</ul>
</div>
</div>

<div class="row row-grid">
<div class="column column-grid">
<h2>Books</h2>
Read any and every well received  book you can get your hands on. Read them all with a grain of salt. Glean from them advice and elements that resonate with you. No one "expert" has all of the answers. Some are just plain flat out wrong and dangerous, but many others are helpful, and some are just brilliant. You need to trust your own instincts to disregard the bad advice, use the good that pertains to your situation, and be inspired and transformed by the brilliant.
</div>
<div class="column column-grid column-long">
<ul class="other_resources">
<li><img src=""> <p><a href="https://angeladuckworth.com/grit-book/">Grit: The power of Passion and Perserverance - Angela Duckworth</a></p></li>
<li><img src=""> <p><a href="https://www.wired.com/2012/10/geek-mom-book/">Geek Mom: Projects, tips, and Adventures for Mom's and Their 21st Century Families - Barron</a></p></li>
<li><img src=""> <p><a href="http://www.creativityincbook.com/">Creativity Inc: Overcoming the Unseen Forces That Stand in the Way of True Inspiration - Amy Wallace and Edwin Catmull</a></p></li>
<li><img src=""> <p><a href="https://www.tonywagner.com/creating-innovators">
Creating Innovators: The Making of Young People Who Will Change the World - Tony Wagner</a></p></li>
<li><img src=""> <p><a href="https://www.adamgrant.net/originals">Originals: How Non-Conformists Move the World - Adam Grant</a></p></li>
</ul>
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

