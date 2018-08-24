//
//  ExampleRepository.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class ExampleRepository {
    private let exampleService: IExampleService
    private var itemsCache: [Int: ExampleItem] = [:]

    init(exampleService: IExampleService) {
        self.exampleService = exampleService
    }
}

extension ExampleRepository: IExampleRepository {
    func getAllItems() -> [ExampleItem] {
        if self.itemsCache.isEmpty {
            let items = self.exampleService.getAllItems()
            for item in items {
                itemsCache[item.id] = item
            }
        }

        return Array(self.itemsCache.values)
    }

    func getItem(by id: Int) -> ExampleItem? {
        if let item = self.itemsCache[id] {
            return item
        }

        return self.exampleService.getItem(by: id)
    }
}
