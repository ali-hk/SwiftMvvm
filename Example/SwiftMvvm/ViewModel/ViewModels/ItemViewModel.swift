//
//  ItemViewModel.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class ItemViewModel {
    private let item: ExampleItem

    var id: Int {
        return self.item.id
    }

    var name: String {
        return self.item.name
    }

    var leagueAndCountry: String {
        return "\(self.item.league), \(self.item.country)"
    }

    var sport: String {
        return self.item.sport.rawValue
    }

    init(item: ExampleItem) {
        self.item = item
    }
}
