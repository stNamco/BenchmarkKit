//
//  BenchmarkResultComponent.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit

final class BenchmarkResultComponent: UIView {

    struct Model {
        let title: String
        let code: String
        let processingTime: Double
    }

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var excutedCodeTextView: UITextView!
    @IBOutlet weak var processingTimeLabel: UILabel!

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
        initialize()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialize()
    }

    private func initialize() {

    }

    func setAppearance(model: Model) {
        titleLabel.text = model.title
        excutedCodeTextView.text = model.code
        processingTimeLabel.text = "result: \(model.processingTime)"
    }
}
