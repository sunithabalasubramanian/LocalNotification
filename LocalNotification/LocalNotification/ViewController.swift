//
//  ViewController.swift
//  LocalNotification
//
//  Created by Sunitha Balasubramanian on 29/01/21.
//  Copyright © 2021 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
            if let _ = error {
                print("Granted", granted)
            }
            
        })
        let content = UNMutableNotificationContent()
        content.title = "Hello haters"
        content.body = "Great Day"
        
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {(error) in 
            
        })
        
        
    }


}

