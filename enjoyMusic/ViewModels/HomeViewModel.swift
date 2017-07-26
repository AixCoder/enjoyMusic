//
//  HomeViewModel.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    var repository: HomeViewRepository

    override init() {
        
        repository = HomeViewRepository.init()

        
        super.init()
        
    }
    
    
    func loadToken() {
        
        repository.doubanToken { (token, error) in
            
        }
    }
}
