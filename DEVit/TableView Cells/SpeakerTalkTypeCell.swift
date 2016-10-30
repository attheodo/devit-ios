//
//  SpeakerTalkTypeCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class SpeakerTalkTypeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startingTimeLabel: UILabel!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    // MARK: - Private Properties
    private lazy var DateManager = {
        DateFormatterManager.sharedFormatter
    }()
    
    // MARK: - Public Properties
    public var talk: Talk? = nil {
        didSet {
            _setupCell()
        }
    }
    
    override func awakeFromNib() {
        _configureCell()
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        backgroundColor = Colors.lightBlue!
        titleLabel.textColor = Colors.darkBlue!
        startingTimeLabel.textColor = Colors.darkGray!
        speakerNameLabel.textColor = Colors.lightGray!
        durationLabel.textColor = Colors.lightGray!
        
        accessoryType = .disclosureIndicator
        
    }
    
    private func _setupCell() {
        
        titleLabel.text = talk!.name!
        startingTimeLabel.text = DateManager.dateWith_Hmm_formatAsStringFromDate(date: talk!.startTime!)
        speakerNameLabel.text = talk!.speaker!.name
        durationLabel.text = String(talk!.duration!)
        
    }
}
