//
//  Project.swift
//  CommHub
//
//  Created by Andrew Dzhur on 10/07/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import Foundation
import Cocoa

class Project: NSObject {
    var id: Int
    var name: String
    var commIDs = [Int]()
    
    init(id: Int, name: String, commIDs: [Int]) {
        self.id = id
        self.name = name
        self.commIDs = commIDs
    }
    
    init(name: String, commIDs: [Int]) {
        self.id = -1
        self.name = name
        self.commIDs = commIDs
    }
}
