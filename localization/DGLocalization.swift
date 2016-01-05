//
//  Constants.swift
//  InAppLocalize
//
//  Created by Dip Kasyap on 5/22/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)



import UIKit

class DGLocalization {
    
    
    func getLanguageCode()->NSString {
        
      // language code is saved as constant on #languaeManager class as DEFAULTS_KEY_LANGUAGE_CODE
         let languageCode = LanguageManager.sharedInstance.DEFAULTS_KEY_LANGUAGE_CODE
         print("The Selected Language code is  \(languageCode)")
         return languageCode
    }
    
    func customLocalizedString(key: NSString,comment: NSString)->NSString{
        return LanguageManager.sharedInstance.getTranslationForKey(key)

    }
}
