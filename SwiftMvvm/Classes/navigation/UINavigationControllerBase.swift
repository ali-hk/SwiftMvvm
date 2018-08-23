//
//  NavigationControllerBase.swift
//
//  Created by Ali Hosseini Khayat on 3/6/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

open class UINavigationControllerBase: UINavigationController, INavigable {
    private var lastPageToken: String?
    private var lastParameter: Any?

    public func navigate(to pageToken: String, withParameter parameter: Any?) {
        lastPageToken = pageToken
        lastParameter = parameter
        self.performSegue(withIdentifier: pageToken, sender: nil)
    }

    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard let viewModelAware = segue.destination as? IViewModelAwareController else {
            return
        }

        guard let navigationAwareVM = viewModelAware.viewModelBase as? INavigationAwareViewModel else {
            return
        }

        navigationAwareVM.onNavigatedTo(withParameter: lastParameter)
    }
}
