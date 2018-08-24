//
//  ExampleTableViewController.swift
//  SwiftMvvm
//
//  Created by ali-hk@users.noreply.github.com on 08/23/2018.
//  Copyright (c) 2018 ali-hk@users.noreply.github.com. All rights reserved.
//

import UIKit
import SwiftMvvm

class ExampleTableViewController: UITableViewControllerBase<ExamplePageViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func onNavigatedTo(withParameter parameter: Any?) {
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath)

        guard let vm = self.viewModel?.items[indexPath.row] else {
            print("Unable to retrieve viewmodel for row \(indexPath.row)")
            return cell
        }

        cell.textLabel?.text = vm.name
        cell.detailTextLabel?.text = vm.leagueAndCountry

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = self.viewModel?.items[indexPath.row] else {
            print("Unable to retrieve viewmodel for row \(indexPath.row)")
            return
        }

        self.viewModel?.navigateToDetail(itemID: vm.id)
    }
}
