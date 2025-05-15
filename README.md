# bench-exec

This package includes 'true' command execution examples in C, Rust, Python, and Go, plus a script to loop and time their performance.

## Requirements

- GNU make
- gcc
- Python 3
- Go
  - Ex.: sudo apt install golang
  - or `https://go.dev/doc/install`
- Rust
  - `https://rustup.rs/`

## Execution example

Here is an example of the output you might see when running the `bench-exec-loop.sh all 1000` command:

### Ubuntu 24.04 on Hyper-V on Windows 11 on AMD Ryzen 7 7735HS

```text
$ make test-all
./bench-exec-loop.sh all 500
Starting performance tests for all with 500 iterations each.
--------------------------------------------------
Testing 'sh'...
  Finished 'sh' 500 times in 0.5881 seconds.
--------------------------------------------------
Testing 'c'...
  Finished 'c' 500 times in 0.4976 seconds.
--------------------------------------------------
Testing 'rust'...
  Finished 'rust' 500 times in 0.6500 seconds.
--------------------------------------------------
Testing 'go'...
  Finished 'go' 500 times in 0.9680 seconds.
--------------------------------------------------
Testing 'python'...
  Finished 'python' 500 times in 10.7584 seconds.
--------------------------------------------------
Performance tests complete.
```

### Using "Power saver mode" of Windows 11

```text
$ make test-all
./bench-exec-loop.sh all 500
Starting performance tests for all with 500 iterations each.
--------------------------------------------------
Testing 'sh'...
  Finished 'sh' 500 times in 1.1760 seconds.
--------------------------------------------------
Testing 'c'...
  Finished 'c' 500 times in 0.9549 seconds.
--------------------------------------------------
Testing 'rust'...
  Finished 'rust' 500 times in 1.2885 seconds.
--------------------------------------------------
Testing 'go'...
  Finished 'go' 500 times in 1.8039 seconds.
--------------------------------------------------
Testing 'python'...
  Finished 'python' 500 times in 20.9097 seconds.
--------------------------------------------------
Performance tests complete.
```
