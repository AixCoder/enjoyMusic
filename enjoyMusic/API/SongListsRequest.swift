//
//  SongListsRequest.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/29/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class SongListsRequest: YTKRequest {
    
    
    override func requestUrl() -> String {
        //豆瓣上创建的享听歌单url
        return "https://api.douban.com/v2/fm/songlist/20065634/detail"
    }
    
    override func requestMethod() -> YTKRequestMethod {
        
        return .POST
    }
 
}
