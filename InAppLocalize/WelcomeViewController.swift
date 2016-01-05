//
//  WelcomeViewController.swift
//  InAppLocalize
//
//  Created by Dip Kasyap on 5/22/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var Greeting: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var dGLocale = DGLocalization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguage()
        setContents()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func setLanguage(){
        self.Greeting.text = self.dGLocale.customLocalizedString("greeting", comment: "this is comment")as String
        self.backBtn.setTitle(self.dGLocale.customLocalizedString("Back", comment: "this is comment")as String, forState: UIControlState.Normal)

    }
    
    func setContents(){

        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        if (LanguageManager.sharedInstance.DEFAULTS_KEY_LANGUAGE_CODE == "ne"){
            imageView.image = UIImage(named: "nepal")
        }
        else {
        imageView.image = UIImage(named: "us")
        }
    }
    
    @IBAction func cloaseMe(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
}
