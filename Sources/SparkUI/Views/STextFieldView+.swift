//
//  STextFieldView+.swift
//  
//
//  Created by Alex Nagy on 30/05/2020.
//

import UIKit

public extension STextFieldView {
    @discardableResult
    func placeholder(_ placeholder: String?) -> STextFieldView {
        self.textField?.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> STextFieldView {
        self.textField?.text = text
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> STextFieldView {
        textField?.isSecureTextEntry = isSecureTextEntry
        return self
    }
    
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> STextFieldView {
        textField?.keyboardType = keyboardType
        return self
    }
    
    @discardableResult
    func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> STextFieldView {
        textField?.autocapitalizationType = autocapitalizationType
        return self
    }
    
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> STextFieldView {
        textField?.isEnabled = isEnabled
        return self
    }
}
