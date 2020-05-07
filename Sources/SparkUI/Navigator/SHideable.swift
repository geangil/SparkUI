//
//  SHideable.swift
//  
//
//  Created by Alex Nagy on 07/05/2020.
//

import Foundation

public protocol Dismissable_withCompletion: AnyObject {
    func dismiss(completion: @escaping () -> ())
}

public protocol Dismissable: AnyObject {
    func dismiss()
}

public protocol Popable_Animated: AnyObject {
    func pop(animated: Bool)
}

public protocol Popable: AnyObject {
    func pop()
}

public protocol PopToRootable_Animated: AnyObject {
    func popToRoot(animated: Bool)
}

public protocol PopToRootable: AnyObject {
    func popToRoot()
}