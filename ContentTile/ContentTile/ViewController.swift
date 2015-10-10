//
//  ViewController.swift
//  ContentTile
//
//  Created by Jin-Mac on 11.10.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let array = ["Firts","Second","Thirt", "Fourth", "Firts","Second","Thirt", "Fourth","Firts","Second","Thirt", "Fourth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.separatorStyle = .None        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TableViewCell = (tableView.dequeueReusableCellWithIdentifier("cell") as? TableViewCell)!
        
        
        return cell
    }

}

