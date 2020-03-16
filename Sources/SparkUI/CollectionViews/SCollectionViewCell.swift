//
//  SCollectionViewCell.swift
//  
//
//  Created by Alex Nagy on 21/02/2020.
//

import UIKit
import Layoutless

public protocol SCollectionViewCellDelegate {
    func didDelete()
}

public class SCollectionViewCell: UICollectionViewCell {
    
    public let container = UIView()
    public let cellContainerView = UIView()
    public let deleteContainerView = UIView()
    
    public var delegate: SCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        container.backgroundColor = .systemBackground
        layoutViews()
        bind()
        observe()
        continueInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func layoutViews() {
        
        stack(.horizontal, distribution: .fillEqually)(
            cellContainerView.setWidth(self.frame.width),
            deleteContainerView.setWidth(self.frame.width)
        ).scrolling(.horizontal, configure: { (scrollView) in
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.delegate = self
            scrollView.bounces = false
        }).fillingParent().layout(in: container)
        
        stack(.vertical)(
            container
        ).fillingParent().layout(in: self)
    }
    
    open func bind() {}
    open func observe() {}
    open func continueInit() {}
}

extension SCollectionViewCell: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= self.frame.width {
            delegate?.didDelete()
        }
    }
}
