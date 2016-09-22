//
//  ViewController.swift
//  Music Player Project
//
//  Created by Frauke Kling on 19.09.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import UIKit
import MediaPlayer


//let m_player = MPMusicPlayerController.systemMusicPlayer()
//var mediaItems = MPMediaQuery.songs().items
//var query = MPMediaQuery.songs()
//var m_play = false
//
//var m_happyList = Set<MPMediaEntityPersistentID>()
//var m_calmList = Set<MPMediaEntityPersistentID>()
//var m_gloomyList = Set<MPMediaEntityPersistentID>()
//var m_sadList = Set<MPMediaEntityPersistentID>()



class ViewController: UIViewController {

    @IBOutlet weak var m_nextButton: UIButton!
    @IBOutlet weak var m_playButton: UIButton!
   
    @IBOutlet weak var m_SongTitel: UILabel!
    @IBOutlet weak var m_artist: UILabel!
    @IBOutlet weak var m_album: UILabel!
    
    @IBOutlet weak var m_AlbumCover: UIImageView!
    
    @IBOutlet weak var m_happy: UIButton!
    @IBOutlet weak var m_calm: UIButton!
    @IBOutlet weak var m_gloomy: UIButton!
    @IBOutlet weak var m_sad: UIButton!
    
//    let m_player = MPMusicPlayerController.systemMusicPlayer()
    var mediaItems = MPMediaQuery.songs().items
    var query = MPMediaQuery.songs()
    var m_play = false

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mediaCollection = MPMediaItemCollection(items: mediaItems!)
        playerData.m_player.setQueue(with: mediaCollection)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistsegue"{
            let destinationVC:UIViewController = segue.destination as! UIViewController

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextSong(_ sender: AnyObject) {
        playerData.m_player.skipToNextItem()
        updateLabels()
    }

    @IBAction func playMusic(_ sender: AnyObject) {

        if(m_play == false)
        {
            playerData.m_player.play()
            updateLabels()
            m_play = true
            
        }else
        {
            playerData.m_player.pause()
            m_play = false
        }
        
    }
    
    @IBAction func addToHappy(_ sender: AnyObject) {
        
        playerData.m_happyList.insert((playerData.m_player.nowPlayingItem?.persistentID)!)
        NSLog("happyList: %@", playerData.m_happyList)
        
    }
    
    @IBAction func addToCalm(_ sender: AnyObject) {
        
        playerData.m_calmList.insert((playerData.m_player.nowPlayingItem?.persistentID)!)
        
        NSLog("calmyList: %@", playerData.m_calmList)
    }
    
    
    @IBAction func addToGloomy(_ sender: AnyObject) {
        
        playerData.m_gloomyList.insert((playerData.m_player.nowPlayingItem?.persistentID)!)
        
        NSLog("gloomyList: %@", playerData.m_gloomyList)
    }
    
    @IBAction func AddToSad(_ sender: AnyObject) {
        
        playerData.m_sadList.insert((playerData.m_player.nowPlayingItem?.persistentID)!)
        
        NSLog("sadList: %@", playerData.m_sadList)
    }
    
  
    func updateLabels() {
        
        m_SongTitel.text = playerData.m_player.nowPlayingItem?.title
        m_artist.text = playerData.m_player.nowPlayingItem?.artist
        m_album.text = playerData.m_player.nowPlayingItem?.albumTitle
        m_AlbumCover.image = playerData.m_player.nowPlayingItem?.artwork?.image(at: CGSize(width: 300, height: 300))
    }
    
    
}





