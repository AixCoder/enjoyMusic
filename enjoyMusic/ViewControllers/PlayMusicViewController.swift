//
//  PlayMusicViewController.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/24/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class PlayMusicViewController: EMBaseViewController {

    @IBOutlet weak var circularButton: UIButton!
    
//    var nextButton: UIButton
//    var playButton: UIButton
//    var stopButton: UIButton
    
    @IBOutlet weak var panelView: TransparentView!
//    @IBOutlet weak var panelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        

        panelView.translatesAutoresizingMaskIntoConstraints = false
        
//        var constraint:NSLayoutConstraint = NSLayoutConstraint (item: nextButton, attribute: .right, relatedBy: .equal, toItem: self.panelView, attribute: .right, multiplier: 1, constant: -20)
        
//        let constraint1 = NSLayoutConstraint (item: self.nextButton,
//                                              attribute: .centerY,
//                                              relatedBy: .equal,
//                                              toItem:self.panelView,
//                                              attribute: .centerY,
//                                              multiplier: 1,
//                                              constant: 1)
        
        
        let constraint1: NSLayoutConstraint = NSLayoutConstraint.init(item: nextButton, attribute: .trailing, relatedBy: .equal, toItem: self.panelView, attribute: .trailing, multiplier: 1, constant: -20)
        self.panelView.addConstraint(constraint1)
        
//        self.panelView.addConstraint(constraint1)

        
 
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var nextButton: UIButton{
        get {
            let button = UIButton.init(type: .custom)
            button.setImage(UIImage.init(named: "player_next"), for: .normal)
            button.sizeToFit()
            return button
        }
    }

}
