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
    
    var blockedCuriosities:[Curiosity] = [Curiosity(isBlocked: false, shortDescription: "aa", longDescription: "AAA", images: [UIImage(cgImage: CGRect(x: 0, y: 0, width: 100, height: 100) as! CGImage)]), Curiosity(isBlocked: false, shortDescription: "bb", longDescription: "BBB", images: [UIImage(cgImage: CGRect(x: 0, y: 0, width: 100, height: 100) as! CGImage)])]
    
    var allBlockedBadges: [Badge] = [Badge(name: "Varzeano", image: UIImage(named: "")!, curiositiesNeeded: 5),
                                     Badge(name: "Recifense", image: UIImage(named: "")!, curiositiesNeeded: 15)]
    
    static var shared = AppData()
}
