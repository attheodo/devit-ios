//
//  TalksViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class TalksViewController: UIViewController {
    
    class func instantiateFromStoryboard() -> TalksViewController {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: Constants.Storyboards.Scenes.mainStoryboardTalksViewControllerScene) as! TalksViewController
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        _configureView()
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        title = "Talks"
        view.backgroundColor = Colors.lightBlue
    }
}
