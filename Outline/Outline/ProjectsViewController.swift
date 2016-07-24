//
//  ProjectsViewController.swift
//  CommHub
//
//  Created by Andrew Dzhur on 10/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Cocoa

class ProjectsViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {

    @IBOutlet var outlineView: NSOutlineView!
    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.projects.append(Project(id: 1, name: "Mood", commIDs: [1,2,3,4]))
        self.projects.append(Project(id: 2, name: "World Class", commIDs: [5,6,7,8]))
        self.projects.append(Project(id: 3, name: "Car", commIDs: [98,1001,32]))
    }
    
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        //1
        if let project = item as? Project {
            return project.commIDs.count
        }
        //2
        return projects.count
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        if let project = item as? Project {
            return project.commIDs[index]
        }
        
        return projects[index]
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        if let project = item as? Project {
            return project.commIDs.count > 0
        }
        
        return false

    }
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        var view: NSTableCellView?
        //MainColumn
        
        if let project = item as? Project {
            
            view = outlineView.makeViewWithIdentifier("ProjectCell", owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = project.name
                textField.sizeToFit()
            }
            
        } else if let comm = item as? Int {
            view = outlineView.makeViewWithIdentifier("CommunityCell", owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = "\(comm)"
                textField.sizeToFit()
            }
            
        }
        //More code here
        return view
    }

}