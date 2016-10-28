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
    
}
