//
//  Constants.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

struct Constants {
    
    /// Constants related to Storyboards
    struct Storyboards {
        
        /// Main storyboard name
        static let mainStoryboard = "Main"
        
        struct Scenes {
            /// `LoginViewController` scene storyboard id
            static let mainStoryboardLoginViewControllerScene = "LoginViewController"
            
            /// `TalksViewController` scene storyboard id
            static let mainStoryboardTalksViewControllerScene = "TalksViewController"
            
            /// `WorkshopsViewController` scene storyboard id
            static let mainStoryboardWorkshopsViewControllerScene = "WorkshopsViewController"
        }

    }
    
    struct UserDefaults {
        
        /// The currently saved email address of the user
        static let userEmail = "kDEVitUserDefaultsUserEmail"
    
    }
    
    struct Notifications {
        
        /// Posted when a new talks snapshot is fetched from Firebase
        static let talksSnapshotUpdated = Notification.Name("kDEVitNotificationsTalksSnapshotUpdated")
        /// Posted when a new speakers snapshot is fetched from Firebase
        static let speakersSnapshotUpdated = Notification.Name("kDEVitNotificationsSpeakersSnapshotUpdated")
        /// Posted when FirebaseManager has completed relating talks/speakers
        static let speakersTalksAssociationFinished = Notification.Name("kDEVitNotificationsSpeakersTalksRelatingFinished")
    }
}
