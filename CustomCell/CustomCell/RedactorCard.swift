//
//  RedactorCard.swift
//  CustomCell
//
//  Created by Jin-Mac on 01.10.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit

class RedactorCard: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCommunity: UILabel!
    @IBOutlet weak var imageRedactor: UIImageView!
    
    var nameString: String?
    var communityName: String?
    var imageRedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = nameString
        lblCommunity.text = communityName
        imageRedactor.image = UIImage(named: imageRedName!)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
