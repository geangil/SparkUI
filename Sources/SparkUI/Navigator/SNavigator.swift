//
//  SNavigator.swift
//  
//
//  Created by Alex Nagy on 06/05/2020.
//

import Foundation
import UIKit

public typealias Navigator = SNavigator

open class SNavigator: NSObject, SNavigatable {
    public var childNavigators: [SNavigatable] = [SNavigatable]()
    public var navigation: UINavigationController = UINavigationController()
    
    open func start() { }
    
    public func didDismiss(_ child: Navigatable?) {
        for (index, navigator) in childNavigators.enumerated() {
            if navigator === child {
                childNavigators.remove(at: index)
                break
            }
        }
    }
    
}