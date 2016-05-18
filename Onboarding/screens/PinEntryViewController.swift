//
//  PinEntryViewController.swift
//  Beame
//
//  Created by Julian Hulme on 2015/10/15.
//  Copyright © 2015 ArcadeSoftware. All rights reserved.
//

import UIKit

class PinEntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var headingField: UILabel!
    @IBOutlet var subheadingField: UILabel!
    
//    @IBOutlet var backButton: UIButton!
    @IBOutlet var pinTextField: UITextField!
    @IBOutlet var pinField2: UIView!
    @IBOutlet var pinField1: UIView!
    @IBOutlet var pinField3: UIView!
    @IBOutlet var pinField4: UIView!
    
    var backButtonEnabled:Bool?
    var heading:String?
    var subheading:String?
    
    var enteredPin:String = ""
    
    var completion: (String,PinEntryViewController) -> Void = {(str:String,pinEntryViewController:PinEntryViewController) in print("")}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        pinTextField.hidden = true
        pinTextField.delegate = self
        
        if (heading != nil)    {
            self.headingField.text = heading
        }
        if (subheading != nil)  {
            
            self.subheadingField.text = subheading
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        self.pinTextField.becomeFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        //switch on what char has been typed
        switch (range.location+string.characters.count) {
            
        case 0:

            self.setPinField(self.pinField1,on:false)
        case 1:

            self.setPinField(self.pinField1,on:true)
            self.setPinField(self.pinField2,on:false)
        case 2:
            self.setPinField(self.pinField2,on:true)
            self.setPinField(self.pinField3,on:false)
        case 3:
            self.setPinField(self.pinField3,on:true)
            self.setPinField(self.pinField4,on:false)
        case 4:
            self.setPinField(self.pinField4,on:true)
            enteredPin = pinTextField.text! + string
            print("final pin: \(enteredPin)")
            
            self.completion(enteredPin,self)
            
            return false
        default:
            print ("none")
        }
        
        return true
        
    }
    
    func reset() {
        self.enteredPin = ""
        self.pinTextField.text = ""
        setPinField(self.pinField1, on: false)
        setPinField(self.pinField2, on: false)
        setPinField(self.pinField3, on: false)
        setPinField(self.pinField4, on: false)

        
    }
    func setPinField(pinField:UIView, on:Bool=false)  {

        if (on)   {
            
            pinField.backgroundColor = UIColor.greenColor()
            pinField.layer.borderWidth = 0
        }   else    {
            pinField.backgroundColor = UIColor.whiteColor()
            pinField.layer.borderWidth = 2
        }
        
    }
}
