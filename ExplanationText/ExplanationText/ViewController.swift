//
//  ViewController.swift
//  ExplanationText
//
//  Created by Andrew Dzhur on 19/03/16.
//  Copyright © 2016 AndrewDzhur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(sender: UIButton) {
        let textAlert = "Периоди́ческая систе́ма хими́ческих элеме́нтов (табли́ца Менделе́ева) — классификация химических элементов, устанавливающая зависимость различных свойств элементов от заряда атомного ядра."
        let alertController = UIAlertController(title: "Уран", message: textAlert, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        let imageView = UIImageView(frame: CGRectMake(180, 5, 40, 40))
        let uraniumImage = UIImage(named: "uranium.jpeg")
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.image = uraniumImage
        
        alertController.addAction(alertAction)
        alertController.view.addSubview(imageView)
        
        self.presentViewController(alertController, animated: true) {
            // drwaing code...
        }
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
