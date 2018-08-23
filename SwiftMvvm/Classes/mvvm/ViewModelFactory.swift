//
//  ViewModelFactory.swift
//
//  Created by Ali Hosseini Khayat on 1/28/18.
//  Copyright © 2018 Ali Hosseini Khayat. All rights reserved.
//

import Foundation

public class ViewModelFactory {
    public static var resolver: ITypeResolver?

    static func resolveViewModel<TViewModel>() -> TViewModel? {
        if let resolver = resolver {
            return resolver.resolve()
        }

        return nil
    }
}
