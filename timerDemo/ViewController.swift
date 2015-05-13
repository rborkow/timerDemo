//
//  ViewController.swift
//  timerDemo
//
//  Created by Robert Borkowski on 5/13/15.
//  Copyright (c) 2015 Robert Borkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var secondsRemaining: Int = 60
    var votes: Int = 1000000
    var voteFormat = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        voteFormat.numberStyle = .DecimalStyle
        voteFormat.groupingSeparator = ","
        voteFormat.groupingSize = 3
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onStartButtonPressed(sender: AnyObject) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: Selector("updateLabels:"),
            userInfo: nil,
            repeats: true
        )
        startButton.enabled = false
    }
    
    func updateLabels(timer: NSTimer) {
        println(secondsRemaining)
        if secondsRemaining == 0 {
            timer.invalidate()
            startButton.enabled = true
        } else {
            secondsRemaining--
            timerLabel.text = "00:00:\(secondsRemaining)"
            
            votes += Int(arc4random_uniform(1000)+1)
            counterLabel.text = voteFormat.stringFromNumber(votes)
        }
    }

}

