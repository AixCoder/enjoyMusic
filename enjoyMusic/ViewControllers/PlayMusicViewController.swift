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
    
    var playViewModel:PlayViewModel = PlayViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.panelView.addSubview(self.nextButton)
        self.panelView.addSubview(self.playButton)
        // Do any additional setup after loading the view.
        self.layoutViews()
        
        playViewModel.subscribe { [weak self] (media: EMMedia, playState: DOUAudioStreamerStatus) in
            //根据播放状态刷新页面
            self?.stateChanged(media: media, playState: playState)
        }
    
        playViewModel.errorHandler { [weak self](error : NSError) in
            //处理异常情况
            self?.handlerViewModelError(error: error)
        }
        
        playViewModel.trigger(.loadSongLists())
        
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
    
    func stateChanged(media: EMMedia, playState: DOUAudioStreamerStatus) {
        
        switch playState {
        case .idle:
            playButton.setImage(UIImage.init(named: "play"), for: .normal)
            playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        case .paused:
            playButton.setImage(UIImage.init(named: "play"), for: .normal)
            playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
            
        case .playing:
            let img = UIImage.init(named: "play_selected")
            self.playButton.setImage(img, for: .normal)
            playButton.addTarget(self, action: #selector(suspendedPlayPressed), for: .touchUpInside)
         
        case .buffering:
            print("歌曲缓冲中")
            
        case .finished:
            print("播放完")
            playViewModel.trigger(.switchNextSong())
            
        case .error:
            print("播放中出错")
        }
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func handlerViewModelError(error: NSError) {
        switch error.code {
            //网络无法访问，可能是没有网络
        case NSURLErrorNotConnectedToInternet:
            do {
                let alertCtrl  = UIAlertController (title: "网络异常", message: "检查网络是否链接/或设置中查看是否允许app联网", preferredStyle: .alert)
                alertCtrl.addAction(UIAlertAction.init(title: "重试", style: .default, handler: { (action ) in
                    self.playViewModel.trigger(.loadSongLists())
                }))
                self.present(alertCtrl, animated: true, completion: nil)
                
        }
        default:
            NSLog("有异常未处理")
        }
    }
    
    //MARK: IB Action
    @objc private func playButtonPressed() {
        
        playViewModel.trigger(.play())
    }
    
    @objc private func playNextButtonPressed() {
        
        playViewModel.trigger(.switchNextSong())
    }
    
    @objc private func suspendedPlayPressed() {
        playViewModel.trigger(.pause())
    }
    
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
        
        btn.addTarget(self, action: #selector(playNextButtonPressed), for: .touchUpInside)
        
        return btn
        
    }()
    
    //播放按钮
    private lazy var playButton: UIButton = {
        ()-> UIButton in
        let button: UIButton = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "play"), for: .normal)
        button.sizeToFit()
        
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
  
}
