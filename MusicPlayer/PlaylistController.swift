//
//  PlaylistController.swift
//  MusicPlayer
//
//  Created by Frauke Kling on 19.09.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import Foundation
import MediaPlayer

class PlaylistController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var m_artistlabel: UILabel!
    @IBOutlet weak var m_songlabel: UILabel!
    @IBOutlet weak var m_albumlabel: UILabel!
    
    @IBOutlet weak var m_playButtonPL: UIButton!
    @IBOutlet weak var m_nextButtonPL: UIButton!
    
    @IBOutlet weak var m_albumCoverLabel: UIImageView!
    
    @IBOutlet weak var m_backButton: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    let pickerData = ["happy","calm","gloomy","sad"]
    
    var m_play = false
    
    @IBAction func playMusicPL(_ sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSongQueue(listType: PlayListType.HAPPY)
        
        picker.dataSource = self
        picker.delegate = self
        
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerData[row]{
            
        case "happy":
            print("happy selected")
            setSongQueue(listType: PlayListType.HAPPY)
            break
            
        case "sad":
            print("sad selected")
            setSongQueue(listType: PlayListType.SAD)
            break
        case "gloomy":
            print("gloomy selected")
            setSongQueue(listType: PlayListType.GLOOMY)
            break
        case "calm":
            print("calm selected")
            setSongQueue(listType: PlayListType.CALM)
            break
            
        default:
            print("no matching selection")
            break

        }
    }
    
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
        let destinationVC:UIViewController = segue.destination as! UIViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func PlayPressed(_ sender: AnyObject)
    {
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
    
    
    @IBAction func NextPressed(_ sender: AnyObject) {
        playerData.m_player.skipToNextItem()
        updateLabels()
    }
    
    
    
    
    @IBAction func goBack(_ sender: AnyObject) {
        
    }
    
    
    
    
    func updateLabels() {
        
        m_songlabel.text = playerData.m_player.nowPlayingItem?.title
        m_artistlabel.text = playerData.m_player.nowPlayingItem?.artist
        m_albumlabel.text = playerData.m_player.nowPlayingItem?.albumTitle
        m_albumCoverLabel.image = playerData.m_player.nowPlayingItem?.artwork?.image(at: CGSize(width: 300, height: 300))
    }
    
    
    func setSongQueue(listType:PlayListType)
    {
        
        playerData.m_player.stop()
        
        let idList:Array<MPMediaEntityPersistentID>
        
        switch listType{
        
        case PlayListType.HAPPY:
            idList = Array(playerData.m_happyList)
            break
            
        case PlayListType.SAD:
            idList = Array(playerData.m_sadList)
            break
        
        case PlayListType.GLOOMY:
            idList = Array(playerData.m_gloomyList)
            break
        case PlayListType.CALM:
            idList = Array(playerData.m_calmList)
            break
        default:
            idList = Array(playerData.m_happyList)
            break
            
        
        }
        
        var allSongs = [MPMediaItem]()
        
        NSLog("current List %@ ", idList)
        
        for e in idList
        {

            
            let predicate = MPMediaPropertyPredicate(value: String(e), forProperty: MPMediaItemPropertyPersistentID)
            
            let songQuery = MPMediaQuery()
            songQuery.addFilterPredicate(predicate)
            
            
            var song: MPMediaItem?
            if let items = songQuery.items , items.count > 0 {
                song = items[0]
            }
            allSongs.append(song!)
        }
        
        print("All Songs in List ", allSongs)
        
        let mediaCollection = MPMediaItemCollection(items: allSongs)
        
        
        playerData.m_player.setQueue(with: mediaCollection)
        
        
        playerData.m_player.skipToBeginning()
        
    }
    
    
 
   
}
