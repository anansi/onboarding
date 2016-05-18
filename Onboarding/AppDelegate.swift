//
//  AppDelegate.swift
//  Onboarding
//
//  Created by Julian Hulme on 2016/05/18.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var landingNavigationController: UINavigationController?
    var sessionNavigationController: UINavigationController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let landingViewController = LandingViewController(nibName:"LandingViewController",bundle:nil)
        self.landingNavigationController = UINavigationController(rootViewController: landingViewController)
        self.landingNavigationController?.navigationBarHidden = true
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = landingNavigationController
        
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //MARK: Navigation Functions
    func navigateToSessionNavigationController  (animated:Bool) {
        
        self.landingNavigationController?.popToRootViewControllerAnimated(false)
        let snapShot = self.window?.snapshotViewAfterScreenUpdates(true)
        self.sessionNavigationController?.visibleViewController!.view.addSubview(snapShot!)
        
        self.window?.rootViewController = self.sessionNavigationController
        self.sessionNavigationController?.popToRootViewControllerAnimated(animated)
        UIView.transitionWithView(self.window!, duration: NSTimeInterval(1), options: UIViewAnimationOptions.CurveLinear, animations: { self.window?.rootViewController = self.sessionNavigationController}, completion: nil)
        UIView.animateWithDuration(NSTimeInterval(1), animations: {snapShot?.layer.opacity = 0; snapShot?.layer.transform =  CATransform3DMakeScale(1.5, 1.5, 1.5)})
        
    }
    
    func navigateToLandingNavigationController  (animated:Bool) {
        
        
        let snapShot = self.window?.snapshotViewAfterScreenUpdates(true)
        self.sessionNavigationController?.visibleViewController!.view.addSubview(snapShot!)
        
        self.window?.rootViewController = self.landingNavigationController
        UIView.transitionWithView(self.window!, duration: NSTimeInterval(1), options: UIViewAnimationOptions.CurveLinear, animations: { self.window?.rootViewController = self.landingNavigationController}, completion: nil)
        UIView.animateWithDuration(NSTimeInterval(1), animations: {snapShot?.layer.opacity = 0; snapShot?.layer.transform =  CATransform3DMakeScale(1.5, 1.5, 1.5)})
    }


}

