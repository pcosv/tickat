//
//  Location.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 08/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
// import UIKit  // não precisa do UiKit aqui, nas outras precisa pra poder usar UIImage
import MapKit // pra poder usar CLLocation

class Location: NSObject, MKAnnotation {
    var isBlocked: Bool = true // inicializada pra poder criar um init sem ela
    var title: String?
    var curiosity: Curiosity
    var coordinate: CLLocationCoordinate2D // essa classe é da biblioteca do MapKit
    
    
    // init completo
    init(isBlocked: Bool, title: String, curiosity: Curiosity, coordinate: CLLocationCoordinate2D) {
        self.isBlocked = isBlocked
        self.title = title
        self.curiosity = curiosity
        self.coordinate = coordinate
    }
    
    // init sem o isBlocked
    // (assumindo que toda location é bloqueada por default)
    // se não for, usar o init completo
    init(name: String, curiosity: Curiosity, coordinate: CLLocationCoordinate2D) {
        self.title = name
        self.curiosity = curiosity
        self.coordinate = coordinate
    }
    
    
    // atualizar localizações para elas não estarem mais bloqueadas quando o user chegar perto
    func updateLocation() {
        self.isBlocked = false
    }
    
    // mudar cor dos trequinho
    var markerTintColor: UIColor {
        if isBlocked == true {
            return .black
        } else {
            return UIColor(displayP3Red: 255.0/255.0, green: 230.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        }
    }
    
    var imageName: String? {
        if isBlocked { return "locked" }
        return "unlocked"
    }
}
