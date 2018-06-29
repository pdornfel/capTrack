//
//  ViewController.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/14/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit
import CoreData

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
    
    // CoreData
    var handicap: Handicap?
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))

        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title:"Done", style:.done, target:self, action: #selector(self.doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: true)
        toolbar.sizeToFit()
    
        slopeInput.inputAccessoryView = toolbar
        indexInput.inputAccessoryView = toolbar
        ratingInput.inputAccessoryView = toolbar
        scoreInput.inputAccessoryView = toolbar
        
        let request: NSFetchRequest<Handicap> = Handicap.singleHandicapRequest()
        do {
            handicap = try managedObjectContext.fetch(request).first
            
            if handicap == nil {
                handicap = (NSEntityDescription.insertNewObject(forEntityName: "Handicap", into: managedObjectContext) as! Handicap)
            }
            
        } catch {
            print("error")
        }
        
        if let score = handicap?.score {
            scoreInput.text = "\(score)"
        }
        
        if let index = handicap?.index {
            indexInput.text = "\(index)"
        }
        
        if let rating = handicap?.rating {
            ratingInput.text = "\(rating)"
        }
        
        if let slope = handicap?.slope {
            slopeInput.text = "\(slope)"
        }
        
        configureView()
    }
    
    @objc func doneButtonAction() {
        print("foo")
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        guard let handicap = handicap else { return }
        
        if let stringVal = indexInput.text, let DoubleVal = Double(stringVal) {
            handicap.index = DoubleVal
        }
        
        if let stringVal = slopeInput.text, let DoubleVal = Double(stringVal) {
            handicap.slope = DoubleVal
        }
        
        if let stringVal = ratingInput.text, let DoubleVal = Double(stringVal) {
            handicap.rating = DoubleVal
        }
        
        if let stringVal = scoreInput.text, let DoubleVal = Double(stringVal) {
            handicap.score = DoubleVal
        }
        
        if let stringVal = timesLabel.text, let DoubleVal = Double(stringVal) {
            handicap.multiplier = DoubleVal
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("error saving")
        }
        
        let score = handicap.score
        let slope = handicap.slope
        let rating = handicap.rating
        let index = handicap.index
        let multiplier = handicap.multiplier
        
        let calc = HandicapCalculator.init(slope: slope, rating: rating, index: index)
        let wouldBeHandicap = calc.calculateHandicap(shooting: score, multiplier: multiplier)
        wouldBeHandicapLabel.text = "\(wouldBeHandicap)"
        handicapIsLabel.text = "\(calc.currentHandicap())"
    }
    
    
}

