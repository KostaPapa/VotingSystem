//
//  ViewResultsViewController.swift
//  votingsystem
//
//  Created by Kosta on 11/18/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import UIKit

class ViewResultsViewController: UIViewController {

    var candidate1 = "BFFA59EhUG"
    var candidate2 = "HOBg0u6UEv"
    
    @IBOutlet var candidate1Name : UILabel!
    @IBOutlet var candidate1Votes : UILabel!
    @IBOutlet var candidate2Name : UILabel!
    @IBOutlet var candidate2Votes : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var query = PFQuery(className: "Candidate")
        query.getObjectInBackgroundWithId(candidate1) {
            (test: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", test)
                var currentVotes = test["votes"] as Int
                
                test.save()
                self.candidate1Votes.text! = "\(currentVotes)"
                let name = test["name"] as String
                self.candidate1Name.text = name
            } else {
                NSLog("%@", error)
            }
        }
        var query2 = PFQuery(className: "Candidate")
        query2.getObjectInBackgroundWithId(candidate2) {
            (test: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", test)
                var currentVotes = test["votes"] as Int
                test.save()
                self.candidate2Votes.text! = "\(currentVotes)"
                let name = test["name"] as String
                self.candidate2Name.text = name
            } else {
                NSLog("%@", error)
            }
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
