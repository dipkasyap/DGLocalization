// Created by Dip Kasyap on 5/22/15.
// Copyright (c) 2015 Dip Kasyap . All rights reserved.
// Feel Free to Customize & Improve :)
/*
The MIT License (MIT)
Copyright (c) 2016 Dip Kasyap (pr0gramm3r8hai). All rights reserved.

email:- dpd.ghimire@gmail.com
github : https://github.com/dipkasyap/DGLocalization

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE DGLocalization
*/

import UIKit

class LanguageChooserVC: UIViewController {
    
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
        let language = ["नेपाली","English"]
       
        for index in 0..<language.count {

            let normalAction = UIAlertAction(title: language[index], style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) -> Void in
                
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
                
        let closeAction = UIAlertAction(title:"Close".localize, style: UIAlertAction.Style.cancel) { (action: UIAlertAction!) -> Void in
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
        
        self.btnLanguageChooser.setTitle("languageButton".localize, for: UIControl.State.normal)
        self.continueButton.setTitle("Continue".localize, for: UIControl.State.normal)
        
    }
    
}

//MARK:-DGLoclalization Delegate
extension LanguageChooserVC:DGLocalizationDelegate {
    func languageDidChanged(to: (String)) {
        print("language changed to \(to)")
    }
}

