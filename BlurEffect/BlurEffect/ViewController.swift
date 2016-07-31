//
//  ViewController.swift
//  BlurEffect
//
//  Created by Andrew Dzhur on 26/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        blurEffect()

    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func blurEffect() {
        let blurryView = NSVisualEffectView(frame: self.view.frame)
        blurryView.blendingMode = NSVisualEffectBlendingMode.WithinWindow
        blurryView.material = NSVisualEffectMaterial.Dark
        blurryView.state = NSVisualEffectState.Active
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 1
            self.view.animator().addSubview(blurryView)
            }) {
                blurryView.animator().removeFromSuperview()

        }
    }
}

