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
    
    var currentImage = UIImage()
    var numberImage = Int()
    let context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = currentImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFilterByName(name: String) {
        let filter = CIFilter(name: name)
        let ciImage = CIImage(image: currentImage)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        imageView.image = UIImage(CGImage: context.createCGImage((filter?.outputImage)!, fromRect: filter!.outputImage!.extent))
    }
    
    @IBAction func button1(sender: AnyObject) {
        imageView.image = currentImage
    }
    
    @IBAction func button2(sender: AnyObject) {
        setFilterByName("CIPhotoEffectProcess")
    }
    
    @IBAction func button3(sender: AnyObject) {
        setFilterByName("CIPhotoEffectTonal")
    }
    
    @IBAction func button4(sender: AnyObject) {
        setFilterByName("CIPhotoEffectInstant")
    }
    
    @IBAction func button5(sender: AnyObject) {
        setFilterByName("CIColorInvert")
    }
    
    @IBAction func saveFilteredImage(sender: AnyObject) {
        print("Saving")
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
                
        do {
            let results = try context.executeFetchRequest(fetchRequest) as! [StoreImages]
            results[numberImage].filteredImage = UIImagePNGRepresentation(imageView.image!)
            //Переместить как новую запись
            
            
    //*****************************************//
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
        
        do {
            try context.save()
        } catch {
                
        }
        navigationController?.popToRootViewControllerAnimated(true)
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
