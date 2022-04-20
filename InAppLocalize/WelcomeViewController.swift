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

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var Greeting: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var dGLocale = DGLocalization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguage()
        setContents()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setLanguage(){
        self.Greeting.text = "greeting".localize
        self.backBtn.setTitle("Back".localize, for: UIControl.State())
        
    }
    
    func setContents(){
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        let lang = DGLocalization.sharedInstance.getCurrentLanguage()
        
        if (lang.languageCode == "ne"){
            imageView.image = UIImage(named: "nepal")
        }
        else {
            imageView.image = UIImage(named: "us")
        }
    }
    
    @IBAction func cloaseMe(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
