//
//  ViewController.swift
//  InAppLocalize
//
//  Created by apple on 5/22/15.
//  Copyright (c) 2015 apple. All rights reserved.
// DIP: COPYLEFT : Fell Free to Customize & Improve :)

import UIKit

class LanguageChooserVC: UIViewController {
    
    
    var dGlocale = DGLocalization()
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var btnLanguageChooser: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.decorate()
        self.continueButton.setTitle("Continue".localize(), forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func changeLanguage(sender: AnyObject) {
        
        let selectLanguage = "languageButton".localize()
        let msg = "languageMsg".localize()
        
        let moviePicker = UIAlertController(title: selectLanguage, message: msg, preferredStyle: .ActionSheet)
        var language = ["नेपाली","English"]
       
        for index in 0..<language.count {

            let normalAction = UIAlertAction(title: language[index], style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                
                if index == 0 {
                    
                    let english = Locale()
                    english.initWithLanguageCode("ne", countryCode: "ne", name: "Nepal")
                    DGLocalization.sharedInstance.setLanguage(withCode:english)
                    
                    //Load selected Language to Views
                    self.decorate()
                }
                else {
                                        
                    let english = Locale()
                    english.initWithLanguageCode("en", countryCode: "gb", name: "United Kingdom")
                    DGLocalization.sharedInstance.setLanguage(withCode:english)
                    
                    //Load selected Language to Views
                    self.decorate()                    }
            })
            
            moviePicker.addAction(normalAction)
        }
                
        let closeAction = UIAlertAction(title:"Close".localize(), style: UIAlertActionStyle.Cancel) { (action: UIAlertAction!) -> Void in
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
        
        self.textLabel.text = "text".localize()
        
        self.btnLanguageChooser.setTitle("languageButton".localize(), forState: UIControlState.Normal)
        self.continueButton.setTitle("Continue".localize(), forState: UIControlState.Normal)
        
    }
    
}

