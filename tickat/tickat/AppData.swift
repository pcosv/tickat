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
                                             coordinates: CLLocation(latitude: -8.048835, longitude: -34.959437)),
                                    Location(isBlocked: true,
                                             name: "Biblioteca José Antônio Gonsalves de Mello",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Biblioteca José Antônio Gonsalves de Mello",
                                                                  shortDescription: "Por aqui, no Instituto Ricardo Brennand, existe o paraíso da literatura, livre para todos!",
                                                                  longDescription: "Para os apaixonados por artes e história, esse é o lugar, visse? Aqui é cheio de livros, documentos, postais, partituras e discos de vinil, fora as obras raras. Tipo, o livro mais antigo da biblioteca tem cerca de 453 anos! Também, tu encontra coleções especiais de Gilberto Freyre, Fernando Pessoa e Ruy Barbosa. O nome é por causa do centenário historiador José Antônio, que foi um cara estudioso que só sobre o Brasil Holandês.",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.055340, longitude: -34.959053)),
                                    Location(isBlocked: true,
                                             name: "Centro de Estudos Budistas Bodisatva",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Centro de Estudos Budistas Bodisatva",
                                                                  shortDescription: "Aqui, funciona o principal ponto de meditação da Várzea!",
                                                                  longDescription: "O CEBB foi fundado nos anos 80, pelo Lama Padma Samten, e atua em várias cidades brasileiras. As atividades são voltadas ao estudo do livro “Meditando a vida”, tanto pra veteranos e calouros. Em Recife, a unidade da Várzea foi inaugurada em 2017, porque descobriram que existe um grande grupo na Zona Oeste interessado pelas práticas budistas, e não iam para os encontros em outros bairros porque é uma complicação da moléstia se mover pra outras zonas no trânsito dessa cidade, né?!",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.048496, longitude: -34.958206)),
                                    Location(isBlocked: true,
                                             name: "O eterno príncipe do brega",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "O eterno príncipe do brega",
                                                                  shortDescription: "Aqui, no bar Terraço Falcão, foi prestada uma homenagem póstuma ao Lenilson Braga.",
                                                                  longDescription: "Lenilson Braga, mais conhecido como o príncipe do brega, foi um homem apaixonado por música romântica, e com sua calça boca-de-sino, fazia a cena cultural do bairro acontecer em um palco de alvenaria - ele realizou um monte de encontros pros artistas compartilharem suas composições! Apoiou e estimulou seu filho, que agora é líder da banda forrozeira Varzeanos. O bairro se despediu do príncipe no dia 31 de outubro de 2017, em um cortejo até o Cemitério da Várzea.",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.049530, longitude: -34.957576)),
                                    Location(isBlocked: true,
                                             name: "Templo de Genézio Gomes",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Templo de Genézio Gomes",
                                                                  shortDescription: "Estátuas guardam esse terreno, onde mora o famoso escultor varzeano.",
                                                                  longDescription: "Natural de Bom Jardim e desde pequenino apaixonado pelas pinturas de Michelangelo, Genézio conseguiu tornar realidade o seu desejo de viver pela arte e construir, desde 1998, seu ateliê/templo - também sendo sua casa e galeria! Suas peças estão espalhadas pelo Brasil, e olha, ele dá aulas lá pra quem quiser deixar a criatividade fluir pelas mãos e pela argila.",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.028893, longitude: -34.953968)),
                                    Location(isBlocked: true,
                                             name: "Cachoeira e Boi da Mata",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Cachoeira e Boi da Mata",
                                                                  shortDescription: "A galera do Boi da Mata se reúne aqui pra ir à cachoeira da Várzea!",
                                                                  longDescription: "No terceiro sábados de todo mês, o coletivo artístico e ecopedagógico Boi da Mata se junta e vai por uma trilha até a cachoeira da Várzea, numa tradição, desde 2010. A brincadeira é pra fazer a galera interagir entre si e com a natureza, valorizando a cultura popular num ambiente saudável! Começa bem cedo ó, às 9h, e ao longo do dia tem banho de cachoeira, almoço com feijoada vegana e feirinha.",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.036291, longitude: -34.975185)),
                                    Location(isBlocked: true,
                                             name: "Casarão da Várzea",
                                             curiosity: Curiosity(isBlocked: true,
                                                                  title: "Casarão da Várzea",
                                                                  shortDescription: "O Casarão está em ruínas, aguardando restauração…",
                                                                  longDescription: "Antigamente, aqui era o Hospital Magitot, o principal centro odontológico dos anos 40. A arquitetura tinha umas pinceladas inglesas, bem chiques. Fechou em 1960, e hoje está num estado precário, o bichin, mesmo sendo considerado imóvel especial de preservação. Os vendedores que estão ao redor lutam pra que ali vire um centro de comércio informal que possa abrigá-los. Pense num lugar com potencial desperdiçado...",
                                                                  images: [UIImage(named: "check-box-empty")!]),
                                             coordinates: CLLocation(latitude: -8.048480, longitude: -34.958998))]
    
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

