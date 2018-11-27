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
    
    // Reload data when trasitioned between tab bar
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.badgesCollectionView.reloadData()
    }
    
    // Number Of Items in Section   (Data Source)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let badgesCount = AppData.shared.user.badges.count
        
        // Add call to action label if is empty and remove if its not
        if (badgesCount == 0){
            
            for subview in view.subviews{
                if subview.isKind(of: UILabel.self){
                    view.removeConstraints(subview.constraints)
                    subview.removeFromSuperview()
                }
            }
            
            let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0.8*self.view.frame.width, height: 100))
            label.textColor = .white
            label.numberOfLines = 2
            label.textAlignment = NSTextAlignment.center
            label.text = "Descubra curiosidades para ganhar medalhas!"
            label.center = self.view.center

//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            label.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(label)
            
            self.view.addConstraints([NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 0.8*self.view.frame.width),
                                      NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 64),
                                      NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
                                      NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)])
        } else {
            for subview in view.subviews{
                if subview.isKind(of: UILabel.self){
                    view.removeConstraints(subview.constraints)
                    subview.removeFromSuperview()
                }
            }
        }
        
        return badgesCount
    }
    
    // Cell For Item At   (Data Source)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BadgesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeCell", for: indexPath) as! BadgesCollectionViewCell
       
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.badgeImage.image = AppData.shared.user.badges[indexPath.row].image
        // como aqui são ícones não precisa, mais indicado pra as fotos
//        cell.badgeImage.layer.cornerRadius = 100
//        cell.badgeImage.layer.masksToBounds = true
        cell.badgeName.text = AppData.shared.user.badges[indexPath.row].name
        
        
        return cell
    }
    
    
    // Did Select Item At   (Delegate)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pop up explicando como a badge foi ganha ou algo do tipo
        iconBadgePopUp.image = AppData.shared.user.badges[indexPath.row].image
        nameBadgePopUp.text = AppData.shared.user.badges[indexPath.row].name
        textBadgePopUp.text = AppData.shared.user.badges[indexPath.row].description
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
