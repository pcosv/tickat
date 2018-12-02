//
//  Geotification.swift
//  tickat
//
//  Created by Paula Vaz on 30/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct GeoKey {
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let radius = "radius"
    static let identifier = "identifier"
    static let eventType = "eventTYpe"
}

enum EventType: String {
    case onEntry = "On Entry"
    case onExit = "On Exit"
}

class Geotification: NSObject, NSCoding, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var radius: CLLocationDistance
    var identifier: String
    var eventType: EventType
    
    
    init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String, eventType: EventType) {
        self.coordinate = coordinate
        self.radius = radius
        self.identifier = identifier
        self.eventType = eventType
    }
    
    // MARK: NSCoding
    required init?(coder decoder: NSCoder) {
        let latitude = decoder.decodeDouble(forKey: GeoKey.latitude)
        let longitude = decoder.decodeDouble(forKey: GeoKey.longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        radius = decoder.decodeDouble(forKey: GeoKey.radius)
        identifier = decoder.decodeObject(forKey: GeoKey.identifier) as! String
        eventType = EventType(rawValue: decoder.decodeObject(forKey: GeoKey.eventType) as! String)!
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(coordinate.latitude, forKey: GeoKey.latitude)
        coder.encode(coordinate.longitude, forKey: GeoKey.longitude)
        coder.encode(radius, forKey: GeoKey.radius)
        coder.encode(identifier, forKey: GeoKey.identifier)
        coder.encode(eventType.rawValue, forKey: GeoKey.eventType)
    }
    
}
