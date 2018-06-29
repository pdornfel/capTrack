//
//  Handicap+CoreDataProperties.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/28/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//
//

import Foundation
import CoreData


extension Handicap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Handicap> {
        return NSFetchRequest<Handicap>(entityName: "Handicap")
    }
    
    @nonobjc public class func singleHandicapRequest() -> NSFetchRequest<Handicap> {
        let request = NSFetchRequest<Handicap>(entityName: "Handicap")
        request.fetchLimit = 1
        return request
    }

    @NSManaged public var slope: Double
    @NSManaged public var index: Double
    @NSManaged public var multiplier: Double
    @NSManaged public var score: Double
    @NSManaged public var rating: Double

}
