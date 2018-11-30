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
    var crownAccumulator = 0.0
    var rotationMod = 1.0
    var deltaMap = 0.0004
    var initMap = 0.010
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        //mapview setup to show user location
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        map.setRegion(MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(exactly: initMap)!, longitudeDelta: CLLocationDegrees(exactly: initMap)!)))
        drawMap()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        crownSequencer.focus()
        
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
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locationManager.location
        }
        
        map.removeAllAnnotations()
        // show locations on map
        let allLocations = AppData.shared.allLocations.sorted(by: { (location1:Location, location2:Location) -> Bool in
            
            
            
            let location1CLLocation = CLLocation(latitude: location1.coordinate.latitude, longitude: location1.coordinate.longitude)
            let distance1 = currentLocation.distance(from: location1CLLocation)
            
            let location2CLLocation = CLLocation(latitude: location2.coordinate.latitude, longitude: location2.coordinate.longitude)
            let distance2 = currentLocation.distance(from: location2CLLocation)
            
            return distance1 < distance2
            })
        
        map.addAnnotation(currentLocation.coordinate, with: .red)
        
        for i in allLocations {
            if(i.isBlocked){
                map.addAnnotation(i.coordinate, withImageNamed: "locked", centerOffset: CGPoint(x: 0, y: 0))
            } else {
                map.addAnnotation(i.coordinate, withImageNamed: "unlocked", centerOffset: CGPoint(x: 0, y: 0))
            }
        }
    }
}
