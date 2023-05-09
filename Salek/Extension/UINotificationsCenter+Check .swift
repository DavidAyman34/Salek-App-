//
//  UINotificationsCenter+Check .swift
//  Salek
//
//  Created by Divo Ayman on 09/05/2023.
//  Copyright © 2023 Divo Ayman. All rights reserved.
//

import UIKit
import UserNotifications

extension UNUserNotificationCenter  {
    
    func checkForPermation(title: String, body: String,hour: Int, min: Int, isDaily: Bool){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { setting in
            switch setting.authorizationStatus{
            case .authorized:
                self.pushNotification(title: title, body: body, hour: hour, min: min, isDaily: isDaily)
            case.denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAlow, error in
                    if didAlow{
                        self.pushNotification(title: title, body: body, hour: hour, min: min, isDaily: isDaily)
                    }
                }
            default: return
                
            }
        }
    }
    
  private func pushNotification(title: String, body: String,hour: Int, min: Int, isDaily: Bool){
   
      let notificationCenter = UNUserNotificationCenter.current()
      let content = UNMutableNotificationContent()
      content.title = title
      content.body = body
      content.sound = .default
      let calendar = Calendar.current
      var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
      dateComponents.hour = hour
      dateComponents.minute = min
      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
      let requast = UNNotificationRequest(identifier: NotificationIde.identifier, content: content, trigger: trigger)
      notificationCenter.removePendingNotificationRequests(withIdentifiers: [NotificationIde.identifier] )
      notificationCenter.add(requast)
      
    }
}

