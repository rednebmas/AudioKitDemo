//
//  ViewController.swift
//  AudioKitTest
//
//  Created by Sam Bender on 2/17/19.
//  Copyright © 2019 Sam Bender. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {
    
    public let tickSound = MySound(url: "tick.wav")

    override func viewDidLoad() {
        super.viewDidLoad()
        AKSettings.playbackWhileMuted = true
    }

    @IBAction func stopAudioKit(_ sender: Any) {
        try! AudioKit.stop()
        print("AudioKit stopped")
    }
    
    @IBAction func playSound(_ sender: Any) {
        tickSound.play()
    }
    
}

