# BenchmarkKit
Tool for easily benchmarking performance


how to use
```
BenchmarkKit.measure {
    for i in 0...count {
        if optional != nil {
            print(i)
        }
    }
}

BenchmarkKit.measureMetrics(automaticallyStartMeasuring: false) { benchmarkKit in

    // Do setup work that needs to be done for every iteration but
    // you don't want to measure before the call to `startMeasuring()`
    print("set up")
    benchmarkKit.startMeasuring()

    // Do that thing you want to measure.
    print("MyFunction()")
    benchmarkKit.stopMeasuring()

    // Do teardown work that needs to be done for every iteration
    // but you don't want to measure after the call to `stopMeasuring()`
}
```

log
```
file: /xxx/BenchmarkKit/Example/Example/SceneDelegate.swift, line: 81, result: [Time, seconds] average: 0.061, relative standard deviation: 11.752%, values: [0.079962, 0.063296, 0.062250, 0.061769, 0.058102, 0.059179, 0.056469, 0.056478, 0.056128, 0.056593], performanceMetricID:com.namco.BenchmarkKit.PerformanceMetric_WallClockTime, maxPercentRelativeStandardDeviation: 10.000%, maxStandardDeviation: 0.100
```
