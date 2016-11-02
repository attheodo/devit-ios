//
//  TalkDescriptionCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 02/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class TalkDescriptionCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: RoundedCornersShadowedView!
    @IBOutlet weak var talkDetailsLabel: UILabel!
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        _configureCell()
    
    }
    
    // MARK: - Private Methods
    private func _configureCell() {
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
    }
}
