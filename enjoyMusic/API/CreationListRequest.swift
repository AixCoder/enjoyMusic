//
//  CreationListRequest.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/29/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class CreationListRequest: YTKRequest {

    private var token: String
    private var songLists :Array<Any>
    
    init(doubanToken: String) {
        
        self.token = doubanToken
        self.songLists = []
        
        super.init()
    }
    
    override func requestUrl() -> String {
        return "https://api.douban.com/v2/fm/programme/creation"
    }
    
    override func requestMethod() -> YTKRequestMethod {
        
        return YTKRequestMethod.POST
    }
    
    override func requestArgument() -> Any? {
        
        let arg = ["alt": "json",
                   "apikey": "02646d3fb69a52ff072d47bf23cef8fd",
                   "app_name" : "radio_iphone",
                   "audio_patch_version" : "4",
                   "client" : "s:mobile|y:iOS 10.3.2|f:120|d:ebf66f7519ad364db30c9eac3a575f357b9fd752|e:iPhone7,1|m:appstore",
                   "douban_udid" : "c5c76f3312085a64d8a1220fd2080e9ec611835a",
                   "limit": "20",
                   "start": "0",
                   "udid" : "ebf66f7519ad364db30c9eac3a575f357b9fd752",
                   "user_accept_play_third_party": "0",
                   "version" : "120"]
        
        return arg
        
    }
    
    override func requestHeaderFieldValueDictionary() -> [String : String]? {
        
        var value = "Bearer "
        value += self.token
        return ["Authorization" : value]
    }
    
}
