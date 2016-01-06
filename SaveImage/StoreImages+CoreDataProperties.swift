//
//  StoreImages+CoreDataProperties.swift
//  SaveImage
//
//  Created by Igor Cova on 12/12/15.
//  Copyright © 2015 AndrewDzhur. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension StoreImages {

    @NSManaged var image: NSData?
    @NSManaged var compressedImage: NSData?
}
