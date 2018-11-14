//
//  ViewControllerCuriosities.swift
//  tickat
//
//  Created by Lucas Cardoso on 07/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit

class ViewControllerCuriosities: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var curiositiesTableView: UITableView!
    @IBOutlet weak var curiositiesLabel: UILabel!
    
    //outlets do popup
    @IBOutlet var popUpCuriosities: UIView!
    @IBOutlet weak var imageCuriosityPopUp: UIImageView!
    @IBOutlet weak var titleCuriosityPopUp: UILabel!
    @IBOutlet weak var longDescriptionCuriosityPopUp: UILabel!
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
        return AppData.shared.user.unblockedCuriosities.count
    }
    
    
    // Preenche os campos com as informações
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell:CuriositiesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "curiositiesCell", for: indexPath) as! CuriositiesTableViewCell
        
        tableCell.curiosityTitle?.text = AppData.shared.user.unblockedCuriosities[indexPath.row].title
        tableCell.curiosityText?.text = AppData.shared.user.unblockedCuriosities[indexPath.row].shortDescription
        self.curiositiesTableView.separatorStyle = .none
        
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
