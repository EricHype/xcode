//
//  LocationDetailsViewController.swift
//  MyLocations2
//
//  Created by Eric Heitmuller on 9/29/15.
//  Copyright © 2015 Eric Heitmuller. All rights reserved.
//

import UIKit
import CoreLocation
import Dispatch
import CoreData

private let dateFormatter: NSDateFormatter = {
	let formatter = NSDateFormatter()
	formatter.dateStyle = .MediumStyle
	formatter.timeStyle = .ShortStyle
	return formatter
}()


class LocationDetailsViewController: UITableViewController {
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
	var placemark: CLPlacemark?
	var categoryName = "No Category"
	var managedObjectContext: NSManagedObjectContext!
	var date : NSDate = NSDate()
	var locationToEdit: Location? {
		didSet {
			if let location = locationToEdit {
				descriptionText = location.locationDescription
				categoryName = location.category
				date = location.date
				coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
				placemark = location.placemark
			}
		}
	}
	
	var descriptionText = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let _ = locationToEdit {
			title = "Edit Location"
		}
		descriptionTextView.text = descriptionText
		categoryLabel.text = ""
		latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
		longitudeLabel.text = String(format: "%.8f", coordinate.longitude)
		categoryLabel.text = categoryName
		
		if let placemark = placemark {
			addressLabel.text = stringFromPlacemark(placemark)
		} else {
			addressLabel.text = "No Address Found"
		}
		dateLabel.text = formatDate(date)
		
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard:"))
		gestureRecognizer.cancelsTouchesInView = false
		tableView.addGestureRecognizer(gestureRecognizer)
	}
	
	func hideKeyboard(gestureRecognizer: UIGestureRecognizer) {
			let point = gestureRecognizer.locationInView(tableView)
			let indexPath = tableView.indexPathForRowAtPoint(point)
			if indexPath != nil && indexPath!.section == 0 && indexPath!.row == 0 {
				return
			}
			descriptionTextView.resignFirstResponder()
	}
	
	
	@IBAction func done() {
		let hudView = HudView.hudInView(navigationController!.view,animated: true)
				
		let location: Location
		if let temp = locationToEdit {
			hudView.text = "Updated"
			location = temp
		} else {
			hudView.text = "Tagged"
			location = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: managedObjectContext) as! Location
		}
		
		location.locationDescription = descriptionTextView.text
		location.category = categoryName
		location.latitude = coordinate.latitude
		location.longitude = coordinate.longitude
		location.date = date
		location.placemark = placemark
		
		do {
			try managedObjectContext.save()
		} catch {
			fatalCoreDataError(error)
		}
		
		afterDelay(0.6, closure: {
			self.dismissViewControllerAnimated(true, completion: nil)
		})
	}
	
	@IBAction func cancel() {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func stringFromPlacemark(placemark: CLPlacemark) -> String {
			var text = ""
			if let s = placemark.subThoroughfare {
				text += s + " "
			}
			if let s = placemark.thoroughfare {
				text += s + ", "
			}
			if let s = placemark.locality {
				text += s + ", "
			}
			if let s = placemark.administrativeArea {
				text += s + " "
			}
			if let s = placemark.postalCode {
				text += s + ", "
			}
			if let s = placemark.country {
				text += s
			}
			return text
	}
	
	func formatDate(date: NSDate) -> String {
			return dateFormatter.stringFromDate(date)
	}
	
	// MARK: - UITableViewDelegate
	override func tableView(tableView: UITableView,
		heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if indexPath.section == 0 && indexPath.row == 0 {
			return 88
		} else if indexPath.section == 2 && indexPath.row == 2 {
			addressLabel.frame.size = CGSize(width: view.bounds.size.width - 115, height: 10000)
			addressLabel.sizeToFit()
			addressLabel.frame.origin.x = view.bounds.size.width - addressLabel.frame.size.width - 15
			return addressLabel.frame.size.height + 20
		} else {
			return 44
		}
	}
	
	override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		if indexPath.section == 0 || indexPath.section == 1 {
			return indexPath
		} else {
			return nil
		}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
				if indexPath.section == 0 && indexPath.row == 0 {
					descriptionTextView.becomeFirstResponder()
				}
	}
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "PickCategory" {
				let controller = segue.destinationViewController as! CategoryPickerViewController
				controller.selectedCategoryName = categoryName
		}
	}
	
	@IBAction func categoryPickerDidPickCategory(segue: UIStoryboardSegue) {
		let controller = segue.sourceViewController as! CategoryPickerViewController
		categoryName = controller.selectedCategoryName
		categoryLabel.text = categoryName
	}
	
}
