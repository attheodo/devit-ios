//
//  SessionRatingCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 02/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import Cosmos

class SessionRatingCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: RoundedCornersShadowedView!
    @IBOutlet weak var topicRatingControl: CosmosView!
    @IBOutlet weak var presentationRatingControl: CosmosView!
    
    public var talk: Talk!
    public var rating: Rating? {
        didSet {
            _setCurrentRating()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureCell()
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        selectionStyle = .none
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
    }
    
    private func _setCurrentRating() {
       
        guard let rating = rating else {
            return
        }
        
        if let topicRating = rating.topic {
            topicRatingControl.rating = topicRating
        }
        
        if let presentationRating = rating.presentation {
            presentationRatingControl.rating = presentationRating
        }

    }
}
