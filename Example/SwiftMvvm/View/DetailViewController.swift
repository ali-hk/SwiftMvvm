//
//  DetailViewController.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftMvvm

class DetailViewController: UIViewControllerBase<DetailPageViewModel> {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leagueAndCountryLabel: UILabel!
    @IBOutlet weak var sportLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let itemVM = self.viewModel?.itemViewModel else {
            print("No detail item")
            return
        }

        self.nameLabel.text = itemVM.name
        self.leagueAndCountryLabel.text = itemVM.leagueAndCountry
        self.sportLabel.text = itemVM.sport
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
