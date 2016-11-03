//
//  BottomBorderTextField.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class BottomBorderTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configure()
    }
    
    // MARK: - Private Methods
    private func _configure() {
        
        borderStyle = .none
        
        layoutIfNeeded()
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:40, height:10))
        leftViewMode = UITextFieldViewMode.always
        leftView = spacerView
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width,
                              width:  self.frame.size.width,
                              height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
}
