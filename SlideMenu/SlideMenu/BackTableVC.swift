//
//  BackTableVC.swift
//  SlideOut
//
//  Created by Igor Cova on 07/12/15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    var TableArray = [String]()
    
    override func viewDidLoad() {
        self.TableArray = ["Hello", "World", "Second"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "") {
            let destVC = segue.destinationViewController as? ViewController
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            destVC!.varView = indexPath.row
        }
    }*/
}