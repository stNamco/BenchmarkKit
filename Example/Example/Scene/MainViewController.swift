//
//  MainViewController.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit

final class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

    private func configuration() {
//        tableView

    }
}

// MARK: - UITableViewDataSource

extension MainViewController {

}

// MARK: - UITableViewDelegate

extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
