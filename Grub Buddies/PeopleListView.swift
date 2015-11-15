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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableCell = UITableViewCell()
        tableCell.textLabel!.text = "First Person"
        tableCell.textLabel!.textColor = UIColorFromRGB(0xF8AC45)
        let image : UIImage = (UIImage(named: "steve"))!
        tableCell.imageView!.image = image
        tableCell.backgroundColor = UIColorFromRGB(0x003849)
        tableCell.alpha = 0.5
        return tableCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.sendSubviewToBack(tableView.viewWithTag(100)!)
        return 5
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentPerson = "First Person"
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColorFromRGB(0xEF3925)
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
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColorFromRGB(0x003849)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: {})
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}