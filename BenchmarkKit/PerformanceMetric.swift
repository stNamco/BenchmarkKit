//
//  PerformanceMetric.swift
//  BenchmarkKit
//
//  Created by stnamco on 2019/12/25.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

public struct DefaultPerformanceMetric: RawRepresentable, Equatable, Hashable {
    public let rawValue: String

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension DefaultPerformanceMetric {
    /// Records wall clock time in seconds between `startMeasuring`/`stopMeasuring`.
    static let wallClockTime = DefaultPerformanceMetric(rawValue: WallClockTimeMetric.name)
}
