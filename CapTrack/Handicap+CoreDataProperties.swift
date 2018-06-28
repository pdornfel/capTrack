//
//  Handicap+CoreDataProperties.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/27/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//
//

import Foundation
import CoreData


extension Handicap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Handicap> {
        return NSFetchRequest<Handicap>(entityName: "Handicap")
    }

    @NSManaged public var score: Double
    @NSManaged public var slope: Double
    @NSManaged public var rating: Double
    @NSManaged public var index: Double
    @NSManaged public var multiplier: Double

}
