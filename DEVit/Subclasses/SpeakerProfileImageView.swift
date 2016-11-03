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
    override var image: UIImage? {
        didSet {
            if image != nil {
                _configureBorder()
            } else {
                _removeBorder()
            }
        }

    }
    
    public var type: SpeakerProfileImageViewType = .small
    
    override func awakeFromNib() {
      
        super.awakeFromNib()
        _configureView()
    
    }
    
    // MARK: - Private Methods
    private func _configureView() {
    
        layoutIfNeeded()
        
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    
    }
    
    private func _configureBorder() {
        
        switch type {
        
        case .small:
            layer.borderWidth = 2.0
            
        case .big:
            layer.borderWidth = 4.0
        
        }
        
        layer.borderColor = Colors.mediumBlue.cgColor
        
    }
    
    private func _removeBorder() {
        layer.borderWidth = 0
    }
    
}
