//
//  ViewController.swift
//  tips
//
//  Created by Joanna  on 12/19/15.
//  Copyright (c) 2015 Jo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    
    var initial: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingBegin(sender: AnyObject) {
        if(billField.text == "$" && initial){
            billField.text = nil
            initial = false
        }
        
        if(billField.text == "$" && !initial) {
            billField.text = nil
            
            UIView.animateWithDuration(0.5, animations: {
                self.lowerView.alpha = 0.4
                self.tipControl.alpha = 1
                self.tipLabel.alpha = 1
                self.totalLabel.alpha = 1
                self.tipText.alpha = 1
                self.totalText.alpha = 1
                self.billField.center.y -= 80
            })
            
            
        }
    }

    @IBAction func onEditingEnd(sender: AnyObject) {
        if(billField.text.isEmpty) {
            billField.text = "$"
            UIView.animateWithDuration(0.5, animations: {
                self.lowerView.alpha = 0
                self.tipControl.alpha = 0
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.tipText.alpha = 0
                self.totalText.alpha = 0
                self.billField.center.y += 80
            })
            
        }
    }

    @IBAction func settingsTransition(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showVC", sender: self)
    }
}
