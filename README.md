C++ [ROS](http://www.ros.org/) node wrapper for a set of [HC-SR04](http://www.micropik.com/PDF/HCSR04.pdf) ultrasonic sonar sensors.

![hc-sr04](hc_sr04.jpg)

Publishes [sensor_msgs::Range](http://docs.ros.org/jade/api/sensor_msgs/html/msg/Range.html) messages at 10Hz to `/sonar_N` topics. Specifically populates `range`.

We include a node for a set of sonars, rather than a node per sonar, since we need to ensure only one sonar is measuring at a time (sonars can easily interfere with each other).

On Raspberry Pi 2 uses ~2% cpu and <1% mem for 3 sonars (capping at a distance of 20cm).

REQUIRES running `src/export_gpio_pins.sh start` to export pins otherwise need to run as root (limitation of `wiringPiSetupSys`).

🚨PIN NUMBERING 🚨  
Pins in `export_gpio_pins.sh` need to be defined in BCM pin layout.   
Pins in `hc_sr04_node.cpp` need to be defined in GPIO pin layout.

```
rostopic echo /sonar_0
---
header:
  seq: 525
  stamp:
    secs: 1462946345
    nsecs: 463606605
  frame_id: ''
radiation_type: 0
field_of_view: 0.0
min_range: 0.0
max_range: 20.0
range: 7.08620691299
---
```

TODOS
* make hard coded pins in `hc_sr04_node.cpp` configurable
* need some analysis on `field_of_view`