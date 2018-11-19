//
//  LocationView.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 14/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import MapKit

class LocationMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let location = newValue as? Location else { return }
            markerTintColor = location.markerTintColor
        }
    }
}