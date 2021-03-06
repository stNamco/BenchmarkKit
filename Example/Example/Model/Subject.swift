//
//  Subject.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import Foundation

struct Subject: Resource {
    static func fetch() -> [Subject] {
        return resource
    }

    let title: String
    let description: String
    let code: String
}

private let resource: [Subject] = [
    Subject(title: "文字列結合の処理時間", description: "+ 演算子を使う方法", code: "func join1() { text = \"これは\" + \"テスト\" + \"です\"}")
]
