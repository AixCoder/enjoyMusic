//
//  HomeViewRepository.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

//func _AddHandlerHelper(step: Int) -> () -> Int {
//    let num = Num()
//    
//    let obj = _AddHelper()
//    obj.num = num
//    obj.step = step
//    return obj.add
//}

typealias completionHandler = (_ tokenValue: String,_ error: NSError) ->()

class HomeViewRepository: NSObject {

    override init() {
        
        super.init()
        
    }
    
    func doubanToken(completionHandler: completionHandler) {
        
        let request = DoubanToken.init()
        request.startWithCompletionBlock(success: { (baseRequest: YTKBaseRequest) in
            
            
        }) { (baseRequest: YTKBaseRequest) in
            
            
        }
        
    }
    
}
