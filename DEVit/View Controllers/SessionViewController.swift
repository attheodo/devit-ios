//
//  SessionViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import TagListView

class SessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var talkNameLabel: UILabel!
    @IBOutlet weak var talkTagsView: TagListView!
    @IBOutlet weak var talkDetailsTableView: UITableView!
    
    // MARK: - Public Properties
    public var talk: Talk!
    private enum TalkDetailsTableViewRows: Int {
        case rating
        case details
        case speaker
    }
    
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
        navigationController?.setNavigationBarHidden(true, animated: true)
        // hack to enable swipe to go back gesture
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        _configureView()
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        
        view.backgroundColor = Colors.lightBlue
        
        talkNameLabel.text = talk.name!
        durationLabel.text = "\(talk.duration!) m"
        
        _configureTags()
        
    }
    
    private func _configureTags() {
        
        talkTagsView.textFont = UIFont.systemFont(ofSize: 14)

        guard let tags = talk!.tags else {
            return
        }
        
        for (i, tag) in tags.enumerated() {
            
            let tag = talkTagsView.addTag(tag)
            
            tag.backgroundColor = Colors.tagColors[i % 4]
            tag.cornerRadius = 3.0
        
        }
        

    }
    
    // MARK: - UITableView Delegate/Datasource
    private enum TalkDetailsTableViewCell {
        
        case sessionRating
        case talkDescription
        
        var reuseIdentifier: String {
            switch self {
            case .sessionRating:
                return "SessionRatingCell"
            case .talkDescription:
                return "TalkDescriptionCell"
            }
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TalkDetailsTableViewCell.sessionRating.reuseIdentifier) as! SessionRatingCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TalkDetailsTableViewCell.talkDescription.reuseIdentifier) as! TalkDescriptionCell
            cell.talkDetailsLabel.text = talk.abstract!
            return cell
        default:
            return UITableViewCell()
        }
    
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
