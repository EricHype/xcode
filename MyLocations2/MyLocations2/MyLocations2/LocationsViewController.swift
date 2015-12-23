//
//  LocationsViewController.swift
//  MyLocations2
//
//  Created by Eric Heitmuller on 10/9/15.
//  Copyright © 2015 Eric Heitmuller. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController : UITableViewController {

	var managedObjectContext: NSManagedObjectContext!
	var locations = [Location]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fetchRequest = NSFetchRequest()
		let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: managedObjectContext)
		fetchRequest.entity = entity
		let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
		fetchRequest.sortDescriptors = [sortDescriptor]
		
		do { // 4
			let foundObjects = try managedObjectContext.executeFetchRequest( fetchRequest)
			// 5
			locations = foundObjects as! [Location]
		} catch {
			fatalCoreDataError(error)
		}
		
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return locations.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier( "LocationCell", forIndexPath: indexPath) as! LocationCell
		let location = locations[indexPath.row]
		
		cell.configureForLocation(location)
		return cell
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "EditLocation" {
			let navigationController = segue.destinationViewController as! UINavigationController
			let controller = navigationController.topViewController as! LocationDetailsViewController
			controller.managedObjectContext = managedObjectContext
			if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
				let location = locations[indexPath.row]
				controller.locationToEdit = location
			}
		}
	}
	
}
