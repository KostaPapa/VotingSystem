//
//  VoteViewController.swift
//  votingsystem
//
//  Created by Kosta on 11/18/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {
    
    let candidate1 = "BFFA59EhUG"
    let candidate2 = "HOBg0u6UEv"
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstCandidateSegue" {
            let results_vc = segue.destinationViewController as ViewResultsViewController
            var query = PFQuery(className: "Candidate")
            query.getObjectInBackgroundWithId(candidate1) {
                (test: PFObject!, error: NSError!) -> Void in
                if error == nil {
                    NSLog("%@", test)
                    var currentVotes = test["votes"] as Int
                    currentVotes++
                    test["votes"] = currentVotes
                    test.save()
                    var query2 = PFQuery(className: "user")
                    query2.whereKey("ID", equalTo: UIDevice.currentDevice().identifierForVendor.UUIDString)
                    query2.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            var user = objects[0] as PFObject
                            user["voted"] = true
                            user.save()
                        }
                    }

                } else {
                    NSLog("%@", error)
                }
            }
        }
        if segue.identifier == "secondCandidateSegue" {
            let results_vc = segue.destinationViewController as ViewResultsViewController
            var query = PFQuery(className: "Candidate")
            query.getObjectInBackgroundWithId(candidate2) {
                (test: PFObject!, error: NSError!) -> Void in
                if error == nil {
                    NSLog("%@", test)
                    var currentVotes = test["votes"] as Int
                    currentVotes++
                    test["votes"] = currentVotes
                    test.save()
                    var query2 = PFQuery(className: "user")
                    query2.whereKey("ID", equalTo: UIDevice.currentDevice().identifierForVendor.UUIDString)
                    query2.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            var user = objects[0] as PFObject
                            user["voted"] = true
                            user.save()
                        }
                    }
                } else {
                    NSLog("%@", error)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
