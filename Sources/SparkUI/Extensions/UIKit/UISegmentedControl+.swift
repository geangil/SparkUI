//
//  UISegmentedControl+.swift
//  
//
//  Created by Alex Nagy on 07/03/2020.
//

import UIKit

public extension UISegmentedControl {
    
    @discardableResult
    func insertSegments(_ segments: [String]) -> UISegmentedControl {
        for i in 0..<segments.count {
            let segment = segments[i]
            insertSegment(withTitle: segment, at: i, animated: false)
        }
        return self
    }
    
    @discardableResult
    func select(_ index: Int) -> UISegmentedControl {
        selectedSegmentIndex = index
        return self
    }
}

public extension UISegmentedControl {
    func addAction(completion: @escaping (Int) -> ()) {
        self.addAction(events: [.valueChanged]) { (uiSegmentedControl: UISegmentedControl) in
            completion(uiSegmentedControl.selectedSegmentIndex)
        }
    }
}

