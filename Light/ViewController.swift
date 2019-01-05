//
//  ViewController.swift
//  Light
//
//  Created by Alexander on 1/4/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    var isLightOn = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        isLightOn = !isLightOn
        updateUI()
    }
    
    func updateUI() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        } else {
            view.backgroundColor = isLightOn ? .white : .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // swith off status-bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
