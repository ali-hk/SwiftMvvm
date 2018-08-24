//
//  ExampleItem.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

enum Sport: String {
    case Football
    case Hockey
    case Basketball
}

class ExampleItem {
    let id: Int
    let name: String
    let league: String
    let country: String
    let sport: Sport

    init(id: Int, name: String, league: String, country: String, sport: Sport) {
        self.id = id
        self.name = name
        self.league = league
        self.country = country
        self.sport = sport
    }
}
