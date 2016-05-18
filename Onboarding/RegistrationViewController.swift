//
//  RegistrationViewController.swift
//  Onboarding
//
//  Created by Julian Hulme on 2016/05/18.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: Pin Entry screen
    var pinEntered:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        
        
        let pinEntryViewController = PinEntryViewController(nibName:"PinEntryViewController", bundle: nil)
        pinEntryViewController.heading = "Create your new PIN"
        pinEntryViewController.completion = {(p:String, pc:PinEntryViewController) in self.pinResponse(p,pc:pc)}
        //pinEntryViewController.heading = "Create your new PIN"
        self.navigationController?.pushViewController(pinEntryViewController, animated: true)
    }
    
    
    func pinResponse(p:String, pc:PinEntryViewController)   {
        print("hit")
        //clear the input on the existing screen
        
        pc.reset()
        
        //setup a new pin scren
        let pin = PinEntryViewController(nibName:"PinEntryViewController",bundle:nil)
        pin.completion = {(p:String, pc:PinEntryViewController) in self.confirmPinResponse(p,pc:pc)}
        pin.heading = "Verification"
        pin.subheading == "Enter your pin again for verification"
        self.navigationController?.pushViewController(pin, animated: true)
        self.pinEntered = p
    }

    
    func confirmPinResponse(p:String, pc:PinEntryViewController)   {
        
        if (pinEntered != p)   {
            //self.makeViewDropKeyboard()
            pc.pinTextField.resignFirstResponder()
            let alert = UIAlertController(title: "Your pin was not correctly validated, please try again", message:nil, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) in
                print("sign up response")
                //start pin process again
                self.navigationController?.popViewControllerAnimated(true)
                }
                ))
            self.presentViewController(alert, animated: true, completion: nil)
        }   else    {
            
//            var user = UserController.sharedInstance.currentUser()
//            user?.pin = self.pinEntered
//            UserController.sharedInstance.setCurrentUser(user!)
            
            //this is one of the bigger things to handle in this exercise. Making the navigation controller go back 2 view controllers in one go.
            
            //Although i have just realised that when setting your password (as apposed to updating it from the settings menu), you dont actually have to handle this situation. So the lesson isnt like able to be taught here
            var viewControllers: [UIViewController] = self.navigationController!.viewControllers

            viewControllers.removeAtIndex(viewControllers.count-2)
            self.navigationController?.viewControllers = viewControllers
            
            
            self.navigationController?.popViewControllerAnimated(true)
            
            let alert = UIAlertController(title: "Your PIN has been updated successsfully", message:nil, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) in
                
                
                }
                ))
            
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }

}
