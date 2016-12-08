//
//  SpeakersViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 08/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher

class SpeakersViewController: UIViewController {
    
    class func instantiateFromStoryboard() -> TalksViewController {
        
        let storyboardId = Constants.Storyboards.mainStoryboard
        let sceneId = Constants.Storyboards.Scenes.mainStoryboardTalksViewControllerScene
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: sceneId) as! TalksViewController
        
    }

    // MARK: - IBOutlets
    @IBOutlet weak var speakerProfilePicImageView: SpeakerProfileImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerCompanyLabel: UILabel!
    
    public var speaker: Speaker!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        _configureSpeaker()
    }
    
    // MARK: - Private Methods
    private func _configureSpeaker() {
        
        speakerNameLabel.text = speaker.name!
        
        if let speakerCompany = speaker.company {
            speakerCompanyLabel.text = speakerCompany
        } else {
            speakerCompanyLabel.text = ""
        }
        
        speakerProfilePicImageView.setImageFromFirebaseStorage(withFilename: speaker.id!,
                                                        andStorageReferece: FirebaseManager.sharedInstance.speakerProfilePicsRef)
    
    }
    
}
