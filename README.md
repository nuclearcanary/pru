# Pru

## BeagleBone Black PRU helper library for [Nerves](http://nerves-project.com)

Basic library that enables easy interaction with the PRU cores present
in the BeagleBone Black.

## Installation

[From Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pru` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pru, "~> 0.1.0"}
  ]
end
```

## Basic Usage

In a Nerves project module
```elixir
require Pru
```

Then within your functions you can call the following to control the
operation of the PRU cores.
```elixir
Pru.init_pins       # Enables pins to be used as inputs and outputs
Pru.pin_in 'P8_11'  # Allows PRUs to access P8_11 as an input
Pru.pin_out 'P8_12' # Allows PRUs to access P8_12 as an output
Pru.halt 1          # Halts PRU core 1
Pru.boot 1          # Boots PRU core 1
# Boot will fail if firmware is not loaded to /lib/firmware/am335x-pru1-fw
Pru.reboot 0        # Reboots PRU core 0
# Boot will fail if firmware is not loaded to /lib/firmware/am335x-pru0-fw
```

## TODO
Add RPMsg messaging support

## Docs
Documentation can be found at [https://hexdocs.pm/pru](https://hexdocs.pm/pru).
