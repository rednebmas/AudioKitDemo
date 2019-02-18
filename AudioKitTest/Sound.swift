//
//  Sound.swift
//  TrainCentric
//
//  Created by Sam Bender on 8/19/18.
//  Copyright © 2018 Sam Bender. All rights reserved.
//

import Foundation
import AudioKit

class MySound: NSObject {
    private static var mixer: AKMixer = AKMixer()
    
    private var url: String
    private var player: AKPlayer?

    init(url: String) {
        self.url = url
        
        super.init()

        if let file = try? AKAudioFile(readFileName: url) {
            self.player = AKPlayer(audioFile: file)
            self.player?.buffering = .always
            MySound.mixer.connect(input: self.player)
        }
    }

    func play() {
        if AudioKit.output !== MySound.mixer {
            AudioKit.output = MySound.mixer
        }
        
        if !AudioKit.engine.isRunning {
            do {
                try AudioKit.start()
            } catch {
                assert(false)
            }
        }

        if AudioKit.engine.isRunning {
            player?.play()
        } else {
            assert(false)
        }
    }
    
}
