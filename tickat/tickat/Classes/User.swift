//
//  User.swift
//  tickat
//
//  Created by Anna Calheiros de Araújo on 08/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit

class User {
    var id: String
    var unblockedCuriosities: [Curiosity]
    var badges: [Badge]
    
    
    // init completo
    init(id: String, unblockedCuriosities: Curiosity, badges: Badge) {
        self.id = id
        self.unblockedCuriosities = [unblockedCuriosities]
        self.badges = [badges]
    }

    
    // adicionar curiosidades desbloqueadas ao perfil do user
    func addCuriosity() {
    }
    
    // chamar a func unlockBadge na classe Badge
    func checkForBadges() {
    }
    
    // adicionar badges desbloqueados ao perfil do user
    func addBadge() {
    }
}
