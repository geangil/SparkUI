//
//  STextFieldView.swift
//  
//
//  Created by Alex Nagy on 06/03/2020.
//

import UIKit
import ReactiveKit
import Bond
import Layoutless

public class STextFieldView: UIView {
    
    public var object: STextField?
    private let eyeButton = UIButton()
        .image(UIImage(systemName: "eye.slash.fill")?.foreground(color: .systemGray))
        .size(CGSize(width: 50, height: 50))
    private let showingSecureText = Property(false)
    
    public init(sTextField: STextField, isSecure: Bool = false, underlined: Bool = true, underlineSpacing: CGFloat = 5) {
        self.object = sTextField
        super.init(frame: .zero)
        
        if isSecure {
            
            if underlined {
                let underline = SDivider()
                stack(.vertical)(
                    stack(.horizontal, spacing: 5)(
                        sTextField.isSecureTextEntry(true),
                        eyeButton
                    ),
                    Spacer().setHeight(underlineSpacing),
                    underline
                    ).fillingParent().layout(in: self)
            } else {
                stack(.vertical)(
                    stack(.horizontal, spacing: 5)(
                        sTextField.isSecureTextEntry(true),
                        eyeButton
                    )
                ).fillingParent().layout(in: self)
            }
            
            observe()
            
        } else {
            
            if underlined {
                let underline = SDivider()
                stack(.vertical)(
                    sTextField,
                    Spacer().setHeight(underlineSpacing),
                    underline
                    ).fillingParent().layout(in: self)
            } else {
                stack(.vertical)(
                    sTextField
                ).fillingParent().layout(in: self)
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func observe() {
        eyeButton.reactive.tap.observeNext { [weak self] in
            guard let self = self else { return }
            self.showingSecureText.value.toggle()
        }.dispose(in: bag)
        
        showingSecureText.observeNext { (showing) in
            if showing {
                self.object?.isSecureTextEntry(false)
                self.eyeButton
                    .image(UIImage(systemName: "eye.fill")?.foreground(color: .systemRed))
            } else {
                self.object?.isSecureTextEntry(true)
                self.eyeButton
                    .image(UIImage(systemName: "eye.slash.fill")?.foreground(color: .systemGray))
            }
        }.dispose(in: bag)
    }
}