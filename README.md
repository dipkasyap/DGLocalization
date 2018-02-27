
<p align="center"> 
<img src="https://user-images.githubusercontent.com/12591229/36713674-ded0ca38-1bb6-11e8-8448-1e18b7d345cf.png">
</p>

# DGLocalization 
# Supports Swift 3.0
For Swift 2.X use previous release for swift 2.x

![dglocalization](https://cloud.githubusercontent.com/assets/12591229/18203270/b1ba7076-7135-11e6-9ead-6921c8d19ab8.gif)
# How to use
1. Drag DGLocalization folder to your project.
2. Create a new file of type string from file -> new -> resources -> string file  name it exactly ** Localizable.string **
3. The tile localizable.string will be holding all the translation of your app (see on demo app for more information.) IMPORTANT: the localizable.string file must contain key and value pair in format of "key" = "value"; dont forgot the ;(semicolon) at the end of line
4. Localize your app from  project -> info -> Localizations, add the language to which you are localizing your app.
5. Start Localizing from didFinishLaunchingWithOptions method of app delegate
 
``` 
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        DGLocalization.sharedInstance.startLocalization()
        return true
    }
```
#Methods
Setting new language : IMPORTANT -> Do not forgot to set the language code to the exact of lproj folder that is created on localization of your string file

```
//make instance
let english = Locale().initWithLanguageCode(languageCode: "en", countryCode: "gb", name: "United Kingdom")

//set current language
DGLocalization.sharedInstance.setLanguage(withCode:english)

```

 and access like  
 ```
let someConvertedText = "keyfortext".localize
```
"keyfortext" is the key of your text on localizable.string file! 

#Delegate
```
 func languageDidChanged(to: (String)) {
        print("language changed to \(to)")
    }
```
# For more referance see demo project

#Licence

The MIT License (MIT)
Copyright (c) 2014 Dip Kasyap (pr0gramm3r8hai)

email:- dpd.ghimire@gmail.com
github : https://github.com/dipkasyap/DGLocalization

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE DGLocalization
