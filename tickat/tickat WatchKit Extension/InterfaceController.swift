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
        map.setRegion(MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(exactly: 0.013)!, longitudeDelta: CLLocationDegrees(exactly: 0.013)!)))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        drawMap()
        
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
    
    func drawMap() {
        
        map.removeAllAnnotations()
        // show locations on map
        for i in AppData.shared.allLocations {
            if(i.isBlocked){
                map.addAnnotation(i.coordinate, withImageNamed: "locked", centerOffset: CGPoint(x: 0, y: 0))
            } else {
                map.addAnnotation(i.coordinate, withImageNamed: "unlocked", centerOffset: CGPoint(x: 0, y: 0))
            }
        }
    }
}
