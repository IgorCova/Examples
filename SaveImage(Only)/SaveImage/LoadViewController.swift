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

    @IBOutlet var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
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
        //saveFalseImage()
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
            imageView.image  = UIImage(data: results[0].image!)
    
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        /*
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "StoreImages")
        request.returnsObjectsAsFaults = false
        //request.predicate = NSPredicate(format: <#T##String#>, <#T##args: CVarArgType...##CVarArgType#>)
        
        do {
            print("Пошлоооо")
            let result: NSArray = try context.executeFetchRequest(request) as! [StoreImages]
        
            if result.count > 0 {
                imageView.image = (result[1] as! NSManagedObject).valueForKey("image") as? UIImage
            }
        } catch {
            print("Бляяяяя")
        }
        */
    }
/*
    func saveFalseImage() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let newImage = NSEntityDescription.insertNewObjectForEntityForName("StoreImages", inManagedObjectContext: context) as! StoreImages
        
        newImage.image = UIImageJPEGRepresentation(UIImage(named: "PICT0365.jpg")!, 1)
        do {
            try context.save()
        } catch {
            
        }
        
    }
*/

    
    
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