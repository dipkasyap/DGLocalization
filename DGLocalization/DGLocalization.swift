//  DGLocalization.swift
// Created by Dip Kasyap on 5/22/15.
// Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)
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

@objc protocol DGLocalizationDelegate {
    @objc optional func languageDidChanged(to:(String))
}

class DGLocalization:NSObject {
    
   weak var Delegate:DGLocalizationDelegate?
    
    //MARK:- Instance var
    var DEFAULTS_KEY_LANGUAGE_CODE = "DEFAULTS_KEY_LANGUAGE_CODE"
    var availableLocales = [Locale]() {
        didSet {
            self.setLanguage(withCode: availableLocales.first!)
        }
    }
    
    var currentLocale = Locale()
    
    //MARK:- Int
    override init() {
        let english = Locale().initWithLanguageCode(languageCode: "en", countryCode: "gb", name: "United Kingdom")
        self.availableLocales = [english as! Locale]
    }
    
    //MARK:- Singleton
    static let sharedInstance: DGLocalization = {DGLocalization()}()
    
    //MARK:- Methods
    func startLocalization(){
        
        let userDefaults = UserDefaults.standard
       let languageManager = DGLocalization.sharedInstance
        
        // Check if the language code has been already been set or not.
        let currentLanguage = userDefaults.string(forKey: DEFAULTS_KEY_LANGUAGE_CODE)
        
        if((userDefaults.string(forKey: DEFAULTS_KEY_LANGUAGE_CODE)) == nil){
            let currentLocale:NSLocale = NSLocale.current as NSLocale
            
            // GO through available localisations to find the matching one for the device locale.
            for locale in languageManager.availableLocales {
                if (locale.languageCode!) == (currentLocale.object(forKey: NSLocale.Key.languageCode) as! NSString) {
                    languageManager.setLanguage(withCode: locale)
                    break
                }
            }
            // If the device locale doesn't match any of the available ones, just pick the first one.
            if(((userDefaults.string(forKey: DEFAULTS_KEY_LANGUAGE_CODE))) == nil){
                languageManager.setLanguage(withCode:languageManager.availableLocales[0])
            }
        }
        else {
            languageManager.setLanguage(withCode: Locale().initWithLanguageCode(languageCode: currentLanguage! as NSString, countryCode: currentLanguage! as NSString, name: currentLanguage! as NSString) as! Locale)
        }
    }
    
    func addLanguage(newLang: Locale)  {
        self.availableLocales.append(newLang)
    }
    func getCurrentLanguage()->Locale {
        return currentLocale
    }
    
    func setLanguage(withCode langCode: AnyObject) {
        let langCode = langCode as! Locale
        UserDefaults.standard.set(langCode.languageCode, forKey:DEFAULTS_KEY_LANGUAGE_CODE)
        //delegate
        if let delegate = Delegate {
            delegate.languageDidChanged!(to: langCode.languageCode! as (String))
        }
        
        self.currentLocale = langCode
    }
    
    // DIP Return a translated string for the given string key.
    func getTranslationForKey(key: NSString)->NSString {
        
        // Get the language code.
        let languageCode =  UserDefaults.standard.string(forKey: DEFAULTS_KEY_LANGUAGE_CODE)
        
        // Get language bundle that is relevant.
        let bundlePath = Bundle.main.path(forResource: languageCode as String?, ofType: "lproj")
        let Languagebundle = Bundle(path: bundlePath!)
        
        // Get the translated string using the language bundle.
        let translatedString = Languagebundle?.localizedString(forKey: key as String, value:"", table: nil)
        return translatedString! as NSString;
    }
}


//MARK:- Locale
class Locale: NSObject {
    
    var name:NSString?
    var languageCode:NSString?
    var countryCode:NSString?
    
    func initWithLanguageCode(languageCode: NSString,countryCode:NSString,name: NSString)->AnyObject{
        self.name = name
        self.languageCode = languageCode
        self.countryCode = countryCode
        return self
    }
}


//MARK:- extension
extension String {
    
     var localize:String{
        return DGLocalization.sharedInstance.getTranslationForKey(key: self as NSString) as String
    }
}
