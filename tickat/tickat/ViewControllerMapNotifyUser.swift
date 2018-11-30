//
//  ViewControllerMapNotifyUser.swift
//  tickat
//
//  Created by Flávia on 14/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications

extension ViewControllerMap {
    // Asking user for permission
    func registerForNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            // Checking if permission granted
            print("Permission granted: \(granted)")
        }
    }
    
    // Sending notification about new curiosity
    func notifyUser(curiosity: Curiosity) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Nova curiosidade"
        notificationContent.body = "Você passou por uma nova curiosidade no seu trajeto. Vamos conferir?"
        notificationContent.subtitle = curiosity.title
        notificationContent.badge = 1
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestToDisplay = UNNotificationRequest(identifier: "newCuriosity", content: notificationContent, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(requestToDisplay, withCompletionHandler: nil)
    }
    
}
