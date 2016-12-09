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

class SponsorsViewController: UIViewController,
                              UICollectionViewDataSource,
                              UICollectionViewDelegate,
                              UICollectionViewDelegateFlowLayout {
    
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
    
    private enum SponsorsCollectionViewSections: Int {
        case platinum
        case gold
        case silver
    }
    
    private enum SponsorsCollectionViewCells {
        
        case sponsorCell
        
        var reuseIdentifier: String {
            switch self {
            case .sponsorCell:
                return "SponsorCell"
            }
        }
        
    }

    
    // MARK: - UICollectionView Delegate/DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sponsors.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
       
        switch section {
        case SponsorsCollectionViewSections.platinum.rawValue:
            return sponsors["platinum"]!.count
        case SponsorsCollectionViewSections.gold.rawValue:
            return sponsors["gold"]!.count
        case SponsorsCollectionViewSections.silver.rawValue:
            return sponsors["silver"]!.count
        default:
            return 0
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SponsorsCollectionViewCells.sponsorCell.reuseIdentifier,
            for: indexPath) as! SponsorCell
        
        switch indexPath.section {
        case SponsorsCollectionViewSections.platinum.rawValue:
            cell.sponsor = sponsors["platinum"]![indexPath.row]
        case SponsorsCollectionViewSections.gold.rawValue:
            cell.sponsor = sponsors["gold"]![indexPath.row]
        case SponsorsCollectionViewSections.silver.rawValue:
            cell.sponsor = sponsors["silver"]![indexPath.row]
        default:
            true
        }
        
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0, 10.0, 10.0, 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case SponsorsCollectionViewSections.platinum.rawValue:
            return CGSize(width: collectionView.frame.size.width - 20.0, height: 80.0)
        case SponsorsCollectionViewSections.gold.rawValue:
            return CGSize(width: collectionView.frame.size.width/2 - 15.0, height: 60.0)
        case SponsorsCollectionViewSections.silver.rawValue:
            return CGSize(width: collectionView.frame.size.width/3 - 14.0, height: 40.0)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
