//
//  RoundedCornersShadowedView.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 02/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class RoundedCornersShadowedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureView()
    }
    
    // MARK: - Private Properties
    private func _configureView() {
        
        self.layer.cornerRadius = 5.0
        
        self.layer.shadowOffset = CGSize(width:0, height:1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.25
        
        self.clipsToBounds = false
        self.layer.masksToBounds = false

    }
}
