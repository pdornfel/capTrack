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
    
    func calculateHandicap(shooting score: Double, times: Double) -> Double {
        //Handicap Differential = (Adjusted Gross Score - Course Rating) X 113 ÷ Slope Rating
        let differential = (score - rating) * 113.0 / slope
        var averaged_diffs_with_current_index = ((differential * times) + index) / (times + 1)
        averaged_diffs_with_current_index *= 0.96
        let new_index = rounded(num: averaged_diffs_with_current_index)
        //Course Handicap = Index x (Slope Rating of Tee on Course / 113)
        let new_handicap = new_index * rating / 113
        return rounded(num: new_handicap)
    }
    
    private
    func rounded(num: Double) -> Double {
        return (num * 100).rounded() / 100
    }
}
