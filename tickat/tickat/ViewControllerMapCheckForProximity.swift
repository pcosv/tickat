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
    
    // esta função pega a localização do dispositivo e compara com a de cada location do allLocations para desbloquear um novo local caso passe próximo a ele
    func checkForProximity() {
        var locManager = CLLocationManager()
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
            print(currentLocation.coordinate.latitude)
            print(currentLocation.coordinate.longitude)
        }
        
        // varre o array verificando e desbloqueia o local e a curiosidade associada
        for i in AppData.shared.allLocations{
            //print(i.isBlocked)
            if i.coordinates.coordinate.longitude == currentLocation.coordinate.longitude && i.coordinates.coordinate.latitude == currentLocation.coordinate.latitude{
                i.isBlocked = false
                //print(i.isBlocked)
                i.curiosity.unblockCuriosity()
            }
        }
    }
}
