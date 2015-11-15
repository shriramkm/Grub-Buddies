//
//  CheckinViewController.swift
//  Grub Buddies
//
//  Created by student on 11/14/15.
//  Copyright © 2015 2366Portlanders. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CheckinViewController : UIViewController,CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    var list = [String]()
    var mutex:pthread_mutex_t!
    let queue = NSOperationQueue()
    
    override func viewDidLoad() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "checkinSegue"{
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = "Restaurant"
            print(locationManager.location)
            request.region = MKCoordinateRegionMakeWithDistance((locationManager.location?.coordinate)!, 200, 200)
            
            let search = MKLocalSearch(request: request)
            
            queue.addOperationWithBlock(){
                search.startWithCompletionHandler({(response: MKLocalSearchResponse?,
                    error: NSError?) in
                    
                    if error != nil {
                        print("Error occured in search: \(error!.localizedDescription)")
                    } else if response!.mapItems.count == 0 {
                        print("No matches found")
                    } else {
                        print("Matches found")
                        
                        for item in response!.mapItems as! [MKMapItem] {
                            //print("Name = \(item.name)")
                            self.list.append(item.name!)
                            //print("Phone = \(item.phoneNumber)")
                        }
                        print(self.list)
                        var nearestLocationVC = segue.destinationViewController as! NearestLocationsController
                        nearestLocationVC.locations = self.list
                        
                    }
                })
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    print(self.list)
//                    var nearestLocationVC = segue.destinationViewController as! NearestLocationsController
//                    nearestLocationVC.locations = self.list
                }
            }
        }
    }
}