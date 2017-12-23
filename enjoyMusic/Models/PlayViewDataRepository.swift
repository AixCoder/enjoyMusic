//
//  PlayViewDataRepository.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit


class PlayViewDataRepository: NSObject {

    func creationLists() {
        
        let token: String = UserDefaults.standard.object(forKey: "douban_token") as! String
        
        let request = CreationListRequest.init(doubanToken: token)
        request.startWithCompletionBlock(success: { (baseReq) in
            
        }) { (baseRequest) in
            
        }
    }
    
    func getSongList(completionHandler: @escaping ((Any? ,NSError?) ->Void) ) {
                
        let songRequest = SongListsRequest()
        songRequest.startWithCompletionBlock(success: { (baseRequest) in
            
            completionHandler(baseRequest.responseObject, Optional.none)
            
        }) { (baseRequest: YTKBaseRequest) in
            completionHandler(nil, baseRequest.error as NSError?)
        }
    }
}
