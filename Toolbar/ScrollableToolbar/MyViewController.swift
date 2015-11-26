//
//  ViewController.swift
//  ScrollableToolbar
//
//  Created by Andrew Dzhur on 11/25/15.
//  Copyright © 2015 Andrew Dzhur. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var flag = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.myTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if flag == "1" {
            cell.textLabel?.text = "Fresh News"
        }
        
        if flag == "2" {
            cell.textLabel?.text = "Old News"
        }
        return cell
    }

    @IBAction func firstTable(sender: AnyObject) {
        if flag == "2" {
            flag = "1"
            self.myTableView.reloadData()
        }
    }
    
    @IBAction func secondActoin(sender: AnyObject) {
        if flag == "1" {
            flag = "2"
            self.myTableView.reloadData()
        }
        
    }
    
}

