//
//  ActiveSessionsIndicatorView.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class ActiveSessionIndicatorView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureView()
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        
        layoutIfNeeded()
        backgroundColor = Colors.purple!
        layer.cornerRadius = frame.height / 2
        
    }
    
    // MARK: - Public Methods
    func setActive() {
        self.isHidden = false
        _startAnimating()
    }
    
    func setInactive() {
        self.isHidden = true
        _stopAnimating()
    }
    
    // MARK: - Private Methods
    private func _startAnimating() {
        
        let pulseAnimation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = 0.5
        pulseAnimation.toValue = NSNumber(value: 0.0)
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
        layer.add(pulseAnimation, forKey: "animateOpacity")
    
    }
    
    private func _stopAnimating() {
        layer.removeAllAnimations()
    }
}
