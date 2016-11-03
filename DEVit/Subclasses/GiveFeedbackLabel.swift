//
//  GiveFeedbackLabel.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 03/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class GiveFeedbackLabel: UILabel {
    
    override func awakeFromNib() {
        _configureLabel()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)))
    }
    
    // MARK: - Private Methods
    private func _configureLabel() {
        
        backgroundColor = Colors.orangeBright
        layer.cornerRadius = 3.0
        clipsToBounds = true
        
        text = "GIVE FEEDBACK"
        font = UIFont.systemFont(ofSize: 10.0, weight: UIFontWeightBold)
        textColor = UIColor.white
        
    }
}
