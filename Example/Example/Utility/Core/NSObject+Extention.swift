//
//  NSObject+Extention.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import Foundation

extension NSObject {

    public static var className: String {
        return String(describing: self)
    }

    public var className: String {
        return String(describing: type(of: self))
    }
}
