//
//  PagedScrollViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 1/3/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit
import CoreData
//import RSKImageCropper

class PagedScrollViewController: UIViewController, UIScrollViewDelegate {
    
    //var infoView: RSKImageCropper!
    
    @IBOutlet weak var scrollView: UIScrollView!
    //@IBOutlet weak var pageControl: UIPageControl!
    
    var pageImages: [(image: UIImage, number: Int)] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupInfoView()
        
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.delegate = self
        
        pageImages = Images()
        
        let pageCount = pageImages.count
        
        //pageControl.currentPage = 0
        //pageControl.numberOfPages = pageCount
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }

        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 320)
        
        for i in 0..<pageCount {
            //let variableImage = self.alignmentImage(pageImages[i])
            let variable = UIImageView(frame: CGRectMake(pagesScrollViewSize.width * CGFloat(i), 0, 320, 320))
            variable.image = pageImages[i].image
            
            scrollView.addSubview(variable)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Images() -> [(image: UIImage, number: Int)]{
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
        
        var arrayImages: [(image: UIImage, number: Int)] = []
        
        do {
            let results = try context.executeFetchRequest(fetchRequest) as! [StoreImages]
            if results.isEmpty {
                self.navigationController?.popToRootViewControllerAnimated(true)
            } else {
                
                
                for i in 0..<results.count {
                    if results[i].filteredImage == nil {
                        //arrayImages.append(UIImage(data: results[i].image!)!)
                        arrayImages.insert(((UIImage(data: results[i].image!)!), i), atIndex: 0)
                    } else {
                        //arrayImages.append(UIImage(data: results[i].filteredImage!)!)
                        arrayImages.insert(((UIImage(data: results[i].filteredImage!)!), i), atIndex: 0)
                    }
                }
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
        print(arrayImages.count)
        return arrayImages
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFilters" {
            let vc = segue.destinationViewController as? FiltersViewController
            vc?.currentImage = pageImages[currentPage()].image
            vc?.numberImage = pageImages[currentPage()].number
        }
    }
    
    @IBAction func deleteImage(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
        
        do {
            let fetchResult = try context.executeFetchRequest(fetchRequest) as! [NSManagedObject]
                    print("deleting")
            if fetchResult.isEmpty {
                
            } else {
                context.deleteObject(fetchResult[pageImages[currentPage()].number])
                //context.delete(fetchResult[(currentPage())])
                //pageImages.removeAtIndex(pageImages[currentPage()].number)
                do {
                    try context.save()
                } catch {
                    let saveError = error as NSError
                    print(saveError)
                }
            }
        } catch {
            print("Бля")
        }
        viewDidLoad()
    }

    
    @IBAction func searchPage(sender: AnyObject) {
        let alert = UIAlertController(title: "Current Page", message: "\(currentPage())", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func currentPage () -> Int {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        //self.pageControl.currentPage = page
        //print(page)
        return page
    }
}

        /*
        let coord = appDelegate.persistentStoreCoordinator
        let predicate = NSPredicate(format: <#T##String#>, <#T##args: CVarArgType...##CVarArgType#>)
        fetchRequest.predicate = predicate
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coord.executeRequest(deleteRequest, withContext: context)
        } catch let error as NSError {
            debugPrint(error)
        }
        */

    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        //currentPage()
    }
/*
    func alignmentImage(image: UIImage) -> (w: CGFloat, h: CGFloat) {
        var tuple: (w: CGFloat, h: CGFloat) = (0, 0)
        let imageSize = image.size
        while imageSize.width > 320 {
            tuple.w = imageSize.width / CGFloat(2)
        }
        while imageSize.height > 413 {
            tuple.h = imageSize.height / CGFloat(2)
        }
        
        return tuple
    }
*/

