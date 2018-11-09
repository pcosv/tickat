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

    
    // adiciona nova curiosidade desbloqueada ao perfil do user
    func addCuriosity(newCuriosity: Curiosity) {
        self.unblockedCuriosities.append(newCuriosity)
    }
    
    
    // chamar a func unlockBadge na classe Badge
    func checkForBadges() {
        // precisa do banco de dados das badges
        for badge in allBlockedBadges {
            if unblockedCuriosities.count == badge.curiositiesNeeded {
                badge.unblockBadge()
                addBadge(newBadge: badge)
                break
            }
        }
    }
    
    
    // adiciona nova badge desbloqueada ao perfil do user
    func addBadge(newBadge: Badge) {
        self.badges.append(newBadge)
    }
}


// [PROVISORIO] banco de dados das badges
var allBlockedBadges: [Badge] = [Badge(name: "Varzeano", image: UIImage(named: "")!, curiositiesNeeded: 5),
                                 Badge(name: "Recifense", image: UIImage(named: "")!, curiositiesNeeded: 15)]
