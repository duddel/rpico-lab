# Raspberry Pi Pico Lab

[![build](https://github.com/duddel/rpico-lab/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/duddel/rpico-lab/actions/workflows/build.yml)

**Template and Examples in `C/C++` for the Raspberry Pi Pico using the official SDK, via Docker.**

-   The official SDK is cloned into the Docker image, see [Dockerfile](Dockerfile) for details
-   Check out the examples in [src/](src/)
-   Utilize existing code for an own project or start with a basic example
-   Having Docker in place, the projects can be built with a single command

## Features

| Feature  | Example                                    | Info                        | Tested on boards |
| -------- | ------------------------------------------ | --------------------------- | ---------------- |
| blink    | [src/main_blink.c](src/main_blink.c)       | Hello world blink example   | `pico`, `pico_w` |
| debounce | [src/main_debounce.c](src/main_debounce.c) | Button debouncer            | `pico`, `pico_w` |
| ws2812   | [src/main_ws2812.c](src/main_ws2812.c)     | Basic ws2812 light controls | `pico`, `pico_w` |

## Kick-start

A Docker installation and basic Docker knowledge is required.

1.  Build the Docker image:

```bash
docker build -t rpico .
```

2.  Build the examples via Docker with one of these commands. Replace `<pico_board>` with the desired board to build for, such as `pico` or `pico_w`.

```bash
# Bash
docker run --rm -v $(pwd):/code -w /code rpico /bin/bash ./build.bash <pico_board>

# Powershell
docker run --rm -v ${PWD}:/code -w /code rpico /bin/bash ./build.bash <pico_board>
```

3.  Drop any UF2 binary from `build_<pico_board>/` directory onto the Pico following the official documentation.

## Advanced usage

The above should suffice for simple building of the examples. Here are some more things to do.

**Use this repository as a template for an own project:**

-   Fork or download this repository
-   Delete unneeded source files from [src/](src/)
    -   e.g. just keep `main_blink.c` to start with
-   Delete unneeded build targets from [CMakeLists.txt](CMakeLists.txt)
    -   Each `main_[...].c/.cpp` file in [src/](src/) has a corresponding block in [CMakeLists.txt](CMakeLists.txt) defining an executable target
    -   e.g. just keep the block starting with `add_executable(blink ...`

**More control over the build command:**

```bash
# Bash
docker run --rm -v $(pwd):/code -w /code rpico /bin/bash -c "mkdir -p build && cd build && cmake -DPICO_BOARD=pico .. && make"

# Powershell
docker run --rm -v ${PWD}:/code -w /code rpico /bin/bash -c "mkdir -p build && cd build && cmake -DPICO_BOARD=pico .. && make"
```

**Start Docker container with an interactive shell:**

```bash
# Bash
docker run --rm -it -v $(pwd):/code rpico

# Powershell
docker run --rm -it -v ${PWD}:/code rpico
```
## License

-   The source code in this repository is licensed under the [MIT license](LICENSE.txt) (if not stated otherwise).
-   Thirdparty components:
    -   [src/ws2812.pio](src/ws2812.pio) (license in file)
