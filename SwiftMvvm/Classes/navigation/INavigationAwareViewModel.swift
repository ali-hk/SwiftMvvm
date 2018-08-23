//
//  INavigationAware.swift
//
//  Created by Ali Hosseini Khayat on 3/4/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

public protocol INavigationAwareViewModel: class {
    func onNavigatedTo(withParameter parameter: Any?)
}
