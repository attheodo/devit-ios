//
//  WorkshopCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class WorkshopCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var speakerNameLabel: UILabel!
    
    // MARK: - Public Properties
    public var workshop: Workshop?  {
        didSet {
            _setupCell()
        }
    }

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _configureCell()
        
    }
    
    // MARK: - Private Methods
    private func _configureCell() {

        backgroundColor = Colors.lightBlue!
        workshopNameLabel.textColor = Colors.darkBlue!
        speakerNameLabel.textColor = Colors.lightGray!

    }
    
    private func _setupCell() {
        
        workshopNameLabel.text = workshop!.name!
        speakerNameLabel.text = workshop!.speaker!.name
        
    }
}
