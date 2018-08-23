//
//  PageViewModelBase.swift
//
//  Created by Ali Hosseini Khayat on 3/5/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

public protocol PageViewModelBase: INavigatingViewModel {
}

extension PageViewModelBase {
    init(navigationService: INavigationService) {
        self.init(navigationService: navigationService)
    }
}
