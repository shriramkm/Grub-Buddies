//
//  File.swift
//  Grub Buddies
//
//  Created by student on 11/14/15.
//  Copyright © 2015 2366Portlanders. All rights reserved.
//

import Foundation
import UIKit

class PeopleListView: UITableViewController{
    var currentPerson : String?
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if unwindSegue.identifier == "checkInSegue"{
            print("Moved to People List")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableCell = UITableViewCell()
        tableCell.textLabel!.text = "First Person"
        let image : UIImage = (UIImage(named: "bg"))!
        tableCell.imageView!.image = image
        return tableCell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentPerson = "First Person"
        let ac = UIAlertController(title: "Introduce yourself!", message: "Leave a message for your Grub Buddy", preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        let introduceAction = UIAlertAction(title: "Introduce", style: .Default) { [unowned self, ac] (action: UIAlertAction!) in
            let intro = ac.textFields![0] as! UITextField
                print(intro.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { [unowned self, ac] (action: UIAlertAction!) in
            
        }
        
        ac.addAction(introduceAction)
        ac.addAction(cancelAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
}