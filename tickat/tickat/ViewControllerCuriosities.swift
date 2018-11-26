//
//  ViewControllerCuriosities.swift
//  tickat
//
//  Created by Lucas Cardoso on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerCuriosities: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var curiositiesTableView: UITableView!
    
    //outlets do popup
    @IBOutlet weak var longDescriptionCuriosityPopUp: UITextView!
    @IBOutlet var popUpCuriosities: UIView!
    @IBOutlet weak var imageCuriosityPopUp: UIImageView!
    @IBOutlet weak var titleCuriosityPopUp: UILabel!
    //@IBOutlet weak var longDescriptionCuriosityPopUp: UILabel!
    @IBAction func dismissPopUp(_ sender: Any) {
        dismissPopUp(popUp: popUpCuriosities)
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curiositiesTableView.delegate = self
        curiositiesTableView.dataSource = self
    }
    
    // Vê a quantidade de itens na TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shared.userTeste.unblockedCuriosities.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
    
    
    // Preenche os campos com as informações
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell:CuriositiesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "curiositiesCell", for: indexPath) as! CuriositiesTableViewCell
        
        tableCell.curiosityTitle?.text = AppData.shared.userTeste.unblockedCuriosities[indexPath.row].title
        tableCell.curiosityText?.text = AppData.shared.userTeste.unblockedCuriosities[indexPath.row].shortDescription
        self.curiositiesTableView.separatorStyle = .none
        tableCell.curiositiesContentView.layer.cornerRadius = 20
        tableCell.curiositiesContentView.layer.masksToBounds = true
        
        return tableCell
    }
    
    // pra quando toca numa célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageCuriosityPopUp.image = AppData.shared.userTeste.unblockedCuriosities[indexPath.row].images[0]
        titleCuriosityPopUp.text = AppData.shared.userTeste.unblockedCuriosities[indexPath.row].title
        longDescriptionCuriosityPopUp.text = AppData.shared.userTeste.unblockedCuriosities[indexPath.row].longDescription
        openPopUp(popUp: popUpCuriosities)
    }
    
    
    
    
    // popUp
    func openPopUp(popUp: UIView) {
        //popUp.bounds.width = self.view.bounds.width
        //popUp.bounds.height = self.view.bounds.height
        // popUp.sizeThatFits(self.view!.frame)
        //  bgColorView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
//        popUp.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 50, height: self.view.frame.height - 50)
        popUp.layer.cornerRadius = 20
        popUp.layer.masksToBounds = true

        // popUp.frame = self.view.frame
        popUp.center = self.view.center
        // openBlur()
        // self.view.isUserInteractionEnabled = false
        
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
        
        popUp.transform = CGAffineTransform(scaleX: 0, y: 0)
        blurEffectView.transform = CGAffineTransform(scaleX: 0, y: 0)

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
