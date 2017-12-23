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
    
    enum ScreenSize {
        case iphone_35_inch
        case iphone_4_inch
        case iphone_47_inch
        case iphone_55_inch
        case iphone_58_inch
    }

    @IBOutlet weak var bgImageView: UIImageView!
    
    var homeViewModel:HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var image = UIImage.init(named: "iPhone6_bg")
        let size: ScreenSize = self.currentScreenSize()
        switch size {
        case .iphone_4_inch:
            image = UIImage.init(named: "4-inch")
        case .iphone_47_inch:
            image = UIImage.init(named: "4.7-inch")
        case .iphone_55_inch:
            image = UIImage.init(named: "5.5-inch")
        case .iphone_58_inch:
            image = UIImage.init(named: "4.7-inch")
        case.iphone_35_inch:
            image = UIImage.init(named: "3.5-inch")
        }
        
        bgImageView.image = image

        self.addPlayViewController()
//        homeViewModel = HomeViewModel()
//        self.observableViewModel()
//        homeViewModel.loadToken()
        
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

    private func currentScreenSize() -> ScreenSize {
        let screen_width = UIScreen.main.bounds.width
        let screen_height = UIScreen.main.bounds.height
        switch (screen_width,screen_height) {
        case (320,480),(480,320):
            return .iphone_35_inch
        case (320,568),(568,320):
            return .iphone_4_inch
        case (375,667),(667,375):
            return .iphone_47_inch
        case (414,736),(736,414):
            return .iphone_55_inch
        case (375,812),(812,375):
            return .iphone_58_inch
        default:
            return .iphone_4_inch
        }
    }

}
