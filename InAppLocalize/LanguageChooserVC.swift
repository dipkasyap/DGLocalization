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

        DGLocalization.sharedInstance.Delegate = self;
        
        self.decorate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLanguage(_ sender: AnyObject) {
        
        let selectLanguage = "languageButton".localize
        let msg = "languageMsg".localize
        
        let moviePicker = UIAlertController(title: selectLanguage, message: msg, preferredStyle: .actionSheet)
        var language = ["नेपाली","English"]
       
        for index in 0..<language.count {

            let normalAction = UIAlertAction(title: language[index], style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) -> Void in
                
                if index == 0 {
                    
                    let Nepali = Locale().initWithLanguageCode(languageCode: "ne", countryCode: "ne", name: "Nepal")
                    DGLocalization.sharedInstance.setLanguage(withCode:Nepali)
                    
                    //Load selected Language to Views
                    self.decorate()
                }
                else {
                                        
                    let english = Locale().initWithLanguageCode(languageCode: "en", countryCode: "gb", name: "United Kingdom")
                    DGLocalization.sharedInstance.setLanguage(withCode:english)
                    
                    //Load selected Language to Views
                    self.decorate()                    }
            })
            
            moviePicker.addAction(normalAction)
        }
                
        let closeAction = UIAlertAction(title:"Close".localize, style: UIAlertActionStyle.cancel) { (action: UIAlertAction!) -> Void in
        }
        
        moviePicker.addAction(closeAction)
        self.present(moviePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnContinue( _ sender: AnyObject) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "welcomeView") as! WelcomeViewController
        self.present(nextView, animated:true, completion: nil)
        
        
    }
    
    //DIP:: Do view recorating form here
    func decorate() {
        
        self.textLabel.text = "text".localize
        
        self.btnLanguageChooser.setTitle("languageButton".localize, for: UIControlState.normal)
        self.continueButton.setTitle("Continue".localize, for: UIControlState.normal)
        
    }
    
}

//MARK:-DGLoclalization Delegate
extension LanguageChooserVC:DGLocalizationDelegate {
    func languageDidChanged(to: (String)) {
        print("language changed to \(to)")
    }
}

