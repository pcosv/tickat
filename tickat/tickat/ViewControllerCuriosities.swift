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
}
