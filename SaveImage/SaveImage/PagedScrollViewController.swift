//
//  PagedScrollViewController.swift
//  SaveImage
//
//  Created by Andrew Dzhur on 1/3/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit
import CoreData

class PagedScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    //@IBOutlet weak var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.delegate = self
        
        pageImages = Images()
        
        let pageCount = pageImages.count
        
        //pageControl.currentPage = 0
        //pageControl.numberOfPages = pageCount
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        for i in 0..<pageCount {
            //let variableImage = self.alignmentImage(pageImages[i])
            let variable = UIImageView(frame: CGRectMake(pagesScrollViewSize.width * CGFloat(i), 0, pagesScrollViewSize.width, pageImages[i].size.height))
            variable.image = pageImages[i]
            
            scrollView.addSubview(variable)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Images() -> [UIImage]{
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "StoreImages")
        
        var arrayImages: [UIImage] = []
        
        do {
            let results = try context.executeFetchRequest(fetchRequest) as! [StoreImages]
            if results.isEmpty {
                arrayImages.append(UIImage(named: "404.png")!)
            } else {
                for i in 0..<results.count {
                    arrayImages.append(UIImage(data: results[i].image!)!)
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
        print(arrayImages.count)
        return arrayImages
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
                context.deleteObject(fetchResult[(currentPage())])
                //context.delete(fetchResult[(currentPage())])
                pageImages.removeAtIndex((currentPage()))
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
    
    func currentPage () -> Int {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        //self.pageControl.currentPage = page
        print(page)
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

