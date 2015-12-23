//
//  LocationCell.swift
//  MyLocations2
//
//  Created by Eric Heitmuller on 10/9/15.
//  Copyright © 2015 Eric Heitmuller. All rights reserved.
//

import UIKit

class LocationCell : UITableViewCell{
	
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	
	func configureForLocation(location: Location) {
		if location.locationDescription.isEmpty {
			descriptionLabel.text = "(No Description)"
		} else {
			descriptionLabel.text = location.locationDescription
		}
		
		if let placemark = location.placemark {
			var text = ""
			if let s = placemark.subThoroughfare {
				text += s + " "
			}
			if let s = placemark.thoroughfare {
				text += s + ", "
			}
			if let s = placemark.locality {
				text += s
			}
			addressLabel.text = text
		} else {
			addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
		}
	}
}
