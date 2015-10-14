//
//  ViewController.swift
//  CUIAContoller
//
//  Created by Andrew Dzhur on 10/14/15.
//  Copyright © 2015 Andrew Dzhur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func standartAlert(sender: UIButton) {
        let alertController = UIAlertController(title: "Default Style", message: "A standard alert.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    @IBAction func UIActionSheet(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: "Takes the appearance of the bottom bar if specified; otherwise, same as UIActionSheetStyleDefault.", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { (action) in
            print(action)
        }
        alertController.addAction(destroyAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    

    @IBAction func alertTitle(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            print(action)
        }
        alertController.addAction(cancelAction)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { (action) in
            print(action)
        }
        alertController.addAction(destroyAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    @IBAction func alertWithButtons(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        let oneAction = UIAlertAction(title: "One", style: .Default) { (_) in }
        let twoAction = UIAlertAction(title: "Two", style: .Default) { (_) in }
        let threeAction = UIAlertAction(title: "Three", style: .Default) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    @IBAction func loginForm(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        let loginAction = UIAlertAction(title: "Login", style: .Default) { (_) in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            
            //loginAction(loginTextField.text, passwordTextField.text)
        }
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Login"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(forgotPasswordAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    @IBAction func signUpForm(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Email"
            textField.keyboardType = .EmailAddress
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password Confirmation"
            textField.secureTextEntry = true
        }
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
}

