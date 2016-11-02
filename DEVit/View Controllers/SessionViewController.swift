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

class SessionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var talkNameLabel: UILabel!
    @IBOutlet weak var talkTagsView: TagListView!
    
    // MARK: - Public Properties
    public var talk: Talk!
    
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
    
}
