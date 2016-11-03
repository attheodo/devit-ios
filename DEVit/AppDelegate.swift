//
//  AppDelegate.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 26/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import UIKit

import Firebase
import XCGLogger

let l = XCGLogger.default

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        l.setup(level: .verbose,
                showThreadName: false,
                showLevel: true,
                showFileNames: true,
                showLineNumbers: true)
        
        FIRApp.configure()
        FIRDatabase.database().persistenceEnabled = true
        
        loadStoryboard()
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    /// Loads appripriate Storyboard according to whether the user is currently logged-in
    private func loadStoryboard() {
        
        // If not email is saved in defaults, go straight to login
        if UserDefaults.standard.string(forKey: Constants.UserDefaults.userEmail) == nil {
            loadLoginScene()
            return
        } else {
            loadMainScene()
        }
        
        let email = UserDefaults.standard.string(forKey: Constants.UserDefaults.userEmail)
        
        FirebaseManager.sharedInstance.performLogin(withEmail: email) { isLoggedIn in
            if !isLoggedIn {
                self.loadLoginScene()
            }

        }
        
    }
    
    /// Loads main Storyboard
    public func loadMainScene() {

        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: Bundle.main)

        let rootVC = storyboard.instantiateInitialViewController()
        window!.rootViewController = rootVC
        window!.makeKeyAndVisible()
    
    }
    
    /// Loads `LoginViewController` scene
    public func loadLoginScene() {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.mainStoryboard, bundle: Bundle.main)

        let storyboardId = Constants.Storyboards.Scenes.mainStoryboardLoginViewControllerScene
        let rootVC = storyboard.instantiateViewController(withIdentifier: storyboardId)
        self.window!.rootViewController = rootVC
        self.window!.makeKeyAndVisible()
        
    }

}

