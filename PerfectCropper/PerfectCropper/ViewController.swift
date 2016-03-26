//
//  ViewController.swift
//  PerfectCropper
//
//  Created by Andrew Dzhur on 26/03/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit
import TOCropViewController

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, TOCropViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goCropping(sender: AnyObject) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
}

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            let cropViewController = TOCropViewController(image: image)
            cropViewController.delegate = self
            
            self.presentViewController(cropViewController, animated: true, completion: nil)
        })
        
        
    }

    func cropViewController(cropViewController: TOCropViewController!, didFinishCancelled cancelled: Bool) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cropViewController(cropViewController: TOCropViewController!, didCropToImage image: UIImage!, withRect cropRect: CGRect, angle: Int) {
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}

