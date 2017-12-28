//
//  ViewController.swift
//  TipApp
//
//  Created by Brendan Raftery on 12/27/17.
//  Copyright © 2017 Brendan Raftery. All rights reserved.
///Users/Brendan_Raftery/Desktop/TipApp/TipApp/Base.lproj/Main.storyboard

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentButton: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var customLabel: UILabel!
    var doButton = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let percents = [0.10, 0.15, 0.2, 0.25]

        let bill = Double(billField.text!) ?? 0
        var tip = 0.0
        print("Front Update")
        if doButton {
            print("Do Button")
            tip = bill*Double(percents[percentButton.selectedSegmentIndex])
        } else {
            print("Do Slide")
            tip = bill*(Double(Int(percentSlider.value))*0.01)
        }
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onSlide(sender: AnyObject) {
        customLabel.text = String(format: "%.0f%%", Double(Int(percentSlider.value)))
        doButton = false
        calculateTip(sender)
        percentButton.selectedSegmentIndex = -1
    }
    
    @IBAction func onSelect(sender: AnyObject) {
        print("select")
        doButton = true
        calculateTip(sender)
    }
}

