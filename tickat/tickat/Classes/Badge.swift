//
//  Badge.swift
//  tickat
//
//  Created by Camila Simões on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit

class Badge {
    var isBlocked: Bool = true // inicializada pra poder criar um init sem ela
    var name: String
    var description: String
    var image: UIImage
    var curiositiesNeeded: Int
    var location: String
    
    
    // init completo
    init(isBlocked: Bool, name: String, description: String, image: UIImage, curiositiesNeeded: Int, location: String) {
        self.isBlocked = isBlocked
        self.name = name
        self.description = description
        self.image = image
        self.curiositiesNeeded = curiositiesNeeded
        self.location = location
    }
    
    // init sem o isBlocked
    // (assumindo que toda badge criada vem bloqueada por default)
    // se não for, usar o init completo
    init(name: String, description: String, image: UIImage, curiositiesNeeded: Int, location: String) {
        self.name = name
        self.description = description
        self.image = image
        self.curiositiesNeeded = curiositiesNeeded
        self.location = location
    }
    
    
    // desbloquear curiosidades ao chegar no raio de desbloqueio
    // chamada pela checkForBadges() na classe User
    func unblockBadge() {
        self.isBlocked = false
    }
}
