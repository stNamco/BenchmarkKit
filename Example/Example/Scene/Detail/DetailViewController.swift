//
//  DetailViewController.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit
import BenchmarkKit

class DetailViewController: UIViewController, Injectable {

    struct Dependency {
        let title: String
        let description: String
        let code: String
    }

    private let presenter: DetailPresenter

    @IBOutlet weak var tmpView: BenchmarkResultComponent!

    init?(coder: NSCoder, dependency: Dependency) {
        self.presenter = DetailPresenter(dependency: dependency)
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()

        testBenchmarkMethod()
    }

    private func configuration() {
        navigationItem.title = presenter.navigationTitle

        tmpView.setAppearance(model: .init(title: presenter.codeDescription, code: presenter.excutedCode, processingTime: 0))
    }
}

// MEMO: the following code is temporary

extension DetailViewController {
    func testBenchmarkMethod() {
        var optional: Int? = nil
        let count = 10000

        BenchmarkKit.measure {
            for i in 0...count {
                if let _ = optional {
                    print(i)
                }
            }
        }

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
    }
}

