//
//  TransparentView.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/24/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class TransparentView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.config()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.config()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let myRect = CGRect.init(x: 10, y: 10, width: 60, height: 60)
        
        let overlayPath = UIBezierPath.init(rect: self.bounds)
        let roundedPath = UIBezierPath.init(roundedRect: myRect, cornerRadius: 30)
        overlayPath.append(roundedPath)
        overlayPath.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer.init()
        fillLayer.frame = self.bounds
        fillLayer.path = overlayPath.cgPath
        fillLayer.fillRule = kCAFillRuleEvenOdd
        fillLayer.fillColor = UIColor.white.cgColor
        
        self.layer.addSublayer(fillLayer)
        
        
    }
    
    private func config() {
        
        self.backgroundColor = UIColor.clear
        
    }
    

}
