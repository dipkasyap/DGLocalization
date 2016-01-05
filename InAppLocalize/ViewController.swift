//
//  ViewController.swift
//  InAppLocalize
//
//  Created by apple on 5/22/15.
//  Copyright (c) 2015 apple. All rights reserved.
// DIP: COPYLEFT : Fell Free to Customize & Improve :)

import UIKit

class ViewController: UIViewController {
    
    
    var dGlocale = DGLocalization()
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var btnLanguageChooser: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    var locale = Locale()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locale = Locale()
        self.decorate()
        self.continueButton.setTitle(self.dGlocale.customLocalizedString("Continue", comment: "this is comment")as String, forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func changeLanguage(sender: AnyObject) {
        
        let selectLanguage = self.dGlocale.customLocalizedString("languageButton", comment: "") as String
        let msg = self.dGlocale.customLocalizedString("languageMsg", comment: "") as String
        
        let moviePicker = UIAlertController(title: selectLanguage, message: msg, preferredStyle: .ActionSheet)
        var language = ["नेपाली","English"]
        for var i=0; i<language.count;i++ {
            let index = i
            let normalAction = UIAlertAction(title: language[i], style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                
                if index == 0 {
                    LanguageManager.sharedInstance.DEFAULTS_KEY_LANGUAGE_CODE = "ne"
                    self.locale = LanguageManager.sharedInstance.availableLocales[1]
                    LanguageManager.sharedInstance.setLanguageWithLocale(self.locale)
                    
                    //Load selected Language to Views
                    self.decorate()
                }
                else {
                    LanguageManager.sharedInstance.DEFAULTS_KEY_LANGUAGE_CODE = "en"
                    self.locale = LanguageManager.sharedInstance.availableLocales[0]
                    LanguageManager.sharedInstance.setLanguageWithLocale(self.locale)
                    
                    //Load selected Language to Views
                    self.decorate()                    }
            })
            
            moviePicker.addAction(normalAction)
        }
        
        
        
        let closeAction = UIAlertAction(title: self.dGlocale.customLocalizedString("Close", comment: "this is comment")as String, style: UIAlertActionStyle.Cancel) { (action: UIAlertAction!) -> Void in
        }
        
        moviePicker.addAction(closeAction)
        self.presentViewController(moviePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnContinue(sender: AnyObject) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("welcomeView") as!WelcomeViewController
        self.presentViewController(nextView, animated:true, completion: nil)
        
        
    }
    
    //DIP:: Do view recorating form here
    func decorate() {
        
        self.textLabel.text = self.dGlocale.customLocalizedString("text", comment: "this is comment")as String
        self.btnLanguageChooser.setTitle(self.dGlocale.customLocalizedString("languageButton", comment: "this is comment")as String, forState: UIControlState.Normal)
        self.continueButton.setTitle(self.dGlocale.customLocalizedString("Continue", comment: "this is comment")as String, forState: UIControlState.Normal)
        
    }
    
}

