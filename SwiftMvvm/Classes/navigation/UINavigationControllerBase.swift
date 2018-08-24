//
//  NavigationControllerBase.swift
//
//  Created by Ali Hosseini Khayat on 3/6/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

open class UINavigationControllerBase: UINavigationController, INavigable, INavigationAware {
    private var lastPageToken: String?
    private var lastParameter: Any?

    public func navigate(to pageToken: String, withParameter parameter: Any?) {
        lastPageToken = pageToken
        lastParameter = parameter
        self.performSegue(withIdentifier: pageToken, sender: nil)
    }

    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let viewModelAware = segue.destination as? IViewModelAwareController {
            guard let navigationAwareVM = viewModelAware.viewModelBase as? INavigationAware else {
                return
            }

            navigationAwareVM.onNavigatedTo(withParameter: lastParameter)
        }

        if let navigationAwareVC = segue.destination as? INavigationAware {
            navigationAwareVC.onNavigatedTo(withParameter: lastParameter)
        }
    }

    open func onNavigatedTo(withParameter parameter: Any?) {
    }
}
