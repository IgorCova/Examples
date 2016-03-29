//
//  MainViewController.swift
//  CustomKeyboard
//
//  Created by Andrew Dzhur on 29/03/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var MaintextField: UITextField!
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var keyboardIsActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.keyboardNotification(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func keyboardNotification(notification: NSNotification) {
        keyboardIsActive = true
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
            let duration:NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.unsignedLongValue ?? UIViewAnimationOptions.CurveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if endFrame?.origin.y >= UIScreen.mainScreen().bounds.size.height {
                self.bottomConstraint?.constant = 0.0
            } else {
                self.bottomConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animateWithDuration(duration,
                                       delay: NSTimeInterval(0),
                                       options: animationCurve,
                                       animations: { self.view.layoutIfNeeded() },
                                       completion: {_ in self.keyboardIsActive = false})
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if keyboardIsActive == false {
            self.view.endEditing(true)
        }
    }
    
    
}

