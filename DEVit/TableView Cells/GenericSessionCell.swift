//
//  GenericSessionCell.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

class GenericSessionCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var activeSessionIndicatorView: ActiveSessionIndicatorView!
    
    // MARK: - Public Properties
    public var talk: Talk? = nil
    
    override func awakeFromNib() {
        _configureCell()
    }
    
    // MARK: - Public Methods
    func _configureCell() {
        backgroundColor = Colors.lightBlue!
    }

}
