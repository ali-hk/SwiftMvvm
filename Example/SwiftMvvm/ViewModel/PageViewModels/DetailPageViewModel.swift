//
//  DetailPageViewModel.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import SwiftMvvm

class DetailPageViewModel: ViewModelBase, INavigationAware {
    private let exampleRepo: IExampleRepository
    var itemViewModel: ItemViewModel?

    init(exampleRepo: IExampleRepository) {
        self.exampleRepo = exampleRepo
    }

    func onNavigatedTo(withParameter parameter: Any?) {
        guard let itemID = parameter as? Int else {
            print("Invalid navigation parameter")
            return
        }

        guard let item = self.exampleRepo.getItem(by: itemID) else {
            print("Invalid item id")
            return
        }

        self.itemViewModel = ItemViewModel(item: item)
    }
}
