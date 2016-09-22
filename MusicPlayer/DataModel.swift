//
//  DataModel.swift
//  MusicPlayer
//
//  Created by Frauke Kling on 21.09.16.
//  Copyright © 2016 Frauke Kling. All rights reserved.
//

import Foundation
import MediaPlayer

struct playerData{

    static var m_happyList = Set<MPMediaEntityPersistentID>()
    static var m_calmList = Set<MPMediaEntityPersistentID>()
    static var m_gloomyList = Set<MPMediaEntityPersistentID>()
    static var m_sadList = Set<MPMediaEntityPersistentID>()
    
    static let m_player = MPMusicPlayerController.systemMusicPlayer()
}


enum PlayListType {
    case HAPPY
    case SAD
    case GLOOMY
    case CALM
}
