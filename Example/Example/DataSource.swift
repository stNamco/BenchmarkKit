//
//  DataSource.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import Foundation

protocol Resource {
    static func fetch() -> [Self]
}

class DataSource {
    func get<T: Resource>(type: T) -> [T] {
        return T.fetch()
    }
}
