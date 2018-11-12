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
        //
    }
    
    
    
    // Number Of Items in Section   (Data Source)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.shared.user.badges.count  // quantidade de badges desbloqueadas do usuário
    }
    
    // Cell For Item At   (Data Source)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BadgesCollectionViewCell = collectionView.cellForItem(at: indexPath) as! BadgesCollectionViewCell
       
        cell.badgeImage.image = AppData.shared.user.badges[indexPath.row].image
        cell.badgeName.text = AppData.shared.user.badges[indexPath.row].name
        
        return cell
    }
    
    
    // Did Select Item At   (Delegate)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // abrir um pop up explicando como a badge foi ganha?
    }
    
}
