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
    
    
    // Reload data when trasitioned between tab bar
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.curiositiesTableView.reloadData()
    }
    
    // Vê a quantidade de itens na TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.curiositiesTableView.separatorStyle = .none
        
        let curiosityCount = AppData.shared.user.unblockedCuriosities.count
        
        // Add call to action label if is empty and remove if its not
        if (curiosityCount == 0){
            
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
            label.text = "Explore a cidade e descubra curiosidades!"
            label.center = self.view.center
            
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
        
        return curiosityCount
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
    
    
    // Preenche os campos com as informações
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell:CuriositiesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "curiositiesCell", for: indexPath) as! CuriositiesTableViewCell
        
        tableCell.curiosityTitle?.text = AppData.shared.user.unblockedCuriosities[indexPath.row].title
        tableCell.curiosityText?.text = AppData.shared.user.unblockedCuriosities[indexPath.row].shortDescription
        self.curiositiesTableView.separatorStyle = .none
        tableCell.curiositiesContentView.layer.cornerRadius = 20
        tableCell.curiositiesContentView.layer.masksToBounds = true
        
        return tableCell
    }
    
    // pra quando toca numa célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageCuriosityPopUp.image = AppData.shared.user.unblockedCuriosities[indexPath.row].images[0]
        titleCuriosityPopUp.text = AppData.shared.user.unblockedCuriosities[indexPath.row].title
        longDescriptionCuriosityPopUp.text = AppData.shared.user.unblockedCuriosities[indexPath.row].longDescription
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
