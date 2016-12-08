//
//  TalkSpeakerCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 08/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher

class TalkSpeakerCell: UITableViewCell {
    
    // MARK: IBOutlets 
    @IBOutlet weak var containerView: RoundedCornersShadowedView!
    @IBOutlet weak var speakerProfilePicImageView: SpeakerProfileImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    
    public var speaker: Speaker! {
        didSet {
            _configureSpeaker()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureCell()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            containerView.backgroundColor = Colors.grayBlue
        } else {
            containerView.backgroundColor = UIColor.white
        }
    }
    
    // MARK: - Private Methods
    private func _configureCell() {

        selectionStyle = .none
        backgroundColor = UIColor.clear
        
    }
    
    private func _configureSpeaker() {
        
        speakerNameLabel.text = speaker.name!
        speakerProfilePicImageView.setImageFromFirebaseStorage(withFilename: speaker.id!,
                                                        andStorageReferece: FirebaseManager.sharedInstance.speakerProfilePicsRef)
    
    }

}
