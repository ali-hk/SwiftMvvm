//
//  NavigationService.swift
//
//  Created by Ali Hosseini Khayat on 3/4/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

public class NavigationService: INavigationService {
    private weak var navigable: INavigable?

    public init() {
    }

    public func initialize(navigable: INavigable) {
        self.navigable = navigable
    }

    public func uninitialize(navigable: INavigable) {
        if let currentNavigable = self.navigable {
            if  currentNavigable === navigable {
                self.navigable = nil
            }
        }
    }

    public func navigate(to pageToken: String, withParameter parameter: Any?) throws {
        guard let navigable = navigable else {
            NSLog("Navigable hasn't been initialized")
            throw NavigationError.unititalized
        }

        navigable.navigate(to: pageToken, withParameter: parameter)
    }
}
