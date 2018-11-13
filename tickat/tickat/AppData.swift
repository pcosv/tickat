//
//  AppData.swift
//  tickat
//
//  Created by Lucas Cardoso on 12/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit
import CoreLocation

// Mediadora - dados do app
// pra usar as variáveis, acessar por:   AppData.shared.variável
struct AppData {
    
    // usuário do app
    var user = User(id: "User")
    
    // usuário fake pra teste
    var userTeste = User(id: "User Teste",
                         unblockedCuriosities: [Curiosity(isBlocked: false, title: "local", shortDescription: "curta", longDescription: "longa", images: [UIImage(named: "check-box-empty")!])],
                         badges: [Badge(name: "Primeira Descoberta!",
                                        image: UIImage(named: "check-box-empty")!,
                                        curiositiesNeeded: 1),
                                  Badge(name: "Andarilho",
                                        image: UIImage(named: "check-box-empty")!,
                                        curiositiesNeeded: 5),
                                  Badge(name: "Varzeano",
                                        image: UIImage(named: "check-box-empty")!,
                                        curiositiesNeeded: 10),
                                  Badge(name: "Recifense",
                                        image: UIImage(named: "check-box-empty")!,
                                        curiositiesNeeded: 15)] )
    
    var allLocations: [Location] = [Location(isBlocked: true,
                                             name: "Praça da Várzea",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Praça da Várzea",
                                                                  shortDescription: "Essa praça rotineira quase recebeu um tapa no visual por Burle Marx, em 1936!",
                                                                  longDescription: "Todo mundo que passa pela Praça Pinto Dâmaso nem imagina que, no passado, o paisagista Burle Marx fez um projeto pra ajardinar, colocar um playground, lago central e muita sombra - com mangueiras, oiti-da-praia, e palmeiras. A ideia dele era que virasse um ambiente massa pra galera se encontrar, mas infelizmente não foi executada completamente. Porém, se tu parar pra olhar, a praça tem traços do projeto, começando pelas palmeiras imperiais.",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.048835, longitude: -34.959437))]
    
    var allBlockedBadges: [Badge] = [Badge(name: "Primeira Descoberta!",
                                           image: UIImage(named: "check-box-empty")!,
                                           curiositiesNeeded: 1),
                                     Badge(name: "Andarilho",
                                           image: UIImage(named: "check-box-empty")!,
                                           curiositiesNeeded: 5),
                                     Badge(name: "Varzeano",
                                           image: UIImage(named: "check-box-empty")!,
                                           curiositiesNeeded: 10),
                                     Badge(name: "Recifense",
                                           image: UIImage(named: "check-box-empty")!,
                                           curiositiesNeeded: 15)]
    
    
    static var shared = AppData()
}

