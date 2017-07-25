//
//  DoubanToken.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/20/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class DoubanToken: YTKRequest {

    
    override func requestUrl() -> String {
        return "https://www.douban.com/service/auth2/token"
    }
    
    override func requestMethod() -> YTKRequestMethod {
        return .POST
    }
    
    override func requestArgument() -> Any? {
        
        let argument = ["alt": "json",
                   "apikey": "02646d3fb69a52ff072d47bf23cef8fd",
                   "audio_patch_version": "4",
                   "client_id": "02646d3fb69a52ff072d47bf23cef8fd",
                   "client_secret": "cde5d61429abcd7c",
                   "device_id": "ebf66f7519ad364db30c9eac3a575f357b9fd752",
                   "douban_udid": "c5c76f3312085a64d8a1220fd2080e9ec611835a",
                   "grant_type": "password",
                   "password": "liuhongnian16",
                   "redirect_uri": "http://www.douban.com/mobile/fm",
                   "udid": "ebf66f7519ad364db30c9eac3a575f357b9fd752",
                   "user_accept_play_third_party": "0",
                   "username": "liuhongnian16@gmail.com"]
        return argument
    }
    
    override func requestHeaderFieldValueDictionary() -> [String : String]? {
        
        return ["User-Agent": "api-client/0.1.3 com.douban.DoubanRadio/4.9.3 iOS/10.3.2 iPhone7,1"]
    }
    
}




