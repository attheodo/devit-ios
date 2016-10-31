//
//  SessionViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class SessionViewController: UIViewController {
    
    class func instantiateFromStoryboard() -> SessionViewController {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: Constants.Storyboards.Scenes.mainStoryboardSessionsviewControllerScene) as! SessionViewController
        
    }

    
    // MARK: - IBActions
    @IBAction func didTapBackButton() {
        navigationController!.popViewController(animated: true)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    
    }
}
