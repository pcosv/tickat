//
//  LocationView.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 14/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import MapKit

class LocationMarkerView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
//            self.isEnabled = false
            guard let location = newValue as? Location else { return }
            //markerTintColor = location.markerTintColor
            
            if let imageName = location.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
        }
    }
}
