//
//  Curiosity.swift
//  tickat
//
//  Created by Camila Simões on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit

class Curiosity {
    var isBlocked: Bool = true // inicializada pra poder criar um init sem ela
    var title: String // Modificado para se poder vizualizar o nome do local acessando as curiosidades
    var shortDescription: String
    var longDescription: String
    var images: [UIImage]
    
    
    // init completo
    init(isBlocked: Bool, title: String, shortDescription: String, longDescription: String, images: [UIImage]) {
        self.isBlocked = isBlocked
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.images = images
    }
    
    // init sem o isBlocked
    // (assumindo que toda curiosidade criada vem bloqueada por default)
    // se não for, usar o init completo
    init(title: String, shortDescription: String, longDescription: String, images: [UIImage]) {
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.images = images
    }
    
    
    // desbloquear curiosidades ao chegar no raio de desbloqueio
    // chamada pela checkForProximity() no ViewControllerMap
    func unblockCuriosity() {
        self.isBlocked = false
    }
   
}
