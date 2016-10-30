//
//  TalksViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

class TalksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    class func instantiateFromStoryboard() -> TalksViewController {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: Constants.Storyboards.Scenes.mainStoryboardTalksViewControllerScene) as! TalksViewController
    
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var talksTableView: UITableView!

    // MARK: - Private Properties
    private lazy var ModelsManager = {
       FirebaseManager.sharedInstance
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        _registerNotifications()
        _configureView()
        _loadTalksData()
    
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        title = "Talks"
        
        view.backgroundColor = Colors.lightBlue
        talksTableView.backgroundColor = UIColor.clear
    }
    
    private func _loadTalksData() {

        HUD.show(.progress)
        
        ModelsManager.startObservingTalkSnapshots()
        ModelsManager.startObservingSpeakerSnaphots()

    }
    
    // MARK: - UITableView Datasource/Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelsManager.talks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let talks = ModelsManager.talks
        
        if talks[indexPath.row].type! == .devit {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DevitTalkTypeCell") as! DevitTalkTypeCell
            cell.talk = talks[indexPath.row]
            
            return cell
        
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerTalkTypeCell") as! SpeakerTalkTypeCell
            cell.talk = talks[indexPath.row]
            
            return cell
        
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let talks = ModelsManager.talks
        
        if talks[indexPath.row].type! == .devit {
            return 60.0
        } else {
            return 110.0
        }
        
    }
    
    // MARK: - Notifications
    private func _registerNotifications() {
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self._reloadTalksTableView), name: Constants.Notifications.speakersTalksAssociationFinished, object: nil)
    
    }
    
    // MARK: Notification Selectors
    @objc private func _reloadTalksTableView() {
        HUD.hide()
        talksTableView.reloadData()
    }

}
