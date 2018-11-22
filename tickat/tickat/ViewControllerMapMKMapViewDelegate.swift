//
//  ViewControllerMapMKMapViewDelegate.swift
//  tickat
//
//  Created by Lucas Cardoso on 22/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import MapKit

extension ViewControllerMap: MKMapViewDelegate{
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        var selectedLocation:Location? = nil
        
        for i in AppData.shared.allLocations{
            if i.title == view.annotation?.title{
                selectedLocation = i
            }
        }
        
        var selectedCuriosity = selectedLocation?.curiosity
        
        print("fihasvdhgjfajvsgf")
        
    }
}
