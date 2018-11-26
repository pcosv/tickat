//
//  InterfaceController.swift
//  tickat WatchKit Extension
//
//  Created by Paula Vaz on 06/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import MapKit



class InterfaceController: WKInterfaceController, WCSessionDelegate, CLLocationManagerDelegate {
    var connectivitySession: WCSession!
    // @IBOutlet weak var labelText: WKInterfaceLabel!
    @IBOutlet weak var map: WKInterfaceMap!
    var locationManager = CLLocationManager()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //mapview setup to show user location
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        map.setRegion(MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(exactly: 50)!, longitudeDelta: CLLocationDegrees(exactly: 50)!)))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            self.connectivitySession = WCSession.default
            self.connectivitySession.delegate = self
            self.connectivitySession.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        // self.labelText.setText(applicationContext["title"] as! String)
    }
}
