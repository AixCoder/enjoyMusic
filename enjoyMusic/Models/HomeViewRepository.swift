//
//  HomeViewRepository.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

typealias completionHandler = (_ tokenValue: String,_ error: NSError?) ->()

class HomeViewRepository: NSObject {

    override init() {
        
        super.init()
        
    }
    
    func doubanToken(completionHandler:  @escaping completionHandler) {
        
        if UserDefaults.standard.object(forKey: "douban_token") != nil
        {
            let token:String = UserDefaults.standard.object(forKey: "douban_token") as! String
            completionHandler(token ,Optional.none)
        }
        else
        {
        let request = DoubanToken.init()
        request.startWithCompletionBlock(success: { (baseRequest: YTKBaseRequest) in
            
            let json = JSON(baseRequest.responseData!)
            let token: String = json["access_token"].string!
            
            //save token
            UserDefaults.standard.set(token, forKey: "douban_token")
            
            completionHandler(token,Optional.none)
            
        }) { (baseRequest: YTKBaseRequest) in
            
            
        }
        
    }
        
    }
    
}
