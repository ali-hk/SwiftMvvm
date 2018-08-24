//
//  ExampleService.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class ExampleService {
    private let fakeServiceData = [
        0: ExampleItem(id: 0, name: "Juventus FC", league: "Serie A", country: "Italy", sport: .Football),
        1: ExampleItem(id: 1, name: "New York Rangers", league: "NHL", country: "United States", sport: .Hockey),
        2: ExampleItem(id: 2, name: "Anaheim Ducks", league: "NHL", country: "United States", sport: .Hockey),
        3: ExampleItem(id: 3, name: "Golden State Warriors", league: "NBA", country: "United States", sport: .Basketball)
    ]
}

extension ExampleService: IExampleService {
    func getAllItems() -> [ExampleItem] {
        return Array(self.fakeServiceData.values)
    }

    func getItem(by id: Int) -> ExampleItem? {
        return self.fakeServiceData[id]
    }

}
