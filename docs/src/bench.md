# Benchmarks

## Procedure

These are obtained by running the bench.sh script in the test/ directory, e.g.

```
sh bench.sh 1 2 8 16 | tee benchOutput.txt
```

The benchmarks just involve a small selection of models, whose mutation and potential functions involve different amounts of arithmetic intensity and dimension of the particles. Clearly, it would be beneficial if the SMC community could agree on a suitable set of benchmarks to cover a wide variety of uses of SMC.

The processor information is obtained using Hwloc, which may not always be reliable. For example, the X5675 has 6 physical and 12 logical cores, which differs from the output below.

In the case of the E5-2667 v3 *only*, there is an issue with that particular machine's time stamp counter (TSC), which very adversely affects Julia's multi-threading, due to repeated system calls to obtain the time. For this reason, Julia was recompiled for this particular benchmark to disable thread profiling (this is a single preprocessor definition) and it was also run with JULIA_THREAD_SLEEP_THRESHOLD=0, which essentially eliminates time checks to send threads to sleep.

More benchmark results should eventually follow and contributions are welcome, please email them to Anthony Lee.

## Results

### E5-2667 v3 (Haswell)

```
x86_64-linux-gnu
Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz (haswell) ; 8 Physical, 16 Logical
Julia 0.6.2 using 1 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     427.571 μs (0 allocations: 0 bytes)
15     14.008 ms (0 allocations: 0 bytes)
20     475.663 ms (0 allocations: 0 bytes)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     3.062 ms (0 allocations: 0 bytes)
15     93.969 ms (0 allocations: 0 bytes)
20     3.076 s (0 allocations: 0 bytes)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     7.292 ms (0 allocations: 0 bytes)
15     228.784 ms (0 allocations: 0 bytes)
20     7.404 s (0 allocations: 0 bytes)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     18.674 ms (0 allocations: 0 bytes)
15     677.262 ms (0 allocations: 0 bytes)
20     20.945 s (0 allocations: 0 bytes)

x86_64-linux-gnu
Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz (haswell) ; 8 Physical, 16 Logical
Julia 0.6.2 using 2 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     265.258 μs (58 allocations: 2.13 KiB)
15     7.442 ms (58 allocations: 2.13 KiB)
20     259.181 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     1.623 ms (58 allocations: 2.13 KiB)
15     49.242 ms (58 allocations: 2.13 KiB)
20     1.596 s (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     3.875 ms (70 allocations: 2.56 KiB)
15     120.873 ms (70 allocations: 2.56 KiB)
20     3.937 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     9.991 ms (58 allocations: 2.13 KiB)
15     322.275 ms (58 allocations: 2.13 KiB)
20     10.550 s (58 allocations: 2.13 KiB)

x86_64-linux-gnu
Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz (haswell) ; 8 Physical, 16 Logical
Julia 0.6.2 using 8 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     156.166 μs (58 allocations: 2.13 KiB)
15     3.190 ms (58 allocations: 2.13 KiB)
20     124.468 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     499.578 μs (58 allocations: 2.13 KiB)
15     13.897 ms (58 allocations: 2.13 KiB)
20     461.113 ms (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     1.082 ms (70 allocations: 2.56 KiB)
15     33.026 ms (70 allocations: 2.56 KiB)
20     1.068 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     2.745 ms (58 allocations: 2.13 KiB)
15     89.940 ms (58 allocations: 2.13 KiB)
20     2.848 s (58 allocations: 2.13 KiB)

x86_64-linux-gnu
Intel(R) Xeon(R) CPU E5-2667 v3 @ 3.20GHz (haswell) ; 8 Physical, 16 Logical
Julia 0.6.2 using 16 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     139.753 μs (58 allocations: 2.13 KiB)
15     1.695 ms (58 allocations: 2.13 KiB)
20     90.893 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     486.448 μs (58 allocations: 2.13 KiB)
15     12.934 ms (58 allocations: 2.13 KiB)
20     422.990 ms (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     857.726 μs (70 allocations: 2.56 KiB)
15     24.287 ms (70 allocations: 2.56 KiB)
20     811.622 ms (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     2.205 ms (58 allocations: 2.13 KiB)
15     68.630 ms (58 allocations: 2.13 KiB)
20     2.269 s (58 allocations: 2.13 KiB)
```

### X5675 (Westmere)

