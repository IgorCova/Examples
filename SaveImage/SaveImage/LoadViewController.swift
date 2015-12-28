//
//  LoadViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 28/11/15.
//  Copyright © 2015 AndrewDzhur. All rights reserved.
//

import UIKit
import CoreData

class LoadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func btnClicked(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            print("\nButton capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadImage(){
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
        
        //3
        do {
            let results = try context.executeFetchRequest(fetchRequest) as! [StoreImages]
            if results.count > 0 {
            imageView.image  = UIImage(data: results[results.count - 1].image!)
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        imageView.image = image
        
        print("Saving")
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let newImage = NSEntityDescription.insertNewObjectForEntityForName("StoreImages", inManagedObjectContext: context) as! StoreImages
        
        newImage.image = UIImageJPEGRepresentation(image, 1)
        
        do {
            try context.save()
        } catch {
            
        }
        
        print(newImage)
        print(image)
    }
}