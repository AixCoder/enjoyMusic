//
//  PlayViewModel.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

private var StatusKVOKey = 0


protocol UserAction{}
protocol StateType {}

class PlayViewModel: NSObject {
    
    private var songsRepostitory: PlayViewDataRepository
    
    private var mp4Files: Array<EMMedia>
    private var currentMedia: EMMedia?
    
    private var musicPlayer: DOUAudioStreamer?
    
    private var subscriber: ((_ media :EMMedia ,_ state: DOUAudioStreamerStatus) ->Void)?
    private var viewModelErrorHander: ((_ viewModelerror : NSError) -> Void)?
    
    enum ActionType: UserAction {
        case play()
        case pause()
        case switchNextSong()
        case loadSongLists()
    }
    
    override init() {
        
        self.songsRepostitory = PlayViewDataRepository()
        self.mp4Files = []
        self.currentMedia = nil
        super.init()
        

    }
    
    func subscribe(handler:@escaping (EMMedia , DOUAudioStreamerStatus) ->Void) {
        self.subscriber = handler
    }
    
    func errorHandler(handler:@escaping(NSError) ->Void) {
        self.viewModelErrorHander = handler;
    }

    func trigger(_ action :ActionType){
        
        switch action {
        case .play():
            self.musicPlayer?.play()
            
        case .pause():
            self.musicPlayer?.pause()
            
        case .switchNextSong():

          let nextIndex = self.mp4Files.index(of: self.currentMedia!)! + 1
          if nextIndex < self.mp4Files.count {
            
            self.currentMedia = self.mp4Files[nextIndex]
            self.updateMusicPlayer()
            
            }
            
          if nextIndex == self.mp4Files.count {
            self.currentMedia = self.mp4Files.first
            self.updateMusicPlayer()
            }
            
        case .loadSongLists():
            weak var weakSelf = self
            self.songsRepostitory.getSongList(completionHandler: { (songList, error) in
                
                if(error != nil){
                    weakSelf?.viewModelErrorHander!(error!)
                }else{
                    let list: Dictionary = songList as! Dictionary<String, Any>
                    let songs: Array<Dictionary<String, Any>> = list["songs"] as! Array<Dictionary<String, Any>>
                    self.mp4Files.removeAll()
                    for song in songs {
                        let title: String = song["title"] as! String
                        let artist: String = song["artist"] as!String
                        let mp4UrlString: String = song["url"] as!String
                        let pic: String = song["picture"] as!String
                        
                        let media:EMMedia = EMMedia.init(withTitle: title, arttist: artist, audioFileURLString: mp4UrlString, coverUrl: pic)
                        
                        self.mp4Files.append(media)
                        
                    }
                    
                    self.currentMedia = self.mp4Files.first
                    
                    self.updateMusicPlayer()
                }

            })
        }
    }
    
    private func updateMusicPlayer() {
        
        self.cancelPlayer()
        
        self.musicPlayer = DOUAudioStreamer.init(audioFile: self.currentMedia)
        self.musicPlayer?.addObserver(self, forKeyPath: "status", options: .new, context: &StatusKVOKey)

        self.musicPlayer?.play()
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &StatusKVOKey {
            
            let state:NSNumber = change?[NSKeyValueChangeKey.newKey] as! NSNumber
            print(state.intValue)
            
            DispatchQueue.main.async {
                self.subscriber!(self.currentMedia!,DOUAudioStreamerStatus(rawValue: UInt(state.intValue))!)
            }
        }
    }
    
    private func cancelPlayer() {
        
        if self.musicPlayer != nil {
            
            self.musicPlayer?.removeObserver(self, forKeyPath: "status")
            self.musicPlayer?.pause()
        }
        
        self.musicPlayer = nil
        
    }
}
