//
//  Artwork.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 13/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation

// criando location de acordo com os parâmetros de NSObject e MKAnnotation pra criar o pontinho no mapa

import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
