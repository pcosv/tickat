//
//  Location.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 08/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit

class Location {
    var isBlocked: Bool = true // inicializada pra poder criar um init sem ela
    var name: String
    var curiosity: Curiosity
    //var coordinates: CLLocation - esse negocio não existe ???????
    
    
    // init completo
    init(isBlocked: Bool, name: String, curiosity: Curiosity) {
        self.isBlocked = isBlocked
        self.name = name
        self.curiosity = curiosity
    }
    
    // init sem o isBlocked
    // (assumindo que toda location é bloqueada por default)
    // se não for, usar o init completo
    init(name: String, curiosity: Curiosity) {
        self.name = name
        self.curiosity = curiosity
    }
    
    
    // atualizar localizações para elas não estarem mais bloqueadas quando o user chegar perto
    func updateLocation() {
        self.isBlocked = false
    }
}
