//
//  Constants.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Config {
        // The deadline in minutes for the user to be able to rate a talk
        static let ratingDeadlineInMinutes = 2*60 // 2hrs
    }
    
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
            
            /// `SessionViewController` scene storyboard id
            static let mainStoryboardSessionsviewControllerScene = "SessionsViewController"
            
            /// `SpeakerDetailsViewController` scene storyboard id
            static let mainStoryboardSpeakerDetailsViewControllerScene = "SpeakerDetailsViewController"
            
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
        /// Posted when FirebaseManager has completed associating talks/speakers
        static let speakersTalksAssociationFinished = Notification.Name("kDEVitNotificationsSpeakersTalksAssociationFinished")
        /// Posted when a new workshops snapshot is fetched from Firebase
        static let workshopsSnapshotUpdated = Notification.Name("kDEVitNotificationsWorkshopsSnapshotUpdated")
        /// Posted when FirebaseManager has completed associating workshops/speaker
        static let speakersWorkshopsAssociationFinished = Notification.Name("kDEVitNotificationsSpeakersWorkshopsAssociationFinished")
        
    }
}
