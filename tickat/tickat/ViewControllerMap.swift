//
//  ViewControllerMap.swift
//  tickat
//
//  Created by Lucas Cardoso on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import UserNotifications
import WatchConnectivity


class ViewControllerMap: UIViewController, CLLocationManagerDelegate, UNUserNotificationCenterDelegate, WCSessionDelegate {

    @IBOutlet weak var map: MKMapView!
    var connectivitySession: WCSession!
    
    var locationManager:CLLocationManager!
    
    @IBOutlet var popUpCallToAction: UIView!
    
    override func viewDidLoad() {
        drawMap()
        registerForNotifications()
        if WCSession.isSupported() {
            self.connectivitySession = WCSession.default
            self.connectivitySession.delegate = self
            self.connectivitySession.activate()
        }
        
        map.register(LocationMarkerView.self,
                     forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        
        //mapview setup to show user location
        map.delegate = self
        map.showsUserLocation = true
        map.mapType = MKMapType(rawValue: 0)!
        map.userTrackingMode = MKUserTrackingMode.follow
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        
        
        
        checkForProximity()
        let _:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        //print("user latitude = \(userLocation.coordinate.latitude)")
        //print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!){
        print("present location")
        print(newLocation.coordinate.latitude)
        print(newLocation.coordinate.longitude)
        
    }
    
    // esta função será responsável por plotar as Locations na tela
    func drawMap() {
        // show location on map
        for i in AppData.shared.allLocations {
            map.addAnnotation(i)
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func sendInformationToWatch(curiosity: Curiosity){
        do {
            try self.connectivitySession.updateApplicationContext(["title":curiosity])
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        view.subviews[1].removeFromSuperview()
        popUpCallToAction.removeFromSuperview()
    }
    
    // método que recentraliza mapa
    @IBAction func zoomToCurrentLocation(sender: AnyObject) {
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        self.map.setRegion(region, animated: true)
    }
}
