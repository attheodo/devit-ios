//
//  SpeakerProfileImageView.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 02/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class SpeakerProfileImageView: UIImageView {
    
    enum SpeakerProfileImageViewType {
        case small
        case big
    }
    
    // MARK: - Public Properties
    public var type: SpeakerProfileImageViewType = .small {
        didSet {
            _configureBorder()
        }
    }
    
    override func awakeFromNib() {
      
        super.awakeFromNib()
        _configureView()
    
    }
    
    // MARK: - Private Properties
    private func _configureView() {
    
        layoutIfNeeded()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
        
        _configureBorder()
    
    }
    
    private func _configureBorder() {
        
        switch type {
        
        case .small:
            self.layer.borderWidth = 2.0
            
        case .big:
            self.layer.borderWidth = 4.0
        
        }
        
        self.layer.borderColor = Colors.mediumBlue!.cgColor
        
    }
    
}
