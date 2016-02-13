//
//  FiltersViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 31/01/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit
import CoreData

class FiltersViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    let PagedScrollVC = PagedScrollViewController()
    var currentPage = Int()
    var currentImage = UIImage()
    
    let context = CIContext(options: nil)
    var extent: CGRect!
    var scaleFactor: CGFloat!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = currentImage
        
        //imageView.image = (PagedScrollVC.Images())[(PagedScrollVC.currentPage())].valueForKey("image") as? UIImage
        //filter?.setDefaults()
        //imageView.image = UIImage(CIImage: ciImage!)
        //panGesture.addTarget(self, action: "panned")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1(sender: AnyObject) {
        let filter1 = CIFilter(name: "CIBoxBlur")
        let ciImage = CIImage(image: currentImage)
        scaleFactor = UIScreen.mainScreen().scale
        extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        filter1?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter1?.outputImage)!, fromRect: imageView.frame))
    }
    
    @IBAction func button2(sender: AnyObject) {
        let filter2 = CIFilter(name: "CIPhotoEffectProcess")
        let ciImage = CIImage(image: currentImage)
        scaleFactor = UIScreen.mainScreen().scale
        extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        filter2?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter2?.outputImage)!, fromRect: imageView.frame))
    }
    
    @IBAction func button3(sender: AnyObject) {
        let filter3 = CIFilter(name: "CIPhotoEffectTonal")
        let ciImage = CIImage(image: currentImage)
        scaleFactor = UIScreen.mainScreen().scale
        extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        filter3?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter3?.outputImage)!, fromRect: imageView.frame))
    }
    
    @IBAction func button4(sender: AnyObject) {
        let filter4 = CIFilter(name: "CIPhotoEffectInstant")
        let ciImage = CIImage(image: currentImage)
        //scaleFactor = UIScreen.mainScreen().scale
        //extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        filter4?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter4?.outputImage)!, fromRect: imageView.frame))
    }
    
    @IBAction func button5(sender: AnyObject) {
        let filter5 = CIFilter(name: "CIColorInvert")
        let ciImage = CIImage(image: currentImage)
        scaleFactor = UIScreen.mainScreen().scale
        extent = CGRectApplyAffineTransform(UIScreen.mainScreen().bounds, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        filter5?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter5?.outputImage)!, fromRect: imageView.frame))
    }
    
/*
    switch Filters {
        case .Negativ:
            return CIFilter(name: "CIColorInvert")
        case .Film:
            CIFilter(name: "CIColorInvert")
    }
*/
/*
    func panned(gesture: UIGestureRecognizer) {
        let location = gesture.locationInView(imageView)
        let x = location.x * scaleFactor
        let y = imageView.bounds.height * scaleFactor - location.y * scaleFactor
        
        filter?.setValue(CIVector(x: x, y: y), forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter?.outputImage)!, fromRect: extent))
    }
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
