# switch-dev-env
Docker container image for easy Nintendo Switch homebrew development.

`sudo docker run -it --rm -v ${PWD}:/src yuzuemu/switch-dev-env make`

## What comes pre-configured?
1. Ubuntu 16.04 build environment with build-essential (make).
2. devkitA64 installed + configured.
2. libnx libraries installed + configured.

## Future TODO
Future support will be added for:
1. libtransistor libraries
2. SDL
3. ... etc

## Building your solution (HOWTO)

### 1) Download sample-examples from switchbrew.
`git clone -b v20180302 https://github.com/switchbrew/switch-examples.git switch-examples`

### 2) Build with make, loading the src directory as a volume.
`cd switch-examples`

`sudo docker run -it --rm -v ${PWD}:/src yuzuemu/switch-dev-env make`

### 3) Obtain output binaries (nro, nso)
Binaries will be available in the source directory. Ex: `./switch-examples/graphics/printing/hello-world/hello-world.nro`
