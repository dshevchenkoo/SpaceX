//
//  ViewController.swift
//  SpaceX
//
//  Created by dshevchenkoo on 27.08.20.
//  Copyright © 2020 dshevchenkoo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var rocketContentView: UIView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var cloudsImageView: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPowerPressed(_ sender: Any) {
        self.resetButton.isHidden = true
        self.rocketContentView.isHidden = false
        
        player.play()
        
        let frame = self.rocketImageView.frame
        self.rocketImageView.frame.origin.y = 600

        UIView.animate(withDuration: 2.5) {
            self.rocketImageView.frame = frame
            self.resetButton.isHidden = false
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        self.rocketContentView.isHidden = true
    }
    
}

