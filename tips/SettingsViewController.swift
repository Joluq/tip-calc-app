//
//  SettingsViewController.swift
//  tips
//
//  Created by Joanna  on 12/24/15.
//  Copyright (c) 2015 Jo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var default_percent: Int = 0
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaults = NSUserDefaults.standardUserDefaults()
        default_percent = defaults.integerForKey("default_percent") ?? 0
        defaultTipControl.selectedSegmentIndex = default_percent
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        updateDefaultTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipChanged(sender: UISegmentedControl) {
        updateDefaultTip()
    }
    
    func updateDefaultTip(){
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "default_percent")
        defaults.synchronize()
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
