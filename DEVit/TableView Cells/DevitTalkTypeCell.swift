//
//  DevitTalkTypeCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class DevitTalkTypeCell: UITableViewCell {
    
    @IBOutlet weak var activeSessionIndicatorView: ActiveSessionIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startingTimeLabel: UILabel!
    @IBOutlet weak var sessionTypeImageView: UIImageView!
    
    // MARK: - Private Properties
    private lazy var DateManager = {
        DateFormatterManager.sharedFormatter
    }()
    
    // MARK: - Public Properties
    public var talk: Talk?  {
        didSet {
            _setupCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        _configureCell()
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        selectionStyle = .none
        backgroundColor = Colors.lightBlue
        titleLabel.textColor = Colors.mediumBlue
        startingTimeLabel.textColor = Colors.darkGray
    
    }
    
    private func _setupCell() {
        
        titleLabel.text = talk!.name!
        
        if let startTime = talk!.startTime {
        
            startingTimeLabel.text = DateManager.dateWith_Hmm_formatAsString(fromDate: startTime)
            
            let timeRangeResult = DateManager.isCurrentTimeWithinTimeRange(startingTime: startTime,
                                                                           duration: talk!.duration!)
            
            if timeRangeResult == .withinRange {
                activeSessionIndicatorView.setActive()
            } else {
                activeSessionIndicatorView.setInactive()
            }
        
        }
        
        switch talk!.name! {
            case "Registration":
                sessionTypeImageView.image = UIImage(named: "registration-icon")
            case "Opening Ceremony", "Closing Ceremony":
                sessionTypeImageView.image = UIImage(named: "ceremony-icon")
            case "Coffee Break":
                sessionTypeImageView.image = UIImage(named: "coffee-break-icon")
            case "Lunch Break":
                sessionTypeImageView.image = UIImage(named: "lunch-break-icon")
            default:
                sessionTypeImageView.image = nil
        }
        
    }

}
