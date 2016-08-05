//
//  MyCustomSwiftAnimator.swift
//  NSViewControllerPresentations
//
//  Created by jonathan on 25/01/2015.
//  Copyright (c) 2015 net.ellipsis. All rights reserved.
//
//  based on:
//  http://stackoverflow.com/questions/26715636/animate-custom-presentation-of-viewcontroller-in-os-x-yosemite

import Cocoa

class MyCustomSwiftAnimator: NSObject, NSViewControllerPresentationAnimator {
    
    @objc func  animatePresentationOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        let bottomVC = fromViewController
        let topVC = viewController
        
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay
        topVC.view.alphaValue = 0
        topVC.view.translatesAutoresizingMaskIntoConstraints = false

        
        bottomVC.view.addSubview(topVC.view)
        
        let leftConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: bottomVC.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(leftConstraint)
        
        let rightConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: bottomVC.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(rightConstraint)
        
        let topConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: bottomVC.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(topConstraint)
        
        let bottomConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: bottomVC.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(bottomConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: topVC.view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 0)
        bottomVC.view.addConstraint(heightConstraint)
        
        
        
        
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 1
            
            }, completionHandler: nil)
        
    }
    
    
    @objc func  animateDismissalOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        _ = fromViewController
        let topVC = viewController
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay
        
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 0
            }, completionHandler: {
                topVC.view.removeFromSuperview()
        })
    }
    
}
