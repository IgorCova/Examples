//
//  FirstViewController.swift
//  Views
//
//  Created by Andrew Dzhur on 08/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.blueColor().CGColor
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SecondViewController.dismisSelf), name:"dismisSecondViewController", object: nil)
        
        
    }
    
    func dismisSelf(notification: NSNotification) {
        self.presentingViewController?.dismissViewController(self)
    }

}
