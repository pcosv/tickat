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
 
    
    // PopUp da Badge
    @IBOutlet var popUpBadge: UIView!
    @IBOutlet weak var iconBadgePopUp: UIImageView!
    @IBOutlet weak var nameBadgePopUp: UILabel!
    @IBOutlet weak var textBadgePopUp: UILabel!
    @IBAction func closeBadgePopUp(_ sender: Any) {
        dismissPopUp(popUp: popUpBadge)
    }
    
    
    
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
        // cell.badgeImage.layer.cornerRadius = 100
        // cell.badgeImage.layer.masksToBounds = true
        cell.badgeName.text = AppData.shared.userTeste.badges[indexPath.row].name
        
        
        return cell
    }
    
    
    // Did Select Item At   (Delegate)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pop up explicando como a badge foi ganha ou algo do tipo
        iconBadgePopUp.image = AppData.shared.userTeste.badges[indexPath.row].image
        nameBadgePopUp.text = AppData.shared.userTeste.badges[indexPath.row].name
        textBadgePopUp.text = AppData.shared.userTeste.badges[indexPath.row].description
        openPopUp(popUp: popUpBadge)
    }
    
    
    
    
    // popUp
    func openPopUp(popUp: UIView) {
        popUp.layer.cornerRadius = 20
        popUp.layer.masksToBounds = true
        popUp.center = self.view.center
        // openBlur()
        // self.view.isUserInteractionEnabled = false
        self.view.addSubview(popUp)
      
    }
    
    
    func dismissPopUp(popUp:UIView) {
        popUp.removeFromSuperview()
        // closeBlur()

    }
    
   
    
    
    
}
