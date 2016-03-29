//
//  LoadViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 28/11/15.
//  Copyright © 2015 AndrewDzhur. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class LoadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, RSKImageCropViewControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func btnClicked(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            print("\nButton capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadImageFromData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadImageFromData(){
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
        
        do {
            let fetchResult = try context.executeFetchRequest(fetchRequest) as! [StoreImages]
            
            if fetchResult.isEmpty {
                
            } else {
                imageView.image  = UIImage(data: fetchResult[fetchResult.count - 1].image!)
            }
            
        } catch let error as NSError {
        print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            var imageCropVC : RSKImageCropViewController!
            imageCropVC = RSKImageCropViewController(image: image, cropMode: RSKImageCropMode.Circle)
            imageCropVC.rotationEnabled = true
            imageCropVC.delegate = self
            
            self.navigationController?.pushViewController(imageCropVC, animated: true)
        })
    }
    
    func imageCropViewController(controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect) {
        saveImageToData(croppedImage)
        croppedImage
        self.imageView.image = croppedImage
        self.navigationController?.popToViewController(self, animated: true)
    }
    
    func imageCropViewController(controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect, rotationAngle: CGFloat) {
        saveImageToData(croppedImage)
        self.imageView.image = croppedImage
        self.navigationController?.popToViewController(self, animated: true)
    }
    
    func imageCropViewControllerDidCancelCrop(controller: RSKImageCropViewController) {
        self.navigationController?.popToViewController(self, animated: true)
    }
    
    func saveImageToData (image: UIImage) {
        print("Saving")
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let newImage = NSEntityDescription.insertNewObjectForEntityForName("StoreImages", inManagedObjectContext: context) as! StoreImages
        
        newImage.image = UIImagePNGRepresentation(image) /*UIImagePNGRepresentation(imageWithSize(image, size: CGSizeMake(320, 320)))*/
        newImage.compressedImage = UIImagePNGRepresentation(imageWithSize(image, size: CGSizeMake(75, 75)))
        
        do {
            try context.save()
        } catch {
            
        }
        print(image)
    }
    
    func imageWithSize(image: UIImage,size: CGSize)->UIImage{
        if UIScreen.mainScreen().respondsToSelector("scale"){
            UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.mainScreen().scale);
        }
        else
        {
            UIGraphicsBeginImageContext(size);
        }
        
        image.drawInRect(CGRectMake(0, 0, size.width, size.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
     func resizeImageWithAspect(image: UIImage,scaledToMaxWidth width:CGFloat,maxHeight height :CGFloat)->UIImage
    {
        
        
        //let scaleFactor =  width / height;
        
        
        let newSize = CGSizeMake(width, height);
        
        return imageWithSize(image, size: newSize);
    }
}