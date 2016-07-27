//
//  ViewController.swift
//  BlurEffect
//
//  Created by Andrew Dzhur on 26/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa
import AppKit
import Foundation
import CoreGraphics
import CoreImage


class ViewController: NSViewController {

    @IBOutlet var blurButton: NSButton!
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.imageView.wantsLayer = true

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func blurAction(sender: AnyObject) {
//        let blurEffect = 
//        let blurView = NSVisualEffectView(coder: NSCoder )
//        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let blurryView = NSVisualEffectView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
        blurryView.blendingMode = NSVisualEffectBlendingMode.WithinWindow
        blurryView.material = NSVisualEffectMaterial.Dark
        blurryView.state = NSVisualEffectState.Active

        self.view.addSubview(blurryView)
        
//        self.view.addSubview(blurryView, positioned: .Above, relativeTo: blurButton.layer)

        

    }
    @IBAction func cancelAction(sender: AnyObject) {
//        self.blurButton.removeFromSuperview()
        self.view.subviews.removeLast()
    }
}

