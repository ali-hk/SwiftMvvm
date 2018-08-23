//
//  INavigationService.swift
//
//  Created by Ali Hosseini Khayat on 3/4/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

public protocol INavigationService: class {
    func initialize(navigable: INavigable)
    func uninitialize(navigable: INavigable)
    func navigate(to pageToken: String, withParameter parameter: Any?) throws
}

public enum NavigationError: Error {
    case unititalized
}
