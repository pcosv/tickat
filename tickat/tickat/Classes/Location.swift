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


// criando location de acordo com os parâmetros de NSObject e MKAnnotation pra criar o pontinho no mapa
class Location: NSObject, MKAnnotation {
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

//class Location {
//    var isBlocked: Bool = true // inicializada pra poder criar um init sem ela
//    var name: String
//    var curiosity: Curiosity
//    var coordinates: CLLocation // essa classe é da biblioteca do MapKit
//
//
//    // init completo
//    init(isBlocked: Bool, name: String, curiosity: Curiosity, coordinates: CLLocation) {
//        self.isBlocked = isBlocked
//        self.name = name
//        self.curiosity = curiosity
//        self.coordinates = coordinates
//    }
//
//    // init sem o isBlocked
//    // (assumindo que toda location é bloqueada por default)
//    // se não for, usar o init completo
//    init(name: String, curiosity: Curiosity, coordinates: CLLocation) {
//        self.name = name
//        self.curiosity = curiosity
//        self.coordinates = coordinates
//    }
//
//
//    // atualizar localizações para elas não estarem mais bloqueadas quando o user chegar perto
//    func updateLocation() {
//        self.isBlocked = false
//    }
//}
