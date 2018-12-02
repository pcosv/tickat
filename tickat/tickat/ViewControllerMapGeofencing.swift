//
//  ViewControllerMapGeofencing.swift
//  tickat
//
//  Created by Paula Vaz on 01/12/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import UserNotifications
import WatchConnectivity

extension ViewControllerMap{
    
    // helper method that returns a CLCircularRegion from a given Geotification object
    func region(withGeotification geotification: Geotification) -> CLCircularRegion {
        
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            // Make sure region monitoring is supported.
            if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
                // Register the region.
                let region = CLCircularRegion(center: geotification.coordinate,
                                              radius: geotification.radius, identifier: geotification.identifier)
                region.notifyOnEntry = true
                region.notifyOnExit = false
            }
        }
        
        // initialize a CLCircularRegion with the location of the geofence, the radius of the geofence and an identifier that allows iOS to distinguish between the registered geofences of a given app
        let region = CLCircularRegion(center: geotification.coordinate, radius: geotification.radius, identifier: geotification.identifier)
        // These flags specify whether geofence events will be triggered when the device enters and leaves the defined geofence, respectively
        print("infos da region criada")
        print(region.center)
        print(region.radius)
        region.notifyOnEntry = (geotification.eventType == .onEntry)
        region.notifyOnExit = !region.notifyOnEntry
        return region
    }
    
    // method to start monitoring a given geotification whenever the user adds one.
    func startMonitoring(geotification: Geotification) {
        // determines if the device has the required hardware to support the monitoring of geofences
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
            return
        }
        // check the authorization status to ensure that the app has also been granted the required permission to use Location Services
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            showAlert(withTitle:"Warning", message: "Your geotification is saved but will only be activated once you grant Geotify permission to access the device location.")
        }
        // create a CLCircularRegion instance from the given geotification using the helper method you defined earlier
        let region = self.region(withGeotification: geotification)
        // register the CLCircularRegion instance with Core Location for monitoring
        locationManager.startMonitoring(for: region)
    }
    
    // method to stop monitoring a given geotification when the user removes it from the app
    // QUANDO O USUÁRIO DESCOBRIR UMA NOVA HISTÓRIA, ESSE MÉTODO DEVE SER CHAMADO PARA PARAR DE MONITORAR
    func stopMonitoring(geotification: Geotification) {
        for region in locationManager.monitoredRegions {
            guard let circularRegion = region as? CLCircularRegion, circularRegion.identifier == geotification.identifier else { continue }
            locationManager.stopMonitoring(for: circularRegion)
        }
    }
    
    // add a geotification
    func addGeotification(geotification: Geotification) {
        geotifications.append(geotification)
        addRadiusOverlay(forGeotification: geotification)
        // add a call to startMonitoringGeotification(_:) to ensure that the geofence associated with the newly-added geotification is registered with Core Location for monitoring
        startMonitoring(geotification: geotification)
    }
    
    func remove(geotification: Geotification) {
        
        if let indexInArray = geotifications.index(of: geotification) {
            geotifications.remove(at: indexInArray)
        }
        removeRadiusOverlay(forGeotification: geotification)
        stopMonitoring(geotification: geotification)
        
    }
    
    // draw the circle around location
    func addRadiusOverlay(forGeotification geotification: Geotification) {
        map?.addOverlay(MKCircle(center: geotification.coordinate, radius: geotification.radius))
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let circelOverLay = overlay as? MKCircle else {return MKOverlayRenderer()}
        
        let circleRenderer = MKCircleRenderer(circle: circelOverLay)
        circleRenderer.strokeColor = .blue
        circleRenderer.fillColor = .blue
        circleRenderer.alpha = 0.2
        return circleRenderer
    }

    // apaga o raio ao redor da location
    func removeRadiusOverlay(forGeotification geotification: Geotification) {
        // Find exactly one overlay which has the same coordinates & radius to remove
        guard let overlays = map?.overlays else { return }
        for overlay in overlays {
            guard let circleOverlay = overlay as? MKCircle else { continue }
            let coord = circleOverlay.coordinate
            if coord.latitude == geotification.coordinate.latitude && coord.longitude == geotification.coordinate.longitude && circleOverlay.radius == geotification.radius {
                map?.removeOverlay(circleOverlay)
                break
            }
        }
    }
    
    

 
}
