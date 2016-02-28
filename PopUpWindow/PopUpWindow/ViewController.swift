//
//  ViewController.swift
//  PopUpWindow
//
//  Created by Andrew Dzhur on 28/02/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
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

    @IBAction func click(sender: AnyObject) {
        let imageView = UIImageView(image: UIImage(named: "Group.png"))
        imageView.frame = CGRect(x: 0, y: 24, width: 320, height: 40)
        view.addSubview(imageView)
        
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveLinear, animations: {
            
            imageView.center.y = 84
            }, completion: nil)
        
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveLinear, animations: {
    
            imageView.center.y = 44
            }, completion: nil)
    
    }
}

