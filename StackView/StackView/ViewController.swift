//
//  ViewController.swift
//  StackView
//
//  Created by Jin-Mac on 02.10.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit
import Foundation

@available (iOS 9,*)
class ViewController: UIViewController {

    @IBOutlet weak var horzStack: UIStackView!
    @IBOutlet weak var vertStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let colorsArray = [
         UIColor(red: 20/255.0, green: 180/255.0, blue: 30/255.0, alpha: 1.0)
        ,UIColor(red: 30/255.0, green: 160/255.0, blue: 60/255.0, alpha: 1.0)
        ,UIColor(red: 40/255.0, green: 140/255.0, blue: 90/255.0, alpha: 1.0)
        ,UIColor(red: 50/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0)
        ,UIColor(red: 60/255.0, green: 110/255.0, blue: 150/255.0, alpha: 1.0)
        ,UIColor(red: 70/255.0, green: 100/255.0, blue: 180/255.0, alpha: 1.0)
    ]
    
    let urls = [
         "http://static.giantbomb.com/uploads/original/0/4530/381723-genie.gif"
        ,"http://4.bp.blogspot.com/_JG1Lv6L4-G0/TO9zU-prObI/AAAAAAAAAL8/She-MGoaSa4/s1600/genie.png"
        ,"http://1.bp.blogspot.com/-ULDHuyzXNwc/T7HAaxIoQLI/AAAAAAAAAFw/nGCSZKh-ICY/s1600/disney-clipart-aladdin-geni3.gif"
        ,"http://img4.wikia.nocookie.net/__cb20130126005148/poohadventures/images/8/8c/Genie.png"
    
    ]
    
    func randomColor() -> UIColor {
        let arrayCount = UInt32(colorsArray.count)
        let randomNum = arc4random_uniform(arrayCount)
        let number = Int(randomNum)
        
        return colorsArray[number]
    }
    
    func randomUrl() -> String {
        let arrayCount = UInt32(urls.count)
        let randomNum = arc4random_uniform(arrayCount)
        let number = Int(randomNum)
        
        return urls[number]
    }

    @IBAction func removeImage(sender: AnyObject) {
        let myImage = self.horzStack.arrangedSubviews.last as UIView?
        
        guard let image = myImage else {
            print("Xomming")
            return
        }
        
        self.horzStack.removeArrangedSubview(image)
        image.removeFromSuperview()
        UIView.animateWithDuration(0.25) { () -> Void in
            self.horzStack.layoutIfNeeded()
        }
    }
    
    @IBAction func hideButtonWhoseTouch(sender: UIButton) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            sender.alpha = 0
        }) { (completed: Bool) -> Void in
            sender.hidden = true
        }
    }
    
    @IBAction func addNewButton(sender: UIButton) {
        let button = UIButton(type: UIButtonType.System)
        button.setTitle("New", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.backgroundColor = randomColor()
        button.titleLabel?.font = UIFont.systemFontOfSize(40.0, weight: UIFontWeightLight)
        button.hidden = true
        button.addTarget(self, action: Selector("hideButtonWhoseTouch:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.vertStack.insertArrangedSubview(button, atIndex: 1)
        
        UIView.animateWithDuration(0.5) { () -> Void in
            button.hidden = false
        }
        
    }

    @IBAction func addImage(sender: AnyObject) {
        let myImage = UIImageView()
        myImage.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.horzStack.addArrangedSubview(myImage)
        
        UIView.animateWithDuration(0.25) { () -> Void in
            self.horzStack.layoutIfNeeded()
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            let str = self.randomUrl()
            let url = NSURL(string: str)!
            do {
                let data = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingUncached)
                let someImage = UIImage(data: data)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    myImage.image = someImage
                })
            } catch {
                print("Try")
            }
            
        }
    }
}

