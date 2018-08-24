//
//  AppDelegate.swift
//  SwiftMvvm
//
//  Created by ali-hk@users.noreply.github.com on 08/23/2018.
//  Copyright (c) 2018 ali-hk@users.noreply.github.com. All rights reserved.
//

import UIKit
import Swinject
import SwiftMvvm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let container: Container = {
        let container = Container()
        // Services
        container.register(INavigationService.self) { _ in NavigationService()}.inObjectScope(.container)
        container.register(IExampleService.self) { _ in ExampleService()}.inObjectScope(.container)

        // Repositories
        container.register(IExampleRepository.self) { resolver in ExampleRepository(exampleService: resolver.resolve(IExampleService.self)!)}.inObjectScope(.container)

        // PageViewModels
        container.register(ExamplePageViewModel.self) { resolver in ExamplePageViewModel(exampleRepo: resolver.resolve(IExampleRepository.self)!, navigationService: resolver.resolve(INavigationService.self)!)}.inObjectScope(.container)
        container.register(DetailPageViewModel.self) { resolver in DetailPageViewModel(exampleRepo: resolver.resolve(IExampleRepository.self)!)}.inObjectScope(.container)

        return container
    }()

    override init() {
        super.init()
        ViewModelFactory.resolver = self

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

extension AppDelegate: ITypeResolver {
    func resolve<T>() -> T? {
        return container.resolve(T.self)
    }
}
