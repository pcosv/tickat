//
//  ViewControllerMapCheckForProximity.swift
//  tickat
//
//  Created by Paula Vaz on 12/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import CoreLocation

extension ViewControllerMap{
    
    func checkForProximity() {
        var locManager = CLLocationManager()
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
        }
        
    }
}
