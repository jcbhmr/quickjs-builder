# QuickJS<sup><sup>[@quickjs-ng](https://github.com/quickjs-ng)</sup></sup> builder

## Installation

**The recommended way to install QuickJS for use as a CLI REPL is to use [`jsvu`](https://github.com/GoogleChromeLabs/jsvu).** You can also download [the QuickJS releases](https://github.com/quickjs-ng/quickjs/releases) directly if you prefer. This `*-builder` project exists for another purpose: to build the `.a`/`.lib` QuickJS static libraries for you. Why? So that you can use them in your Go, Rust, Zig, etc. toolchain without worrying about compiling the QuickJS project yourself.

## Usage

```
https://github.com/jcbhmr/quickjs-builder/releases/download/$TAG/quickjs-aarch64-macos-none.tar.gz
https://github.com/jcbhmr/quickjs-builder/releases/download/$TAG/quickjs-x86_64-macos-none.tar.gz
https://github.com/jcbhmr/quickjs-builder/releases/download/$TAG/quickjs-x86_64-windows-gnu.zip
https://github.com/jcbhmr/quickjs-builder/releases/download/$TAG/quickjs-aarch64-linux-musl.tar.gz
https://github.com/jcbhmr/quickjs-builder/releases/download/$TAG/quickjs-x86_64-linux-musl.tar.gz
```

## Development

```sh
cd quickjs
cmake -B build
cmake --build build
```
