//
//  PlayViewModel.swift
//  enjoyMusic
//
//  Created by liuhongnian on 2017/7/26.
//  Copyright © 2017年 liuhongnian. All rights reserved.
//

import UIKit

protocol UserAction{}

class PlayViewModel: NSObject {
    
    enum actionType: UserAction {
        case play()
        case pause()
        case switchNextSong()
    }

    func trigger(_ action :UserAction){
        
        
    }
}
