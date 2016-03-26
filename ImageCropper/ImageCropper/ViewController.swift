//
//  ViewController.swift
//  ImageCropper
//
//  Created by Andrew Dzhur on 26/03/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit
import ALCameraViewController

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goCropping(sender: AnyObject) {
        let libraryViewController = ALCameraViewController.imagePickerViewController(true) { (image) -> Void in
            self.imageView.image = image
            self.dismissViewControllerAnimated(true, completion: nil)
        }

        presentViewController(libraryViewController, animated: true, completion: nil)
    }

}

