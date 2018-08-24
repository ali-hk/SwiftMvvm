//
//  UITableViewControllerBase.swift
//
//  Created by Ali Hosseini Khayat on 3/3/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import UIKit

open class UITableViewControllerBase<TViewModel: ViewModelBase>: UITableViewController, IViewModelAwareController, INavigable, INavigationAware {
    private var lastPageToken: String?
    private var lastParameter: Any?

    public let viewModel: TViewModel? = {
        return ViewModelFactory.resolveViewModel()
    }()

    internal let viewModelBase: ViewModelBase?

    public required init?(coder aDecoder: NSCoder) {
        self.viewModelBase = self.viewModel

        super.init(coder: aDecoder)
    }

    open override func viewWillAppear(_ animated: Bool) {
        if let navigationController = self.navigationController as? UINavigationControllerBase, let navigatingViewModel = self.viewModel as? INavigatingViewModel {
            navigatingViewModel.navigationService.initialize(navigable: navigationController)
        } else if let navigatingViewModel = self.viewModel as? INavigatingViewModel {
            navigatingViewModel.navigationService.initialize(navigable: self)
        }
    }

    open override func viewWillDisappear(_ animated: Bool) {
        if let navigationController = self.navigationController as? UINavigationControllerBase, let navigatingViewModel = self.viewModel as? INavigatingViewModel {
            navigatingViewModel.navigationService.uninitialize(navigable: navigationController)
        } else if let navigatingViewModel = self.viewModel as? INavigatingViewModel {
            navigatingViewModel.navigationService.uninitialize(navigable: self)
        }
    }

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
