//
//  AppInfoViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 6. 5..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController
{
    @IBOutlet var developerInfoView: UITextView!
    @IBOutlet var appInfoView: UITextView!
    
    @IBOutlet var phoneCallButton: UIButton?
    
    var audioController: AudioController
    
    var isAppInfoViewShowing = true
    
    @IBAction func InfoViewToggle(gesture: UITapGestureRecognizer?)
    {
        audioController.playerEffect(name: SoundWin)
        
        if isAppInfoViewShowing
        {
            UIView.transition(from: appInfoView,
                              to: developerInfoView,
                              duration: 1.0,
                              options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews],
                              completion: nil)
            self.title = "개발자 정보"
            phoneCallButton = UIButton(frame: CGRect(x: 400, y: 400, width: 50, height: 50))
            
        }
        else
        {
            UIView.transition(from: developerInfoView,
                             to: appInfoView,
                             duration: 1.0,
                             options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews],
                             completion: nil)
            self.title = "어플 정보"
            phoneCallButton = nil
        }
        
        isAppInfoViewShowing = !isAppInfoViewShowing
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        phoneCallButton = nil
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
