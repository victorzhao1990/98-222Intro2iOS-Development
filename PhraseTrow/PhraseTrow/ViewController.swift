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
    
    @IBOutlet var timerDisplay: UILabel!
    
    @IBOutlet var nextWordButton: UIButton!
    
    var nounDict: NounDictionary!
    
    var timer: NSTimer!
    
    // TODO: Achieve the full functionality of the timer/clock
    // The variable that used to record the start time
    var startTime: NSTimeInterval?
    
    var currentTime: NSTimeInterval?
    
    func updateTime() {
        currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // Find the different between current time and start time
        
        // One varialbe to track the different portion in the time format
        var elapsedTime = currentTime! - startTime!
        
        // calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        // calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        // add the leading zero for minutes,
        let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction) : "0" + String(fraction)
        
        // concatenate minutes, seconds and milliseconds as assign it to the UILabel
        timerDisplay.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    
    func timerFireMethod() {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "h:mm a"
        timerDisplay.text = formatter.stringFromDate(timer.fireDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nextWordLabel.text = "Press the button!"
        self.nounDict = NounDictionary()
        self.nextWordLabel.text = ""
        
        // TODO: Initialize a Timer
        // timer = NSTimer(timeInterval: 0.1, target: self, selector: Selector("timerFireMethod"), userInfo: nil, repeats: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextWordButton(sender: UIButton) {
        if nextWordButton.currentTitle == "Stop!" {
            nextWordButton.setTitle("Next Word!", forState:UIControlState.Normal)
            stopTimer()
        } else {
            nextWordButton.setTitle("Stop!", forState:UIControlState.Normal)
            var word: String? = nounDict.randomWord()
            if word != nil {
                // TODO: Captalize the word
                self.nextWordLabel.text = word!.uppercaseString
            }
            timerDisplay.hidden = false
            startTimer()
        }
        
        // nextWordButton.text = "Stop!"
        // timer.fire()
    }
    
    func startTimer() {
        let aSelector: Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    func stopTimer() {
        timer.invalidate()
        timer == nil
    }
}

