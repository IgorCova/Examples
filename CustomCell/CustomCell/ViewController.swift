//
//  ViewController.swift
//  CustomCell
//
//  Created by Jin-Mac on 30.09.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var arrayOfRedactors: [Redactor] = [Redactor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpRedactor()
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpRedactor() {
        let redNon = Redactor(name: "Non", community: "First row", imageName: "jin.gif")
        let red1 = Redactor(name: "Igor Cova", community: "Tectonics", imageName: "jin.gif")
        let red2 = Redactor(name: "Jin Cox", community: "Major Auto", imageName: "genie.png")
        let red3 = Redactor(name: "Max Fray", community: "Tectonics", imageName: "jin.gif")
        let red4 = Redactor(name: "Pavel Durov", community: "Major Auto", imageName: "genie.png")
        let red5 = Redactor(name: "Andrew Jur", community: "Tectonics", imageName: "jin.gif")
        let red6 = Redactor(name: "Antony Bubas", community: "Major Auto", imageName: "genie.png")
        let red7 = Redactor(name: "Simple Man", community: "Tectonics", imageName: "jin.gif")
        let red8 = Redactor(name: "Tec Tonic", community: "Major Auto", imageName: "genie.png")
        let red9 = Redactor(name: "Nastya Belka", community: "Tectonics", imageName: "jin.gif")
        let red0 = Redactor(name: "Gin Dron", community: "Major Auto", imageName: "genie.png")
        
        arrayOfRedactors.append(redNon)
        arrayOfRedactors.append(red1)
        arrayOfRedactors.append(red2)
        arrayOfRedactors.append(red3)
        arrayOfRedactors.append(red4)
        arrayOfRedactors.append(red5)
        arrayOfRedactors.append(red6)
        arrayOfRedactors.append(red7)
        arrayOfRedactors.append(red8)
        arrayOfRedactors.append(red9)
        arrayOfRedactors.append(red0)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRedactors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = (tableView.dequeueReusableCellWithIdentifier("cell") as? CustomCell)!
        
        if indexPath.row == 0 {
            let top = tableView.dequeueReusableCellWithIdentifier("Top")
            top?.userInteractionEnabled = false
            return top!
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.blueColor()
        } else {
            cell.backgroundColor = UIColor.grayColor()
        }
        let redact = arrayOfRedactors[indexPath.row]
        
        cell.setCell(redact.community, rightLabelText: redact.name, imageName: redact.imageName)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrayOfRedactors.removeAtIndex(indexPath.row)
            self.myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let red = arrayOfRedactors[indexPath.row]
        
        let redactoCard: RedactorCard = self.storyboard?.instantiateViewControllerWithIdentifier("RedactorCard") as! RedactorCard
        
        redactoCard.nameString = red.name
        redactoCard.communityName = red.community
        redactoCard.imageRedName = red.imageName
        
        self.presentViewController(redactoCard, animated: true, completion: nil)
        self.myTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


}

