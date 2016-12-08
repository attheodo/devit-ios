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

    private lazy var ModelsManager = {
        FirebaseManager.sharedInstance
    }()
    
    // MARK: - Private Properties
    private lazy var DateManager = {
        DateFormatterManager.sharedFormatter
    }()
    
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
        
        talkDetailsTableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0)
        
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
    
    private func _didFinishRatingTopic(rating: Double) {
        ModelsManager.addTopicRating(forTalkId: talk.id!, rating: rating)
    }
    
    private func _didFinishRatingPresentation(rating: Double) {
        ModelsManager.addPresentationRating(forTalkId: talk.id!, rating: rating)
    }
    
    private func _shouldDisplayRating() -> Bool {
        
        let timeResult = DateManager.isCurrentTimeWithinTimeRange(startingTime: talk.startTime!, duration: talk.duration!)
        let ratingDeadline = DateManager.isCurrentTimeWithinTimeRange(startingTime: talk.startTime!, duration: Constants.Config.ratingDeadlineInMinutes)
        
        if timeResult == .later && (ratingDeadline == .withinRange || ratingDeadline == .earlier) {
            return true
        } else {
            return false
        }

    }
    // MARK: - UITableView Delegate/Datasource
    private enum TalkDetailsTableViewCell {
        
        case sessionRating
        case talkDescription
        case talkSpeaker
        
        var reuseIdentifier: String {
            switch self {
            case .sessionRating:
                return "SessionRatingCell"
            case .talkDescription:
                return "GenericItemDescriptionCell"
            case .talkSpeaker:
                return "TalkSpeakerCell"
            }
        }
        
    }

    private func _setupRatingCell() -> SessionRatingCell {
       
        let cell = talkDetailsTableView.dequeueReusableCell(withIdentifier: TalkDetailsTableViewCell.sessionRating.reuseIdentifier) as! SessionRatingCell
        
        if let rating = ModelsManager.ratings.filter({ $0.id == talk.id }).first {
            cell.rating = rating
        }
        
        
        cell.topicRatingControl.didFinishTouchingCosmos = { rating in
            self._didFinishRatingTopic(rating: rating)
        }
        
        cell.presentationRatingControl.didFinishTouchingCosmos = { rating in
            self._didFinishRatingPresentation(rating: rating)
        }
        
        
        return cell

    }
    
    private func _setupDescriptionCell() -> GenericItemDescriptionCell {
        
        let cell = talkDetailsTableView.dequeueReusableCell(withIdentifier: TalkDetailsTableViewCell.talkDescription.reuseIdentifier) as! GenericItemDescriptionCell
        cell.descriptionLabel.text = talk.abstract!
        
        return cell

    }
    
    private func _setupSpeakerCell() -> TalkSpeakerCell {
        
        let cell = talkDetailsTableView.dequeueReusableCell(withIdentifier: TalkDetailsTableViewCell.talkSpeaker.reuseIdentifier) as! TalkSpeakerCell
        cell.speaker = talk.speaker!
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if _shouldDisplayRating() {
            return 3
        } else {
            return 2
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            if _shouldDisplayRating() {
                return _setupRatingCell()
            } else {
                return _setupDescriptionCell()
            }
            
        case 1:
            
            if _shouldDisplayRating() {
                return _setupDescriptionCell()
            } else {
                return _setupSpeakerCell()
            }
            
        case 2:
            return _setupSpeakerCell()
        
        default:
            return UITableViewCell()
        }
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)!.isKind(of: TalkSpeakerCell.self) {
            
            let speakerDetailsVC = SpeakerDetailsViewController.instantiateFromStoryboard()
            speakerDetailsVC.speaker = talk.speaker!
            
            navigationController?.pushViewController(speakerDetailsVC, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
