Pi Calc
=======

This is just a collection of several ruby pi calculators that I wrote for personal entertainment.
For those who are curious, everything is under the ```PiCalc``` module.

Functions
---------

The ```PiCalc``` module includes 3 ways to calculate pi.

They use a variety of different methods to calculate pi. All of them have a standard ```total``` value that can be set to determine the number of iterations, and hence the accuracy of the output. ```total``` defaults to 100,000

```ruby
require 'pi_calc'

# The Gregory-Leibniz series
PiCalc.gregory_leibniz
# => 3.1415826535897198

# The Nilakantha series
PiCalc.nilakantha
# => 3.1415926535897865

# The Buffon's needle tactic (not the same each time)
PiCalc.buffons_needle
# => 3.1600069520152942

# Slightly faster Buffon's needle tactic
PiCalc.buffons_needle_optimized

# Testing the speeds
PiCalc.test
```

For more deph on how each part of the code works, read the source code.

[![Gem Version](https://badge.fury.io/rb/pi_calc.png)](http://badge.fury.io/rb/pi_calc)