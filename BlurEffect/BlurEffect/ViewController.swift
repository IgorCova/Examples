//
//  ViewController.swift
//  BlurEffect
//
//  Created by Andrew Dzhur on 26/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var blurButton: NSButton!
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.imageView.wantsLayer = true
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func blurAction(sender: AnyObject) {
        let blurryView = NSVisualEffectView(frame: self.view.frame)
        blurryView.blendingMode = NSVisualEffectBlendingMode.WithinWindow
        blurryView.material = NSVisualEffectMaterial.Dark
        blurryView.state = NSVisualEffectState.Active
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            self.view.animator().addSubview(blurryView)
            }) {
                blurryView.animator().removeFromSuperview()

        }
    }
}

