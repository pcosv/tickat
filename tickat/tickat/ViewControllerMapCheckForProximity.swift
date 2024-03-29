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
        let locManager = CLLocationManager()
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            //print(currentLocation.coordinate.latitude)
            //print(currentLocation.coordinate.longitude)
        }
        
        // varre o array verificando e desbloqueia o local e a curiosidade associada
        for i in AppData.shared.allLocations{
            if i.isBlocked{
                //print(i.isBlocked)
                let aux = CLLocation(latitude: i.coordinate.latitude, longitude: i.coordinate.longitude)
                
                let distanceInMeters = currentLocation.distance(from: aux) // result is in meters
                //print(distanceInMeters)
                if distanceInMeters <= 40 {
                    i.isBlocked = false
                    i.curiosity.unblockCuriosity()
                    AppData.shared.user.addCuriosity(newCuriosity: i.curiosity)
                    for j in AppData.shared.allBlockedBadges{
                        print(j.location)
                        if (j.isBlocked){
                            if j.location == i.title! {
                                j.unblockBadge()
                                AppData.shared.user.addBadge(newBadge: j)
                            }
                        }
                    }
                    
                    map.removeAnnotations(map.annotations)
                    self.drawMap()
                    notifyUser(curiosity: i.curiosity)
                }
            }
        }
    }
}
