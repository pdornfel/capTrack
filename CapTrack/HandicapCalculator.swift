//
//  HandicapCalculator.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/18/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import Foundation

protocol Calculator {
    init(slope: Double, rating: Double, index: Double)
}

class HandicapCalculator : Calculator {
    
    let slope: Double
    let rating: Double
    let index: Double
    let currentHandicap: Int
    
    required init(slope: Double, rating: Double, index: Double) {
        self.slope = slope
        self.rating = rating
        self.index = index
        
        self.currentHandicap = Int((self.index * self.slope) / 113)
    }
    
    
    
    func calculateHandicap(shooting score: Int, times: Int) -> Double {
        var temp_index: Double
        var course_handicap: Double
        
        temp_index = ((Double(score) - rating) * 113.0 / slope)
        temp_index = ((temp_index * Double(times)) + self.index) / Double(times)
        
        course_handicap = ((temp_index * slope) / 113)
        
        return rounded(num: course_handicap)
    }
    
    private
    func rounded(num: Double) -> Double {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        return round(num * multiplier) / multiplier
    }
}
