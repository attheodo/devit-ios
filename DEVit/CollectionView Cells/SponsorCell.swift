//
//  SponsorCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 09/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class SponsorCell: UICollectionViewCell {
    
    @IBOutlet weak var sponsorLogoImageView: UIImageView!
    
    public var sponsor:Sponsor! {
        didSet {
            _configureSponsor()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configureCell()
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        backgroundColor = UIColor.white
        
        self.layer.cornerRadius = 5.0
        
        self.layer.shadowOffset = CGSize(width:0, height:1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.25
        
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    
    }
    
    private func _configureSponsor() {
        sponsorLogoImageView.setImageFromFirebaseStorage(withFilename: sponsor.imageFilename!,
                            andStorageReferece: FirebaseManager.sharedInstance.sponsorLogosRef)
    }
}
