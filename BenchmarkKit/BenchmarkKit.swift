//
//  BenchmarkKit.swift
//  BenchmarkKit
//
//  Created by stnamco on 2019/12/25.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

public class BenchmarkKit {

    private var _performanceMeter: PerformanceMeter?

    private init() {}

    public static func measure(file: StaticString = #file, line: Int = #line, block: () -> Void) {
        let benchmark = BenchmarkKit()
        benchmark.measure(file: file, line: line, block: block)
    }

    public static func measureMetrics(_ metrics: [DefaultPerformanceMetric] = BenchmarkKit.defaultPerformanceMetrics, automaticallyStartMeasuring: Bool, file: StaticString = #file, line: Int = #line, for block: (BenchmarkKit) -> Void) {
        let benchmark = BenchmarkKit()
        benchmark.measureMetrics(metrics, automaticallyStartMeasuring: automaticallyStartMeasuring, file: file, line: line) {
            block(benchmark)
        }
    }
}

public extension BenchmarkKit {
    
    /// The names of the performance metrics to measure when invoking `measure(block:)`.
    /// Returns `DefaultPerformanceMetric_WallClockTime` by default. Subclasses can
    /// override this to change the behavior of `measure(block:)`
    class var defaultPerformanceMetrics: [DefaultPerformanceMetric] {
        return [.wallClockTime]
    }

    /// - Parameter block: A block whose performance to measure.
    private func measure(file: StaticString = #file, line: Int = #line, block: () -> Void) {
        measureMetrics(type(of: self).defaultPerformanceMetrics,
                       automaticallyStartMeasuring: true,
                       file: file,
                       line: line,
                       for: block)
    }

    /// Caveats:
    /// * If `true` was passed for `automaticallyStartMeasuring` and `startMeasuring()`
    ///   is called anyway, the test will fail.
    /// * If `false` was passed for `automaticallyStartMeasuring` then `startMeasuring()`
    ///   must be called once and only once before the end of the block or the test will fail.
    /// * If `stopMeasuring()` is called multiple times during the block the test will fail.
    ///
    /// - Parameter metrics: An array of Strings (DefaultPerformanceMetrics) to measure.
    ///     Providing an unrecognized string is a test failure.
    /// - Parameter automaticallyStartMeasuring: If `false`,  will
    ///     not take any measurements until -startMeasuring is called.
    /// - Parameter block: A block whose performance to measure.
    private func measureMetrics(_ metrics: [DefaultPerformanceMetric], automaticallyStartMeasuring: Bool, file: StaticString = #file, line: Int = #line, for block: () -> Void) {
        PerformanceMeter.measureMetrics(metrics.map({ $0.rawValue }), delegate: self, file: file, line: line) { meter in
            self._performanceMeter = meter
            if automaticallyStartMeasuring {
                meter.startMeasuring(file: file, line: line)
            }
            block()
        }
    }

    /// Call this from within a measure block to set the beginning of the critical
    /// section. Measurement of metrics will start at this point.
    func startMeasuring(file: StaticString = #file, line: Int = #line) {
        guard let performanceMeter = _performanceMeter, !performanceMeter.didFinishMeasuring else {
            return recordAPIViolation(description: "Cannot start measuring. startMeasuring() is only supported from a block passed to measureMetrics(...).", file: file, line: line)
        }
        performanceMeter.startMeasuring(file: file, line: line)
    }

    /// Call this from within a measure block to set the ending of the critical
    /// section. Measurement of metrics will stop at this point.
    func stopMeasuring(file: StaticString = #file, line: Int = #line) {
        guard let performanceMeter = _performanceMeter, !performanceMeter.didFinishMeasuring else {
            return recordAPIViolation(description: "Cannot stop measuring. stopMeasuring() is only supported from a block passed to measureMetrics(...).", file: file, line: line)
        }
        performanceMeter.stopMeasuring(file: file, line: line)
    }

    func dumpResult(description: String, file: StaticString, line: Int) {
        print("file: \(file), line: \(line), result: \(description)")
    }
}

extension BenchmarkKit: PerformanceMeterDelegate {
    internal func recordAPIViolation(description: String, file: StaticString, line: Int) {
        dumpResult(description: description, file: file, line: line)
    }

    internal func recordMeasurements(results: String, file: StaticString, line: Int) {
        dumpResult(description: results, file: file, line: line)
    }

    internal func recordFailure(description: String, file: StaticString, line: Int) {
        dumpResult(description: description, file: file, line: line)
    }
}
