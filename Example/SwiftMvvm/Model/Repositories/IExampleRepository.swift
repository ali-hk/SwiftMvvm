//
//  IExampleRepository.swift
//  SwiftMvvm_Example
//
//  Created by Ali Hosseini Khayat on 8/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

protocol IExampleRepository {
    func getAllItems() -> [ExampleItem]
    func getItem(by id: Int) -> ExampleItem?
}
