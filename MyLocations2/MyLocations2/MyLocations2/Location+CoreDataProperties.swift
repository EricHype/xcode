//
//  Location+CoreDataProperties.swift
//  MyLocations2
//
//  Created by Eric Heitmuller on 9/30/15.
//  Copyright © 2015 Eric Heitmuller. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var date: NSDate
    @NSManaged var locationDescription: String
    @NSManaged var category: String
    @NSManaged var placemark: CLPlacemark?

}
