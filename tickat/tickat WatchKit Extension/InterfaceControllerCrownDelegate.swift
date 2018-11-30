//
//  InterfaceControllerCrownDelegate.swift
//  tickat WatchKit Extension
//
//  Created by Lucas Cardoso on 30/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import MapKit

extension InterfaceController: WKCrownDelegate{
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        crownAccumulator += rotationalDelta
        if crownAccumulator > 0.1 {
            initMap += deltaMap
            crownAccumulator = 0.0
        } else if crownAccumulator < -0.1 {
            initMap -= deltaMap
            crownAccumulator = 0.0
        }
        
        if initMap <= 0 {
            initMap = deltaMap
        }
        
        map.setRegion(MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(exactly: initMap)!, longitudeDelta: CLLocationDegrees(exactly: initMap)!)))
    }
}
