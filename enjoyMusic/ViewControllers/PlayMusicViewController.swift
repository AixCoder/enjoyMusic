//
//  PlayMusicViewController.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/24/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

class PlayMusicViewController: EMBaseViewController {
    
    @IBOutlet weak var panelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.panelView.addSubview(self.nextButton)
        self.panelView.addSubview(self.playButton)
        // Do any additional setup after loading the view.
        self.layoutViews()

    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    
 
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
    
    //MARK: prive
    private func layoutViews(){
        
        panelView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint (item: nextButton,
                                             attribute: .trailing,
                                             relatedBy: .equal,
                                             toItem: self.panelView,
                                             attribute: .trailing,
                                             multiplier: 1,
                                             constant: -20)
        
        let constraint1 = NSLayoutConstraint (item: self.nextButton,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem:self.panelView,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 1)
        
        
        self.panelView.addConstraint(constraint1)
        self.panelView.addConstraint(constraint)
        
        
        
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        let playButtonLeft = NSLayoutConstraint(item: playButton,
                                                attribute: .leading,
                                                relatedBy: .equal, toItem: panelView, attribute: .leading, multiplier: 1, constant: 20)
        self.panelView.addConstraint(playButtonLeft)
        
        let playButtonYPoint = NSLayoutConstraint(item:playButton,
                                                  attribute: .centerY, relatedBy: .equal, toItem: panelView, attribute: .centerY, multiplier: 1, constant: 0)
        self.panelView.addConstraint(playButtonYPoint)
        
        
    }
    
    //MARK: getter
    //下一首按钮
    private lazy var nextButton: UIButton = {
        
        ()-> UIButton in
        let btn:UIButton = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "player_next"), for: .normal)
        btn.sizeToFit()
        
        print("初始化button")
        return btn
        
    }()
    //播放按钮
    private lazy var playButton: UIButton = {
        ()-> UIButton in
        let button: UIButton = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "play"), for: .normal)
        button.sizeToFit()
        return button
    }()

}
