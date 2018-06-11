//
//  ViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 15..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var audioController: AudioController
    @IBOutlet var myView: UIView!
    
    required init?(coder aDecoder: NSCoder)
    {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func TapView(gesture: UITapGestureRecognizer?)
    {
        audioController.playerEffect(name: SoundDing)
        
        let explore = ExplodeView(frame: CGRect(x: (gesture?.location(in: myView).x)!, y: (gesture?.location(in: myView).y)!, width: 1, height: 1))
        
        myView.addSubview(explore)
        myView.sendSubview(toBack: explore)
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

    @IBAction func backToViewController(segue:UIStoryboardSegue)
    {
        
    }
    
}
