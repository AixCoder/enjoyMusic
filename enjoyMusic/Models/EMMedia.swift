//
//  EMMedia.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

class EMMedia: NSObject,DOUAudioFile {

    private(set) var title: String
    private(set) var arttist: String
    private(set) var audioFileURLString :String
    private(set) var coverUrl :String
    
    init(withTitle title: String, arttist: String, audioFileURLString :String,coverUrl: String){
        
        self.title = title
        self.arttist = arttist
        self.audioFileURLString = audioFileURLString
        self.coverUrl = coverUrl
        
        super.init()
    }
    
    
    func audioFileURL() -> URL! {

        return URL.init(string: audioFileURLString)
    }
 
}
