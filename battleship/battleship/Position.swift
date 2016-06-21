//
//  Position.swift
//  battleship
//
//  Created by Eric Heitmuller on 4/22/16.
//  Copyright © 2016 Eric Heitmuller. All rights reserved.
//

import Foundation

typealias Distance = Double
struct Position {
	var x: Double
	var y: Double
}

typealias Region = Position -> Bool


extension Position {
	func inRange( range: Distance) -> Bool {
		return sqrt( x * x + y * y) <= range
	}

	func minus( p: Position) -> Position {
		return Position( x: x - p.x, y: y - p.y)
	}
	
	var length: Double {
		return sqrt( x * x + y * y)
	}
	
	func circle( radius: Distance) -> Region {
		return { position in position.length <= radius }
	}
	
	func shift( region: Region, offset: Position) -> Region {
		return { position in region(position.minus(offset)) }
	}
	
	func intersection( region1: Region, _ region2: Region) -> Region {
		return { point in region1( point) && region2( point) }
	}
	func union( region1: Region, _ region2: Region) -> Region {
		return { point in region1( point) || region2( point) }
	}
	func invert( region: Region) -> Region {
		return { point in !region( point) }
	}
	
	func difference( region: Region, minus: Region) -> Region {
		return intersection( region, invert( minus))
	}
	
	
	
}

struct Ship {
	var position: Position
	var firingRange: Distance
	var unsafeRange: Distance
}

