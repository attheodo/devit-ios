//
//  WorkshopsViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

class WorkshopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var workshopTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var workshopsTableView: UITableView!
    
    class func instantiateFromStoryboard() -> WorkshopsViewController {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: Constants.Storyboards.Scenes.mainStoryboardWorkshopsViewControllerScene) as! WorkshopsViewController
    
    }
    
    // MARL: - Private Properties
    private var _workshops:[Workshop] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        _registerNotifications()
        _configureView()
        
        HUD.show(.progress)
        
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        
        title = "Workshops"
        
        view.backgroundColor = Colors.lightBlue
        workshopTypeSegmentedControl.tintColor = Colors.darkBlue
    
    }
    
    // MARK: - UITableView Delegate/Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _workshops.count
    }
    
    // MARK: - Notifications
    private func _registerNotifications() {
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self._reloadWorkshopsTableView), name: Constants.Notifications.speakersWorkshopsAssociationFinished, object: nil)
        
    }
    
    // MARK: Notification Selectors
    @objc private func _reloadWorkshopsTableView() {
        
        HUD.hide()
        workshopsTableView.reloadData()
    
    }


}
