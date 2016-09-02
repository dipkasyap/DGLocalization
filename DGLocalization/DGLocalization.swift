//  DGLocalization.swift
// Created by Dip Kasyap on 5/22/15.
// Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)


import UIKit

class DGLocalization:NSObject {
    
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
        let english = Locale()
        english.initWithLanguageCode("en", countryCode: "gb", name: "United Kingdom")
        self.availableLocales = [english]
    }
    
    //MARK:- Singleton
    class var sharedInstance: DGLocalization {
        struct Static {
            static var instance: DGLocalization?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = DGLocalization()
        }
        return Static.instance!
    }
    
    //MARK:- Methods
    func startLocalization(){
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let languageManager = DGLocalization.sharedInstance
        
        // Check if the language code has been already been set or not.
        let currentLanguage = userDefaults.stringForKey(DEFAULTS_KEY_LANGUAGE_CODE)
        
        if((userDefaults.stringForKey(DEFAULTS_KEY_LANGUAGE_CODE)) == nil){
            let currentLocale:NSLocale = NSLocale.currentLocale()
            
            // GO through available localisations to find the matching one for the device locale.
            for locale in languageManager.availableLocales {
                if (locale.languageCode!) == (currentLocale.objectForKey(NSLocaleLanguageCode) as! NSString) {
                    languageManager.setLanguage(withCode: locale)
                    break
                }
            }
            // If the device locale doesn't match any of the available ones, just pick the first one.
            if(((userDefaults.stringForKey(DEFAULTS_KEY_LANGUAGE_CODE))) == nil){
                languageManager.setLanguage(withCode:languageManager.availableLocales[0])
            }
        }
        else {
            languageManager.setLanguage(withCode: Locale().initWithLanguageCode(currentLanguage!, countryCode: currentLanguage!, name: currentLanguage!) as! Locale)
        }
    }
    
    func addLanguage(newLang: Locale)  {
        self.availableLocales.append(newLang)
    }
    func getCurrentLanguage()->Locale {
        return currentLocale
    }
    
    func setLanguage(withCode langCode: Locale) {
        NSUserDefaults.standardUserDefaults().setObject(langCode.languageCode, forKey:DEFAULTS_KEY_LANGUAGE_CODE)
        self.currentLocale = langCode
    }
    
    // DIP Return a translated string for the given string key.
    func getTranslationForKey(key: NSString)->NSString {
        
        // Get the language code.
        let languageCode =  NSUserDefaults.standardUserDefaults().stringForKey(DEFAULTS_KEY_LANGUAGE_CODE)
        
        // Get language bundle that is relevant.
        let bundlePath = NSBundle.mainBundle().pathForResource(languageCode as String?, ofType: "lproj")
        let Languagebundle = NSBundle(path: bundlePath!)
        
        // Get the translated string using the language bundle.
        let translatedString = Languagebundle?.localizedStringForKey(key as String, value:"", table: nil)
        return translatedString!;
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
    
    func localize()->String{
        return DGLocalization.sharedInstance.getTranslationForKey(self) as String
    }
}