```
x86_64-pc-linux-gnu
Intel(R) Xeon(R) CPU           X5675  @ 3.07GHz (westmere) ; 12 Physical, 12 Logical
Julia 0.6.2 using 1 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     605.047 μs (0 allocations: 0 bytes)
15     19.881 ms (0 allocations: 0 bytes)
20     711.570 ms (0 allocations: 0 bytes)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     4.514 ms (0 allocations: 0 bytes)
15     146.216 ms (0 allocations: 0 bytes)
20     4.773 s (0 allocations: 0 bytes)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     9.210 ms (0 allocations: 0 bytes)
15     295.984 ms (0 allocations: 0 bytes)
20     9.642 s (0 allocations: 0 bytes)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     25.382 ms (0 allocations: 0 bytes)
15     812.248 ms (0 allocations: 0 bytes)
20     26.175 s (0 allocations: 0 bytes)

x86_64-pc-linux-gnu
Intel(R) Xeon(R) CPU           X5675  @ 3.07GHz (westmere) ; 12 Physical, 12 Logical
Julia 0.6.2 using 2 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     471.944 μs (58 allocations: 2.13 KiB)
15     10.787 ms (58 allocations: 2.13 KiB)
20     397.859 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     2.539 ms (58 allocations: 2.13 KiB)
15     76.381 ms (58 allocations: 2.13 KiB)
20     2.536 s (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     4.840 ms (70 allocations: 2.56 KiB)
15     151.000 ms (70 allocations: 2.56 KiB)
20     4.967 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     13.068 ms (58 allocations: 2.13 KiB)
15     443.880 ms (58 allocations: 2.13 KiB)
20     13.591 s (58 allocations: 2.13 KiB)

x86_64-pc-linux-gnu
Intel(R) Xeon(R) CPU           X5675  @ 3.07GHz (westmere) ; 12 Physical, 12 Logical
Julia 0.6.2 using 6 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     295.348 μs (58 allocations: 2.13 KiB)
15     3.987 ms (58 allocations: 2.13 KiB)
20     194.822 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     1.033 ms (58 allocations: 2.13 KiB)
15     26.580 ms (58 allocations: 2.13 KiB)
20     935.893 ms (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     1.835 ms (70 allocations: 2.56 KiB)
15     52.459 ms (70 allocations: 2.56 KiB)
20     1.817 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     4.915 ms (58 allocations: 2.13 KiB)
15     144.660 ms (58 allocations: 2.13 KiB)
20     4.767 s (58 allocations: 2.13 KiB)

x86_64-pc-linux-gnu
Intel(R) Xeon(R) CPU           X5675  @ 3.07GHz (westmere) ; 12 Physical, 12 Logical
Julia 0.6.2 using 12 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     285.391 μs (58 allocations: 2.13 KiB)
15     2.222 ms (58 allocations: 2.13 KiB)
20     177.057 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     661.069 μs (58 allocations: 2.13 KiB)
15     13.912 ms (58 allocations: 2.13 KiB)
20     571.137 ms (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     1.090 ms (70 allocations: 2.56 KiB)
15     26.662 ms (70 allocations: 2.56 KiB)
20     1.012 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     2.489 ms (58 allocations: 2.13 KiB)
15     77.098 ms (58 allocations: 2.13 KiB)
20     2.509 s (58 allocations: 2.13 KiB)
```

### i7-4650U (Macbook Air 2013)

```
x86_64-apple-darwin14.5.0
Intel(R) Core(TM) i7-4650U CPU @ 1.70GHz (haswell) ; 2 Physical, 4 Logical
Julia 0.6.2 using 1 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     489.593 μs (0 allocations: 0 bytes)
15     15.796 ms (0 allocations: 0 bytes)
20     581.948 ms (0 allocations: 0 bytes)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     3.445 ms (0 allocations: 0 bytes)
15     116.387 ms (0 allocations: 0 bytes)
20     3.836 s (0 allocations: 0 bytes)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     8.501 ms (0 allocations: 0 bytes)
15     267.428 ms (0 allocations: 0 bytes)
20     8.842 s (0 allocations: 0 bytes)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     27.231 ms (0 allocations: 0 bytes)
15     897.206 ms (0 allocations: 0 bytes)
20     29.114 s (0 allocations: 0 bytes)

x86_64-apple-darwin14.5.0
Intel(R) Core(TM) i7-4650U CPU @ 1.70GHz (haswell) ; 2 Physical, 4 Logical
Julia 0.6.2 using 2 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     341.805 μs (58 allocations: 2.13 KiB)
15     9.639 ms (58 allocations: 2.13 KiB)
20     383.749 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     2.100 ms (58 allocations: 2.13 KiB)
15     71.799 ms (58 allocations: 2.13 KiB)
20     2.187 s (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     4.759 ms (70 allocations: 2.56 KiB)
15     153.073 ms (70 allocations: 2.56 KiB)
20     5.038 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     14.911 ms (58 allocations: 2.13 KiB)
15     487.701 ms (58 allocations: 2.13 KiB)
20     15.623 s (58 allocations: 2.13 KiB)

x86_64-apple-darwin14.5.0
Intel(R) Core(TM) i7-4650U CPU @ 1.70GHz (haswell) ; 2 Physical, 4 Logical
Julia 0.6.2 using 4 threads
Linear Gaussian Model, n = 10
log₂N  Benchmark
10     300.061 μs (58 allocations: 2.13 KiB)
15     7.858 ms (58 allocations: 2.13 KiB)
20     339.166 ms (58 allocations: 2.13 KiB)
Multivariate Linear Gaussian Model, d = 10, n = 10
log₂N  Benchmark
10     1.969 ms (58 allocations: 2.13 KiB)
15     65.497 ms (58 allocations: 2.13 KiB)
20     2.175 s (58 allocations: 2.13 KiB)
SMC Sampler Example, n = 12
log₂N  Benchmark
10     3.926 ms (70 allocations: 2.56 KiB)
15     128.009 ms (70 allocations: 2.56 KiB)
20     4.325 s (70 allocations: 2.56 KiB)
Lorenz96 Example, d = 8, n = 10
log₂N  Benchmark
10     13.381 ms (58 allocations: 2.13 KiB)
15     436.527 ms (58 allocations: 2.13 KiB)
20     14.559 s (58 allocations: 2.13 KiB)
```
