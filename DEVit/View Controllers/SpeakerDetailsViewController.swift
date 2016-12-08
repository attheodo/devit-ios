//
//  SpeakerDetailsViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 08/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher
import KINWebBrowser

class SpeakerDetailsViewController:
UIViewController, UITableViewDelegate, UITableViewDataSource, SocialMediaLinksCellDelegate {
   
    class func instantiateFromStoryboard() -> SpeakerDetailsViewController {
        
        let storyboardId = Constants.Storyboards.mainStoryboard
        let sceneId = Constants.Storyboards.Scenes.mainStoryboardSpeakerDetailsViewControllerScene
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: sceneId) as! SpeakerDetailsViewController
        
    }

    // MARK: - IBOutlets
    @IBOutlet weak var speakerProfilePicImageView: SpeakerProfileImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerCompanyLabel: UILabel!
    @IBOutlet weak var speakerDetailsTableView: UITableView!
    
    public var speaker: Speaker!
    
    // MARK: - IBActions
    @IBAction func didTapBackButton() {
        navigationController!.popViewController(animated: true)
    }
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        _configureView()
        _configureSpeaker()
    
    }
    
    // MARK: - Private Methods
    private func _configureView() {
        
        view.backgroundColor = Colors.lightBlue
        speakerProfilePicImageView.type = .big
        
    }
    
    private func _configureSpeaker() {
        
        speakerNameLabel.text = speaker.name!
        
        if let speakerCompany = speaker.company {
            speakerCompanyLabel.text = speakerCompany
        } else {
            speakerCompanyLabel.text = ""
        }
        
        speakerProfilePicImageView.setImageFromFirebaseStorage(withFilename: speaker.id!,
                andStorageReferece: FirebaseManager.sharedInstance.speakerProfilePicsRef)
    
    }
    
    // MARK: - UITableView Delegate/Datasource
    private enum SpeakerDetailsTableViewCell {
        
        case about
        case socialMedia
        
        var reuseIdentifier: String {
            switch self {
            case .about:
                return "GenericItemDescriptionCell"
            case .socialMedia:
                return "SocialMediaLinksCell"
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
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SpeakerDetailsTableViewCell.about.reuseIdentifier)
                as! GenericItemDescriptionCell
            
            cell.titleLabel.text = "ABOUT \(speaker.name!.components(separatedBy: " ")[0].uppercased())"
            cell.descriptionLabel.text = speaker.bio!
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SpeakerDetailsTableViewCell.socialMedia.reuseIdentifier)
                as! SocialMediaLinksCell
            
            cell.speaker = speaker
            cell.delegate = self
            
            return cell
        
        }
        
        return UITableViewCell()
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - SocialMediaLinksCellDelegate
    func didTapGithubButton(sender: UITableViewCell) {
        
        guard let githubURL = speaker.githubURL else {
            return
        }
        
        showWebViewController(forUrlString: githubURL)
        
    }
    
    func didTapWebsiteButton(sender: UITableViewCell) {
        
        guard let websiteURL = speaker.websiteURL else {
            return
        }
        
        showWebViewController(forUrlString: websiteURL)
        
    }
    
    func didTapLinkedInButton(sender: UITableViewCell) {
        
        guard let linkedinURL = speaker.linkedinURL else {
            return
        }
        
        let linkedinUsername = linkedinURL.components(separatedBy: "/").last!
        
        if UIApplication.shared.canOpenURL(URL(string: "linkedin://")!) {
            UIApplication.shared.openURL(URL(string: "linkedin://profile/\(linkedinUsername)")!)
        } else {
            showWebViewController(forUrlString: linkedinURL)
        }

    }
    
    func didTapTwitterButton(sender: UITableViewCell) {
       
        guard let twitterURL = speaker.twitterURL else {
            return
        }
        
        let twitterUsername = twitterURL.components(separatedBy: "/").last!

        if UIApplication.shared.canOpenURL(URL(string: "twitter://")!) {
            UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=\(twitterUsername)")!)
        } else {
            showWebViewController(forUrlString: twitterURL)
        }
        
    }
    
    private func showWebViewController(forUrlString urlString: String) {
        
        let webVC = KINWebBrowserViewController.navigationControllerWithWebBrowser()!
        self.present(webVC, animated: true, completion: nil)
        
        let rootWebVC = webVC.rootWebBrowser()!
            
        rootWebVC.barTintColor = Colors.darkestBlue
        rootWebVC.tintColor = Colors.lightBlue
        
        rootWebVC.loadURLString(urlString)
        
    }
}
