//
//  DetailViewController.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Injectable {

    struct Dependency {
        let title: String
        let description: String
    }

    private let presenter: DetailPresenter

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
    }

    private func configuration() {
        navigationItem.title = presenter.navigationTitle
    }
}
