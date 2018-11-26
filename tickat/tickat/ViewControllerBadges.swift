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
       
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
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
        
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            view.insertSubview(blurEffectView, at: 1)
        } else {
            view.backgroundColor = .black
        }
        
        view.insertSubview(popUp, at: 2)
        
        blurEffectView.transform = CGAffineTransform(scaleX: 0, y: 0)
        popUp.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            popUp.alpha = 1.0;
            blurEffectView.alpha = 1.0;
            popUp.transform = .identity
            blurEffectView.transform = .identity
        }, completion: nil)
      
    }
    
    
    func dismissPopUp(popUp:UIView) {
        view.subviews[1].removeFromSuperview()
        popUp.removeFromSuperview()
        // closeBlur()

    }
    
   
    
    
    
}
