deepsmoke-bottle
================

This is a simple [Bottle](https://bottlepy.org/) wrapper for
[DeepSpaDe](https://github.com/tanmayb123/DeepSPADE)
which accepts requests over a HTTP `GET` interface
and returns a brief JSON representation of the DeepSpaDe result.

This is a quick and dirty prototype, and will probably change in the future.
See the (very small) source for details; there is no documentation.

A Docker image is available at https://hub.docker.com/r/tripleee/deepsmoke-bottle
-- it is built from the Dockerfile here.

The current Keras model was received from Tanmay on 2017-09-21 (indirectly).
In my brief tests, it has produced no false positives so far, but also no detections.
