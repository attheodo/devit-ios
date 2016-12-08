//
//  SocialMediaLinksCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 08/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

protocol SocialMediaLinksCellDelegate: class {
    
    func didTapLinkedInButton(sender: UITableViewCell)
    func didTapWebsiteButton(sender: UITableViewCell)
    func didTapGithubButton(sender: UITableViewCell)
    func didTapTwitterButton(sender: UITableViewCell)

}

class SocialMediaLinksCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var githubButton: UIButton!
    
    public var speaker: Speaker! {
        didSet {
            _configureButtons()
        }
    }
    
    public weak var delegate: SocialMediaLinksCellDelegate?
    
    // MARK: - IBActions
    @IBAction func didTapLinkedInButton() {
        delegate?.didTapLinkedInButton(sender: self)
    }
    
    @IBAction func didTapTwitterButton() {
        delegate?.didTapTwitterButton(sender: self)
    }
    
    @IBAction func didTapWebsiteButton() {
        delegate?.didTapWebsiteButton(sender: self)
    }
    
    @IBAction func didTapGithubButton() {
        delegate?.didTapGithubButton(sender: self)
    }
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureCell()
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        selectionStyle = .none
        backgroundColor = UIColor.clear
    
    }
    
    private func _configureButtons() {
        
        let fadedAlphaValue = CGFloat(0.2)
        
        if speaker.linkedinURL == nil {
            linkedinButton.alpha = fadedAlphaValue
            linkedinButton.isEnabled = false
        }
        
        if speaker.twitterURL == nil {
            twitterButton.alpha = fadedAlphaValue
            twitterButton.isEnabled = false
        }
        
        if speaker.githubURL == nil {
            githubButton.alpha = fadedAlphaValue
            githubButton.isEnabled = false
        }
        
        if speaker.websiteURL == nil {
            websiteButton.alpha = fadedAlphaValue
            websiteButton.isEnabled = false
        }
    }
    
}
