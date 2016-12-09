//
//  SpeakerListViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 26/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

class SpeakerListViewController: UIViewController, UIGestureRecognizerDelegate,
                                 UITableViewDelegate, UITableViewDataSource {

    // MARK: - IBOutlets
    @IBOutlet weak var speakerListTableView: UITableView!
    
    // MARK: - Private Properties
    private lazy var ModelsManager = {
        FirebaseManager.sharedInstance
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        // hack to enable swipe to go back gesture
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        _registerNotifications()
        _configureView()
        
    }

    // MARK: - Private Methods
    private func _configureView() {
        
        view.backgroundColor = Colors.lightBlue
        speakerListTableView.backgroundColor = Colors.lightBlue
    
    }
    
    // MARK: - TableView Delegate/DataSource
    private enum SpeakerListTableViewCells {
        
        case speakerItemCell
        
        var reuseIdentifier: String {
            switch self {
            case .speakerItemCell:
                return "SpeakerItemCell"
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelsManager.speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SpeakerListTableViewCells.speakerItemCell.reuseIdentifier,
            for: indexPath) as! SpeakerItemCell
        
        cell.speaker = ModelsManager.speakers[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let speakerDetailsVC = SpeakerDetailsViewController.instantiateFromStoryboard()
        speakerDetailsVC.speaker = ModelsManager.speakers[indexPath.row]
        
        navigationController?.pushViewController(speakerDetailsVC, animated: true)
    
    }
    
    // MARK: - Notifications
    private func _registerNotifications() {
        
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(self._reloadSpeakerListTableView),
                       name: Constants.Notifications.speakersTalksAssociationFinished,
                       object: nil)
        
    
    }
    
    // MARK: Notification Selectors
    @objc private func _reloadSpeakerListTableView() {
    
        HUD.hide()
        speakerListTableView.reloadData()
    
    }

    

}

