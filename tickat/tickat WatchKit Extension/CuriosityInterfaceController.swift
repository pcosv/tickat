//
//  CuriosityInterfaceController.swift
//  tickat WatchKit Extension
//
//  Created by Lucas Cardoso on 30/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit
import WatchKit

class CuriosityInterfaceController: WKInterfaceController {
    @IBOutlet var titleCuriosity: WKInterfaceLabel!
    @IBOutlet var shortDescription: WKInterfaceLabel!
    
    @IBAction func openMap() {
        presentController(withName: "map", context: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: nil)
        
        let curiosityOpt = context as! Curiosity?
        
        if let curiosity = curiosityOpt {
            titleCuriosity.setText(curiosity.title)
            shortDescription.setText(curiosity.shortDescription)
        }
    }
}
