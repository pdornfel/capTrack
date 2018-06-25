//
//  ViewController.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/14/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wouldBeHandicapLabel: UILabel!
    @IBOutlet weak var handicapIsLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var timesStepper: UIStepper!
    
    //Inputs
    @IBOutlet weak var indexInput: UITextField!
    @IBOutlet weak var ratingInput: UITextField!
    @IBOutlet weak var slopeInput: UITextField!
    @IBOutlet weak var scoreInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any, forEvent event: UIEvent) {
        configureView()
    }
    
    @IBAction func updateTimes(_ sender: Any) {
        timesLabel.text = "\(Int(timesStepper.value))"
        configureView()
    }
    
    // views
    func configureView() {
        if  let slope = Double(slopeInput.text!), let rating = Double(ratingInput.text!), let index = Double(indexInput.text!), let score = Double(scoreInput.text!), let times = Double(timesLabel.text!) {
            let calc = HandicapCalculator.init(slope: slope, rating: rating, index: index)
            let handicap = calc.calculateHandicap(shooting: score, times: times)
            wouldBeHandicapLabel.text = "\(handicap)"
            handicapIsLabel.text = "\(calc.currentHandicap)"
        }
    }
    
    
}

