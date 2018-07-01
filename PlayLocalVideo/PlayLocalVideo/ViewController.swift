//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by JamieMaple on 2018/7/1.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    // MARK: playing video button
    @IBOutlet weak var playButton: UIButton!
    var videoPath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
    let playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playingVideo(_ sender: UIButton) {
        guard let path = videoPath else {
            print("video path is not exist!")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        
        self.present(playerController, animated: true, completion: {
            self.playerController.player?.play()
        })
    }
    
}

