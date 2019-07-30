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
        self.Greeting.text = "greeting".localize
        self.backBtn.setTitle("Back".localize, for: UIControl.State())
        
    }
    
    func setContents(){
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        let lang = DGLocalization.sharedInstance.getCurrentLanguage()
        
        if (lang.languageCode == "ne"){
            imageView.image = UIImage(named: "nepal")
        }
        else {
            imageView.image = UIImage(named: "us")
        }
    }
    
    @IBAction func cloaseMe(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
