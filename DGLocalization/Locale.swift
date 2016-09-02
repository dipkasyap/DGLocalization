//
//  Locate.swift
//  InAppLocalize
//
//  Created by Dip Kasyap on 5/22/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)

import UIKit

class Locale: NSObject {
  
//    var name:NSString?
    var languageCode:NSString?
    var countryCode:NSString?
    
    func initWithLanguageCode(languageCode: NSString,countryCode:NSString,name: NSString)->AnyObject{
//        self.name = name
        self.languageCode = languageCode
        self.countryCode = countryCode
        return self
    }
 }
