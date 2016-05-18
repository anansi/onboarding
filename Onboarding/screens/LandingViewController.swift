//
//  LandingViewController.swift
//  Onboarding
//
//  Created by Julian Hulme on 2016/05/18.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //this screen does not show a navigation bar. it is a pleasent, clear first screen the user sees (and when the user returns to it)
        self.navigationController!.navigationBarHidden = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func LoginButtonTapped(sender: AnyObject) {
        
        //add the navigation bar for the screen, since we now going into a new screen
        self.navigationController!.navigationBarHidden = false
        
        let loginViewController = LoginViewController(nibName:"LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        //add the navigation bar for the screen, since we now going into a new screen
        self.navigationController!.navigationBarHidden = false
        
        let regViewController = RegistrationViewController(nibName:"RegistrationViewController", bundle: nil)
        self.navigationController?.pushViewController(regViewController, animated: true)
    }

}
