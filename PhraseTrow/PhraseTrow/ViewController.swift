//
//  ViewController.swift
//  PhraseTrow
//
//  Created by Xinyun (Victor) Zhao on 1/16/15.
//  Copyright (c) 2015 Xinyun (Victor) Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nextWordLabel: UILabel!
    
    var nounDict: NounDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nextWordLabel.text = "Press the button!"
        self.nounDict = NounDictionary()
        self.nextWordLabel.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextWordButton(sender: UIButton) {
        var word: String? = nounDict.randomWord()
        if word != nil {
            self.nextWordLabel.text = word!
        }
    }

}

