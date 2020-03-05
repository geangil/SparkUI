//
//  SSwitch+.swift
//  
//
//  Created by Alex Nagy on 05/03/2020.
//

import UIKit

extension SSwitch {
    
    @discardableResult
    public func onTintColor(_ onTintColor: UIColor?) -> SSwitch {
        self.object?.onTintColor(onTintColor)
        return self
    }
    
    @discardableResult
    public func onImage(_ onImage: UIImage?) -> SSwitch {
        self.object?.onImage(onImage)
        return self
    }
    
    @discardableResult
    public func offImage(_ offImage: UIImage?) -> SSwitch {
        self.object?.offImage(offImage)
        return self
    }
    
    @discardableResult
    public func isOn(_ isOn: Bool) -> SSwitch {
        self.object?.isOn(isOn)
        return self
    }
    
    @discardableResult
    public func setOn(_ setOn: Bool, animated: Bool = true) -> SSwitch {
        self.object?.setOn(setOn, animated: animated)
        return self
    }
}

