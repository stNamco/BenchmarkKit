//
//  MainViewController.swift
//  Example
//
//  Created by stnamco on 2020/03/14.
//  Copyright © 2020 namco. All rights reserved.
//

import UIKit

final class MainViewController: UITableViewController {

    lazy var data: [Subject] = DataSource.fetch(type: Subject.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

    private func configuration() {
        tableView.delegate = self
        tableView.rowHeight = 50
    }
}

// MARK: - UITableViewDataSource

extension MainViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let subject = data[indexPath.row]
        cell.textLabel?.text = subject.title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = UIStoryboard(name: "Detail", bundle: .main).instantiateInitialViewController { (coder) -> UIViewController? in
            return DetailViewController(coder: coder)
        }

        guard let vc = detail else {
            return
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}
