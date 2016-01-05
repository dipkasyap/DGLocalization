//
//  AppDelegate.swift
//  InAppLocalize
//
//  Created by Dip Kasyap on 5/22/15.
//  Copyright (c) 2015 Dip Kasyap . All rights reserved.
// DIP: COPYLEFT : Feel Free to Customize & Improve :)

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //DIP :: 
        
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let languageManager = LanguageManager.sharedInstance
      
        
        // Check if the language code has been already been set or not.
        let currentLanguage = userDefaults.stringForKey("DEFAULTS_KEY_LANGUAGE_CODE")
        
        if((userDefaults.stringForKey("DEFAULTS_KEY_LANGUAGE_CODE")) == nil){
            let currentLocale:NSLocale = NSLocale.currentLocale()
            
            // GO through available localisations to find the matching one for the device locale.
            for localisation in languageManager.availableLocales {
              
                if (localisation as Locale).languageCode == (currentLocale.objectForKey(NSLocaleLanguageCode)as! String) {
                    languageManager.setLanguageWithLocale(localisation)
                    LanguageManager.sharedInstance.DEFAULTS_KEY_LANGUAGE_CODE = localisation.languageCode!

                    break
                }
            }
            
            
            // If the device locale doesn't match any of the available ones, just pick the first one.
            if(((userDefaults.stringForKey("DEFAULTS_KEY_LANGUAGE_CODE"))) == nil){
                
                languageManager.setLanguageWithLocale(languageManager.availableLocales[0])
             }
        }
        else {
            
            languageManager.DEFAULTS_KEY_LANGUAGE_CODE = currentLanguage!
            
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
}