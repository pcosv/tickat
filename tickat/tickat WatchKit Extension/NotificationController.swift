//
//  NotificationController.swift
//  tickat WatchKit Extension
//
//  Created by Paula Vaz on 06/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {
    
    var curiosity:Curiosity!

    @IBAction func goToCuriosity() {
        presentController(withName: "curiosity", context: curiosity)
    }
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        let curiosityTitle = notification.request.content.title
        
        for i in AppData.shared.allLocations{
            if(i.curiosity.title == curiosityTitle){
                self.curiosity = i.curiosity
                break
            }
        }
    }
    
}
