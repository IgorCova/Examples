//
//  FiltersViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 31/01/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    let filter = CIFilter(name: "CIColorInvert")
    let context = CIContext(options: nil)
    var extent: CGRect!
    var scaleFactor: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scaleFactor = UIScreen.mainScreen().scale
        extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))

        let ciImage = CIImage(image: UIImage(named: "ffd.png")!)
        filter?.setDefaults()
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        imageView.image = UIImage(CGImage: context.createCGImage((filter?.outputImage)!, fromRect: extent))
        //imageView.image = UIImage(CIImage: ciImage!)
        panGesture.addTarget(self, action: "panned")
    }
    
    func panned(gesture: UIGestureRecognizer) {
        let location = gesture.locationInView(imageView)
        let x = location.x * scaleFactor
        let y = imageView.bounds.height * scaleFactor - location.y * scaleFactor
        
        filter?.setValue(CIVector(x: x, y: y), forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter?.outputImage)!, fromRect: extent))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
