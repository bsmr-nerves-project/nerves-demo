nerves-demo
===========

Simple application for demonstrating release creation for embedded devices.

*** Work in progress until nerves "SDK" is easily available. ***

This application provides a web interface for controlling LEDs on the
Beaglebone. In the process, it demonstrates using rebar and relx
for building an Erlang release in a cross-compiled environment. It then
constructs a firmware image that can be burned to an SDCard and run
on the Beaglebone.
