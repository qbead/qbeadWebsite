---
title: Manufacturing
keywords: spinwheel, education, STEM, outreach, science, engineering day, electronics, computer science, physics
---

::: intro-box
Contracting a manufacturing parthner is extremely easy today. One can order custom printed circuit boards with a few clicks for suprisingly low amounts of money and have them delivered to their doorstep in a few days. Contracting mass assembly is slightly more involved, as one needs to provide part lists, but services like CircuitHub make the process very pleasant and transparent.
:::

There are two main services that would be of interest to projects the size of the SpinWheel. PCB services which simply print a *printed circuit board* of a given [design](/circuitdesign), and PCBA services which not only print the boards, but also *assemble* all components on top of the boards.

For our project we first ordered unpopulated boards from PCB services like Seeed Studio and PCB Way. Such services are very cheep and fast and frequently the $20 delivery fee from China is the greatest expense, especially for small prototyping orders. Printing just the boards lets us cheaply experiment with different colors, thicknesses, and overall designs, but it also means that we have to assembled and solder the initial prototypes ourselves. Depending on the expertise on the team and the assembly equipment available, this can be very empowering as it provides cheep and rapid design review, cycling through multiple revisions. However, the reliability of assembly souses is usually much better than what a hobbyist can achieve in a small home lab and the expense can be worth it if many sensitive components are involved.

<figure>
<img src="/images/behindthescenes/first_batch_pcb.jpg">
<figcaption>
The first batch of printed circuit boards delivered to us for testing.
</figcaption>
</figure>

This leads us to the PCBA side of things. The setup of an assembly line involves significant manual work by very skilled individuals and unsurprisingly the costs are much higher. After the assembly line is set, most of the process is automatic and the per-board cost is little more than the cost of the circuit board and components themselves. However, the setup cost can be hundreds of dollars. The two PCB houses we mentioned above provide PCBA services as well, however our team fell in love with the CircuitHub platform: a Massachusetts-based PCBA house providing the easiest to use PCBA service we know of at very competitive prices.

With CircuitHub you simply upload your design files. You do not need to prepare an explicit part list or any extra component placement instructions. CircuitHub searches through a database of manufacturers and suppliers for the cheapest available sources of parts, lets you choose alternatives, and provides a quote for arbitrary sized orders in a matter of seconds. If you want to order a single prototype board the cost per board would be hundreds of dollars due to the various fixed costs, but with simple slider you can see how the costs drops for mass-produced devices.

Lastly, CircuitHub and other providers have started offering special low prices for prototyping work when very small amount of devices will be ordered. These prototyping services can be life-savers during the early work on a project. It is worth noting also prototyping services by entities like SparkFun where you do not even need to provide design files: as long as the custom board you need is simple enough, you can just select the required sensors and control chips and they will match the components and assemble the boards for you.


