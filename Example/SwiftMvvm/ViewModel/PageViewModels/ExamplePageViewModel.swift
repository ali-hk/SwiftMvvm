//
//  ExamplePageViewModel.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import SwiftMvvm

class ExamplePageViewModel: ViewModelBase, INavigatingViewModel  {
    private let exampleRepo: IExampleRepository
    let navigationService: INavigationService

    var items: [ItemViewModel] = []

    init(exampleRepo: IExampleRepository, navigationService: INavigationService) {
        self.exampleRepo = exampleRepo
        self.navigationService = navigationService
        items = exampleRepo.getAllItems().map { item in
            ItemViewModel(item: item)
        }
    }

    func navigateToDetail(itemID: Int) {
        do {
            try self.navigationService.navigate(to: "detailSegue", withParameter: itemID)
        } catch {
            print("Failed to navigate")
        }
    }
}
