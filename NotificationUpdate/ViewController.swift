//
//  ViewController.swift
//  NotificationUpdate
//
//  Created by 김재훈 on 2022/05/13.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.scheduleNotification()
            }
        }
    }

    func scheduleNotification() {
        // Content
        let content = UNMutableNotificationContent()
        content.title = "John Smith is live!"
        content.body = "GO and connect with John Smith in his video"
        content.interruptionLevel = UNNotificationInterruptionLevel.timeSensitive
        
        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // Request
        let request = UNNotificationRequest(identifier: "time_seneitive_example", content: content, trigger: trigger)
        
        // Schedule request
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            } else {
                print("Success!")
            }
        }
        
    }

}

