//
//  ViewController.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/14/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var needToShoot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any, forEvent event: UIEvent) {
        print("foo")
    }
    
    // views
    func configureView() {
        print("loaded")
    }
    
    
}

