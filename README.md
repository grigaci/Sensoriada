# Sensoriada
[![Build Status](https://travis-ci.org/grigaci/Sensoriada.svg?branch=master)](https://travis-ci.org/grigaci/Sensoriada) [![Coverage Status](https://coveralls.io/repos/grigaci/Sensoriada/badge.png?branch=master)](https://coveralls.io/r/grigaci/Sensoriada?branch=master)

This Swift project is just an proof of concept for a [Mobos](http://romobos.com) 2015 pre-event.
Its purpose is to read & parse sensor values received from a hub.
[Andrei Craciun](https://plus.google.com/108106855611058265427/posts) is the owner of the idea and also the one responsible for the hardware.

# SensoriadaExample

Demo project that reads data from an url, analyse it using [Sensoriada](# Sensoriada) framework and displays it to the user.
Example of an compatible JSON that can be read by the framework:
```json
{
  "sensorNodes": [
    {
      "id": 0,
      "voltage": 2848,
      "secondsAgo": 22796,
      "date": "2015-01-12 17:00:29",
      "sensors": [
        {
          "type": 10,
          "version": 1,
          "value": 412
        }
      ]
    }
  ]
}
```

PS. Code coverage is not yet working for Swift [StackOverflow](http://stackoverflow.com/questions/25006983/is-code-coverage-already-working-for-swift)
