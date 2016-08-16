//
//  ViewController.swift
//  SoundButton
//
//  Created by Frauke Kling on 16.08.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer


class ViewController: UIViewController {
    
    
    @IBOutlet weak var playButton: UIButton!
    
    var player = AVAudioPlayer()
    var isPlaying = false
    var timer:NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSound(sender: UIButton) {
        let url:NSURL = NSBundle.mainBundle().URLForResource("chopin", withExtension: "mp3")!
        
        do
        {
            player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
        }
        catch let error as NSError { print(error.description) }
        
        
        player.prepareToPlay()
        player.play()
    }


}

