//
//  SessionsViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 26/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import UIKit

import PageMenu

class SessionsViewController: UIViewController {

    private var pageMenu: CAPSPageMenu!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        _configureView()
        _configurePageMenu()

    }
    
    // MARK: - Private Methods
    private func _configureView() {
        view.backgroundColor = Colors.lightBlue
    }
    private func _configurePageMenu() {
        
        let talksVC = TalksViewController.instantiateFromStoryboard()
        talksVC.parentNavController = self.navigationController!
        talksVC.title = "Talks"
        
        let workshopsVC = WorkshopsViewController.instantiateFromStoryboard()
        workshopsVC.title = "Workshops"
        
        let options:[CAPSPageMenuOption] = [
            // Layout
            .selectionIndicatorHeight(0),
            .menuHeight(60),
            .menuItemSeparatorWidth(0),
            .menuItemWidthBasedOnTitleTextWidth(true),
            // Look & feel
            .viewBackgroundColor(Colors.lightBlue),
            .scrollMenuBackgroundColor(Colors.lightBlue),
            .selectedMenuItemLabelColor(Colors.darkestBlue),
            .unselectedMenuItemLabelColor(Colors.darkestBlueFaded),
            .menuItemFont(UIFont.systemFont(ofSize: 26.0, weight: UIFontWeightHeavy)),
            .useMenuLikeSegmentedControl(false),
        ]
        
        pageMenu = CAPSPageMenu(
            viewControllers: [talksVC, workshopsVC],
            frame: CGRect(x:0.0,
                          y:22.0,
                          width: self.view.frame.width,
                          height: self.view.frame.height),
            pageMenuOptions: options)
        
        self.view.addSubview(pageMenu.view)
    }


}

