//
//  ViewController.swift
//  Sound_Shaker
//
//  Created by Charlie Cuddy on 1/11/18.
//  Copyright © 2018 Charlie Cuddy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let noises = ["bottle", "camera", "click", "glass", "ice", "laughingBird", "woodPecker"]

    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            
            let randomNoise = noises[Int(arc4random_uniform(UInt32(noises.count)))]
            let audioPath = Bundle.main.path(forResource: String(randomNoise), ofType: "mp3")
            print(randomNoise)
            print("Shake shake shake, shake shake shake, shake your booty, shake your bootay!")
            
            do {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                player.play()
                
            } catch {
                
               // Process any errors
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

