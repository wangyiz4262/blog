title: Interfacing an LED and debouncing switch
date: 2015-03-07 23:33:01
categories:
  - Internet of Things
tags:
  - raspberry pi
  - python
---
![](/img/iot-debounce_switch.jpg)
### Setup the circuitry and program for Interfacing an LED and Switch with Raspberry Pi

Circuit Diagram:
![](/img/iot-circut_switch.png)

Code:
```python
from time import sleep
import RPi.GPIO as GPIO
 
GPIO.setmode(GPIO.BCM)
 
# Switch Pin
GPIO.setup(25, GPIO.IN)
 
# LED Pin
GPIO.setup(18, GPIO.OUT)
 
state = False
 
def toggleLED(pin, state):
    state = not state
    GPIO.output(pin, state)
    return state
 
while (True):
    try:
        if (GPIO.input(25) == True):
            state = toggleLED(18, state)
        sleep(.01)
    except KeyboardInterrupt:
        exit()
```

Findings:
1. The code given by the book is not compilable, because there is no variable “state” within the scope of function toggleLED, therefore I need to pass-in state as another argument and set the return value to be the updated state.
2. If I print out the current phase when I press the button, it showed that it had covered several phases on each pressed. This proves that while the button is being pressed down, it sends signals to the Raspberry Pi constantly.

### Debounce the button with better software support or use interrupts

Code:
```python
import RPi.GPIO as GPIO
from time import sleep
 
def off(inPin, outPin, status):
    GPIO.output(outPin, False)
    status = False
    while (True):
        if (GPIO.input(inPin)):
            return status
        sleep(0.15)
 
     
def slow(inPin, outPin, status):
    while (True):
        status = not status
        for x in xrange(1,4):
            GPIO.output(outPin, status)
            sleep(0.15)
            if (GPIO.input(inPin)):
                return status
 
def fast(inPin, outPin, status):
    while (True):
        status = not status
        for x in xrange(1,2):
            GPIO.output(outPin, status)
            sleep(0.15)
            if (GPIO.input(inPin)):
                return status
 
 
GPIO.setmode(GPIO.BCM)
 
# Switch Pin
inputPin = 25
GPIO.setup(inputPin, GPIO.IN)
 
# LED Pin
outputPin = 18
GPIO.setup(outputPin, GPIO.OUT)
 
status = False
GPIO.output(outputPin, status)
while (True):
    try:
        if (GPIO.input(inputPin)):
            status = slow(inputPin, outputPin, status)
            status = fast(inputPin, outputPin, status)
            status = off(inputPin, outputPin, status)
             
        sleep(0.05)
         
    except KeyboardInterrupt:
        GPIO.cleanup()
        exit()
```

Findings:
1. The interval for sleeping is very crucial. If the sleeping time is set to be 0.05 seconds, and when pressing the button, it will jump to the phase after next. For example, the pi is current in slow flashing, and when pressing the button, the pi suddenly stopped flashing or even slow flashing again, which means the fast flashing was skipped. If the sleeping interval is set to be 0.15 seconds, it becomes much better. I guess it is because human motion of pressing button takes some time that crosses two phases.
2. It is better to have an asynchronous method which can monitor the action of button press. Otherwise, people will need to press the button just when not in sleeping time.