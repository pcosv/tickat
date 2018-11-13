//
//  ViewControllerBadges.swift
//  tickat
//
//  Created by Lucas Cardoso on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit

class ViewControllerBadges: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var badgesCollectionView: UICollectionView!
    @IBOutlet weak var badgesLabel: UILabel!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badgesCollectionView.dataSource = self
        badgesCollectionView.delegate = self
    }
    
    
    
    // Number Of Items in Section   (Data Source)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.shared.userTeste.badges.count  // quantidade de badges desbloqueadas do usuário
    }
    
    // Cell For Item At   (Data Source)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BadgesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeCell", for: indexPath) as! BadgesCollectionViewCell
       
        cell.backgroundView?.layer.cornerRadius = 20
        cell.badgeImage.image = AppData.shared.userTeste.badges[indexPath.row].image
// como aqui são ícones não precisa, mais indicado pra as fotos
        //        cell.badgeImage.layer.cornerRadius = 100
//        cell.badgeImage.layer.masksToBounds = true
        cell.badgeName.text = AppData.shared.userTeste.badges[indexPath.row].name
        
        
        return cell
    }
    
    
    // Did Select Item At   (Delegate)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // abrir um pop up explicando como a badge foi ganha?
    }
    
}
