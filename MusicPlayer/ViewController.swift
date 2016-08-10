//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Frauke Kling on 10.08.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties

    @IBOutlet weak var playMusic: UIButton!
    
    @IBOutlet weak var pauseMusic: UIButton!
    
    
    @IBOutlet weak var trackTitle: UILabel!
    
    
    @IBOutlet weak var playedTime: UILabel!
    
    var player = AVAudioPlayer()
    var isPlaying = false
    var timer:NSTimer!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
    
   
    @IBAction func playMusic(sender: UIButton) {
        let url:NSURL = NSBundle.mainBundle().URLForResource("chopin", withExtension: "mp3")!
        
        do
        {
            player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
        }
        catch let error as NSError { print(error.description) }
        
        
        player.prepareToPlay()
        player.play()
    }
    
    func updateTime() {
        var currentTime = Int(player.currentTime)
        var minutes = currentTime/60
        var seconds = currentTime - minutes * 60
        
        playedTime.text = NSString(format: "%02d:%02d", minutes,seconds) as String
    }
    

    @IBAction func pauseMusic(sender: UIButton) {
        player.stop()
        player.currentTime = 0
        isPlaying = false
    }
 
  
    // MARK: Actions


}

