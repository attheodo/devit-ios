//
//  SpeakerItemCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 09/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class SpeakerItemCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var speakerProfilePicImageView: SpeakerProfileImageView!
    
    public var speaker: Speaker! {
        didSet {
            _configureSpeaker()
        }
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _configureCell()
    
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            backgroundColor = Colors.grayBlue
        } else {
            backgroundColor = Colors.lightBlue
        }
        
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        backgroundColor = Colors.lightBlue
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        speakerNameLabel.textColor = Colors.darkBlue
        startDateLabel.textColor = Colors.lightGray
        
    }
    
    private func _configureSpeaker() {
        
        speakerNameLabel.text = speaker.name!
        speakerProfilePicImageView.setImageFromFirebaseStorage(
            withFilename: "\(speaker.id!).png",
            andStorageReferece: FirebaseManager.sharedInstance.speakerProfilePicsRef)
        
        if speaker.talk != nil && speaker.workshop == nil {
            startDateLabel.text = DateFormatterManager.sharedFormatter
                                    .dateWith_Hmm_formatAsString(fromDate: speaker.talk!.startTime!)
        } else if speaker.workshop != nil && speaker.talk == nil {
            
            startDateLabel.text = "Workshop"
        
        } else if speaker.workshop != nil && speaker.talk != nil {
            let talkStartTime = DateFormatterManager.sharedFormatter
                .dateWith_Hmm_formatAsString(fromDate: speaker.talk!.startTime!)
            startDateLabel.text = "\(talkStartTime) & \(_workshopLabel(forWorkshop: speaker.workshop!))"

        }
        
    }
    
    private func _workshopLabel(forWorkshop workshop: Workshop) -> String {
        if workshop.isAllDay {
            return "full-day workshop"
        } else {
            return "workshop"
        }
    }

}
