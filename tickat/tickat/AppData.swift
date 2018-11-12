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
    
    // usuário do app
    var user = User(id: "User")
    
    // usuário fake pra teste
//    var userTeste = User(id: "User Teste",
//                         unblockedCuriosities: [Curiosity(isBlocked: false, shortDescription: "curta", longDescription: "longa", images: [UIImage(named: "check-box-empty")!])],
//                         badges: [Badge(isBlocked: false, name: "badge teste", image: UIImage(named: "check-box-empty")!, curiositiesNeeded: 1)])
    
    
    var blockedCuriosities:[Curiosity] = [Curiosity(isBlocked: true, shortDescription: "aa", longDescription: "AAA", images: [UIImage(named: "check-box-empty")!]), Curiosity(isBlocked: true, shortDescription: "bb", longDescription: "BBB", images: [UIImage(named: "check-box-empty")!])]
    
    var allBlockedBadges: [Badge] = [Badge(name: "Varzeano", image: UIImage(named: "check-box-empty")!, curiositiesNeeded: 5),
                                     Badge(name: "Recifense", image: UIImage(named: "check-box-empty")!, curiositiesNeeded: 15)]
    
    static var shared = AppData()
}
