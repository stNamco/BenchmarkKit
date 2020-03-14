//
//  BenchmarkResultComponent.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit

final class BenchmarkResultComponent: UIView {

    @IBOutlet private var contentView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    private func loadFromNib() {
        Bundle(for: type(of: self)).loadNibNamed(BenchmarkResultComponent.className, owner: self, options: nil)
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            self.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            self.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUI()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeUI()
    }

    private func initializeUI() {

    }
}
