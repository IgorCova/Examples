//
//  svViewController.swift
//  ScrollableToolbar
//
//  Created by Igor Cova on 16/03/16.
//  Copyright © 2016 Igor Cova. All rights reserved.
//

import UIKit

class svViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var columns : [(String, Int)] = [("All posts", 1), ("Radio", 3), ("Funny pictures", 3), ("Classical music", 4), ("Hot line", 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        var lastButtonWidth:CGFloat = 0.0
        var columnX: CGFloat = 15.0
        for clmn in self.columns {
            let button = UIButton(type: .System) as UIButton
            button.backgroundColor = .whiteColor()
            button.frame = CGRectMake(columnX , 4, 50, 30)
            button.titleLabel?.font = UIFont(name: ".SFUIText-Regular", size: 14)
            button.setTitle(clmn.0, forState: .Normal)
            button.sizeToFit()
            button.titleLabel?.textAlignment = .Center
            
            columnX = columnX + button.frame.width + 15
            
            if clmn.1 != 1 {
                button.setTitleColor(UIColor.blackColor().colorWithAlphaComponent(0.7), forState: .Normal)
            }
            
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            lastButtonWidth = button.frame.width + 15
            
            self.scrollView.addSubview(button)
        }
        self.scrollView.contentSize.width =  columnX + lastButtonWidth + CGFloat(columns.count+1) * 15.0
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(sender: UIButton) {
        
        for view in self.scrollView.subviews {
            if view.isKindOfClass(UIButton) == true {
                (view as! UIButton).setTitleColor(UIColor.blackColor().colorWithAlphaComponent(0.7), forState: .Normal)
            }
        }
        sender.setTitleColor(nil, forState: .Normal)
    }
    
    // override func viewWillLayoutSubviews()
    // {
    //     super.viewWillLayoutSubviews();
    ////    self.scrollView.contentSize.height = 3000; // Or whatever you want it to be.
    //}
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews();
        
        self.scrollView.frame = self.view.bounds; // Instead of using auto layout
        self.scrollView.contentSize.height = 25; // Or whatever you want it to be.
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
