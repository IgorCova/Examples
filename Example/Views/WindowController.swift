//
//  WindowController.swift
//  Views
//
//  Created by Andrew Dzhur on 08/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet var firstItem: NSToolbarItem!
    @IBOutlet var secondItem: NSToolbarItem!
    
    var presentingViewController = ViewControllers.First
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        let firstViewController = storyboard?.instantiateControllerWithIdentifier("FirstViewController") as! FirstViewController
        self.contentViewController = firstViewController
        
    }
    
    @IBAction func showFirst(sender: AnyObject) {
        if presentingViewController != .First {
            if presentingViewController == .Second {
                NSNotificationCenter.defaultCenter().postNotificationName("dismisSecondViewController", object: nil)
            }
            self.presentingViewController = .First
        }
    }

    @IBAction func showSecond(sender: AnyObject) {
        if presentingViewController != .Second {
            let secondViewController = storyboard?.instantiateControllerWithIdentifier("SecondViewController") as! SecondViewController
            self.contentViewController!.presentViewController(secondViewController, animator: MyCustomSwiftAnimator())
            self.presentingViewController = .Second
        }

    }
    
    enum ViewControllers {
        case First
        case Second
    }
    
}
