//
//  AppData.swift
//  tickat
//
//  Created by Lucas Cardoso on 12/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit

// Mediadora - dados do app
// pra usar as variáveis, acessar por:   AppData.shared.variável
struct AppData {
    var user = User(id: "User")
    
    var blockedCuriosities:[Curiosity] = [Curiosity(isBlocked: false, shortDescription: "aa", longDescription: "AAA", images: [UIImage(named: "check-box-empty")!]), Curiosity(isBlocked: false, shortDescription: "bb", longDescription: "BBB", images: [UIImage(named: "check-box-empty")!])]
    
    var allBlockedBadges: [Badge] = [Badge(name: "Varzeano", image: UIImage(named: "check-box-empty")!, curiositiesNeeded: 5),
                                     Badge(name: "Recifense", image: UIImage(named: "check-box-empty")!, curiositiesNeeded: 15)]
    
    static var shared = AppData()
}
