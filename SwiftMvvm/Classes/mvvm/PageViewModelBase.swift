//
//  PageViewModelBase.swift
//
//  Created by Ali Hosseini Khayat on 3/5/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

open class PageViewModelBase: INavigatingViewModel {
    public private(set) var navigationService: INavigationService

    public init(navigationService: INavigationService) {
        self.navigationService = navigationService
    }
}
