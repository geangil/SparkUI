//
//  SViewController.swift
//  
//
//  Created by Alex Nagy on 13/02/2020.
//

import UIKit
import SparkExtensions

open class SViewController: UIViewController {
    
    public var safeArea: SSafeArea
    
    public let hud = SHud.create()
    
    public let container = UIView()
    
    public init(_ safeArea: SSafeArea = .all) {
        self.safeArea = safeArea
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        container.backgroundColor = .systemBackground
        layoutViews()
        bind()
        observe()
        continueViewDidLoad()
    }
    
    open func layoutViews() {
        view.addSubview(container)
        container.edgeTo(view, safeArea: safeArea)
    }
    
    open func bind() {}
    open func observe() {}
    open func continueViewDidLoad() {}
}
