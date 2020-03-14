//
//  DetailPresenter.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import Foundation

// will implement some logic on this screen. so decided to implement presenter

protocol DetailInput {

}

protocol DetailOutput {
    var navigationTitle: String { get }
    var codeDescription: String { get }
    var excutedCode: String { get }
}

private typealias Presenter = DetailInput & DetailOutput

final class DetailPresenter: Presenter {

    let navigationTitle: String
    let codeDescription: String
    let excutedCode: String

    init(dependency: DetailViewController.Dependency) {
        self.navigationTitle = dependency.title
        self.codeDescription = dependency.description
        self.excutedCode = dependency.code
    }
}
