//
//  HomeViewController.swift
//  enjoyMusic
//
//  Created by liuhongnian on 7/24/17.
//  Copyright © 2017 liuhongnian. All rights reserved.
//

import UIKit

private var mycontext = 0

class HomeViewController: EMBaseViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    
    var homeViewModel:HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage.init(named: "iPhone6_bg")
        bgImageView.image = image
        
        homeViewModel = HomeViewModel()
        self.observableViewModel()
        homeViewModel.loadToken()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        homeViewModel.removeObserver(self, forKeyPath: "result")
    }
    
    private func addPlayViewController() {
        
        let playViewController: PlayMusicViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayMusicViewController") as! PlayMusicViewController
        
        playViewController.view.backgroundColor = UIColor.clear
        self.view.addSubview(playViewController.view)
        self.addChildViewController(playViewController)
    }
    
    private func tryRequestDoubanToken(){
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func observableViewModel() {
        
        homeViewModel.addObserver(self, forKeyPath: "result", options: .new, context: &mycontext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &mycontext {
            
            if (change?[NSKeyValueChangeKey.newKey]) != nil {
                self.addPlayViewController()
            }else{
                
                print("获取token失败")
            }
        }
    }

}
