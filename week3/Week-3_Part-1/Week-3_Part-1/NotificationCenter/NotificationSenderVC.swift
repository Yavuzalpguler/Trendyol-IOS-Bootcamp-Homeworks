//
//  NotificationSenderVC.swift
//  Week-3_Part-1
//
//  Created by Kerim Caglar on 1.05.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    var notificationData: [String:Any] = [:]
    
    @IBOutlet weak var sendTextNotification: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func sendNotificationBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendText(_ sender: UITextField) {
        notificationData["name"] = sendTextNotification.text
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        
    }
    //MARK: Notification sender daki mesajı kullanıcıdan alınız..
}
