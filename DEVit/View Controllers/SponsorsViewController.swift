//
//  SponsorsViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 09/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

class SponsorsViewController: UIViewController {
    
    @IBOutlet weak var sponsorsCollectionView: UICollectionView!
    
    // MARK: - Private Properties
    private lazy var ModelsManager = {
        FirebaseManager.sharedInstance
    }()
    
    private var sponsors:[String: [Sponsor]] = [:]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        _configureView()
        _loadSponsors()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        view.backgroundColor = Colors.lightBlue
    }
    
    private func _loadSponsors() {
        
        HUD.show(.progress)
        
        ModelsManager.getSponsors { result, error in
            
            HUD.hide()
            
            if let sponsors = result {
                self.sponsors = sponsors
                self.sponsorsCollectionView.reloadData()
            }
        
        }
    
    }
    
}
