//
//  STableSupplementaryView.swift
//  
//
//  Created by Alex Nagy on 17/05/2020.
//

import UIKit
import Layoutless

open class STableSupplementaryView<T>: UITableViewHeaderFooterView {
    
    open var item: T? {
        didSet {
            layoutViews()
            configureViews(for: self.item)
        }
    }

    open var indexPath: IndexPath?
    open var reuse = true

    public let container = UIView()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addActions()
        subscribe()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        if !reuse {
            layoutViews()
            configureViews(for: self.item)
        }
    }

    open func layoutViews() {
        stack(.vertical)(
            container
        ).fillingParent().layout(in: self)
    }

    open func configureViews(for item: T?) {
        setSupplementaryViewBackgroundColor()
    }
    
    open func addActions() {}
    open func subscribe() {}
    
    public func setSupplementaryViewBackgroundColor(_ containerBackgroundColor: UIColor) {
        container.backgroundColor = containerBackgroundColor
    }
    
    public func setSupplementaryViewBackgroundColor(all color: UIColor = .systemBackground) {
        setSupplementaryViewBackgroundColor(color)
    }
}

