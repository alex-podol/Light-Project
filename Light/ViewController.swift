//
//  ViewController.swift
//  Light
//
//  Created by Alexander on 1/4/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn = !lightOn
        
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


}

