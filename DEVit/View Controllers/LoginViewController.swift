//
//  LoginViewController.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: BottomBorderTextField!
    @IBOutlet weak var submitButton: CTAButton!
    
    private lazy var APIManager = {
        FirebaseManager.sharedInstance
    }()
    
    private lazy var Defaults = {
        UserDefaults.standard
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        _configureView()
    }
    
    deinit {
        
    }
    
    // MARK: - Private Properties
    private func _configureView() {
        view.backgroundColor = Colors.darkestBlue
        
    }
    
    // MARK: - IBActions
    /// Selector to `submitButton`. Uses `emailTextField.text` to 
    /// perform a login with the backend
    @IBAction func performLogin() {
        
        HUD.show(.progress)
        
        emailTextField.resignFirstResponder()
        
        APIManager.performLogin(withEmail: emailTextField.text!) { success in
            
            HUD.hide()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            if success {

                self.Defaults.set(self.emailTextField.text!, forKey: Constants.UserDefaults.userEmail)
                appDelegate.loadMainScene()
            
            } else {
                // TODO: Present an error
                print("bad")
            }
        }
        
        
    }
    
}
