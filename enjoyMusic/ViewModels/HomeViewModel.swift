//
//  HomeViewModel.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

class HomeViewModel:  NSObject {

    dynamic private(set) var result: String? = nil
    private(set) var executing: Bool
    private(set) var error: NSError?
    
    var repository: HomeViewRepository

    override init() {
        
        repository = HomeViewRepository.init()

        executing = false
        
        self.result = ""
        
        super.init()
        
    }
    
    
    func loadToken() {
        
        repository.doubanToken { (token, error) in
            
            self.result = token
        }
    }
}
