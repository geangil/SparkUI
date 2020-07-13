//
//  SCollectionCell.swift
//  
//
//  Created by Alex Nagy on 11/05/2020.
//

import UIKit
import Layoutless

open class SCollectionCell<T>: UICollectionViewCell {
    
    public var item: T? {
        didSet {
            layoutViews()
            configureViews(for: self.item)
        }
    }
    
    open var indexPath: IndexPath?
    open var reuse = true
    
    public let container = UIView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
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
        ).fillingParent().layout(in: contentView)
    }
    
    open func configureViews(for item: T?) {
        setCellBackgroundColor()
    }
    
    open func addActions() {}
    open func subscribe() {}
    
    public func setCellBackgroundColor(selectedBackgroundViewColor: UIColor,
                                   backgroundColor: UIColor,
                                   contentViewBackgroundColor: UIColor,
                                   containerBackgroundColor: UIColor) {
        selectedBackgroundView = UIView().setBackground(color: selectedBackgroundViewColor)
        self.backgroundColor = backgroundColor
        contentView.backgroundColor = contentViewBackgroundColor
        container.backgroundColor = containerBackgroundColor
    }
    
    public func setCellBackgroundColor(all color: UIColor = .systemBackground) {
        setCellBackgroundColor(selectedBackgroundViewColor: color, backgroundColor: color, contentViewBackgroundColor: color, containerBackgroundColor: color)
    }
    
    public func setup(with item: T, at indexPath: IndexPath, reuse: Bool = true) {
        self.indexPath = indexPath
        self.reuse = reuse
        self.item = item // needs to be fired last to triger layout and configure views
    }
}
