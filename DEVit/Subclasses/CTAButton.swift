//
//  CTAButton.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class CTAButton: UIButton {
    override func awakeFromNib() {
        _configure()
    }
    
    // MARK: - Private Methods
    private func _configure() {
        
        backgroundColor = Colors.darkBlue
        layer.cornerRadius = 3.0
        setTitleColor(UIColor.white, for: .normal)
    
    }
}
