//
//  ViewController.swift
//  votingsystem
//
//  Created by Kosta on 11/14/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstNameUITextField: UITextField!
    @IBOutlet var lastNameUITextField: UITextField!
    @IBOutlet var ageUITextField: UITextField!
    @IBOutlet var ssnUITextField: UITextField!
    @IBOutlet var voteButton : UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewResultsSeque" {
            let results_vc = segue.destinationViewController as ViewResultsViewController
                    }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var user = PFObject(className: "user")
        
        var query = PFQuery(className: "user")
        var uID = UIDevice.currentDevice().identifierForVendor.UUIDString
        query.whereKey("ID", equalTo: uID)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                if objects.count > 0 {
                    user = objects[0] as PFObject
                    NSLog("Old user!")
                    if user["voted"] as Bool == true {
                        self.voteButton.enabled = false
                    }
                }
                else {
                    user["ID"] = uID
                    user["voted"] = false
                    user.save()
                    NSLog("New user!")
                }
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
        
        var testObject: PFObject = PFObject(className: "testObject")
        testObject["key"] = "value1"
        testObject.save()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

