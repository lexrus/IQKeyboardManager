//
//  OptionsViewController.swift
//  Demo
//
//  Created by Iftekhar on 26/08/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

import UIKit

protocol OptionsViewControllerDelegate: AnyObject {

    func optionsViewController(_ controller: OptionsViewController, index: NSInteger)
}

class OptionsViewController: UITableViewController {

    weak var delegate: OptionsViewControllerDelegate?

    var options = [String]()

    var selectedIndex: Int = 0

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell",
                                                       for: indexPath) as? OptionTableViewCell else {
            fatalError("Can't dequeue cell")
        }

        cell.labelOption.text = options[indexPath.row]

        if indexPath.row == self.selectedIndex {

            cell.accessoryType = .checkmark
        } else {

            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        selectedIndex = indexPath.row

        delegate?.optionsViewController(self, index: indexPath.row)

        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)
    }
}
