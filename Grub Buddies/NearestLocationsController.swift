//
//  NearestLocationsController.swift
//  Grub Buddies
//
//  Created by student on 11/14/15.
//  Copyright © 2015 2366Portlanders. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class NearestLocationsController: UITableViewController, CLLocationManagerDelegate {
    var locations:[String]!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = locations[indexPath.row]
        return cell
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if unwindSegue.identifier == "checkinSegue"{
            print(locations)
        }
    }
}