//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Frauke Kling on 10.08.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties

    @IBOutlet weak var playMusic: UIButton!
    
    @IBOutlet weak var pauseMusic: UIButton!
    
    
    @IBOutlet weak var trackTitle: UILabel!
    
    
    @IBOutlet weak var playedTime: UILabel!
    
    @IBOutlet weak var playMusicMP: UIButton!
    
    @IBOutlet weak var pauseMusicMP: UIButton!
    
    var player = AVAudioPlayer()
    var isPlaying = false
    var timer:NSTimer!
    let mediaItems = MPMediaQuery.songsQuery().items
    var query = MPMediaQuery.songsQuery()
  

    
    
    
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
    
    @IBAction func playMusicMP(sender: UIButton) {
          let mediaCollection = MPMediaItemCollection(items: mediaItems!)
          let player = MPMusicPlayerController.systemMusicPlayer()
          player.setQueueWithItemCollection(mediaCollection)
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
 
    @IBAction func pauseMusicMP(sender: AnyObject) {
    }
  
    // MARK: Actions


}

