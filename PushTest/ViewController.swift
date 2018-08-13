//
//  ViewController.swift
//  PushTest
//
//  Created by 洋蔥胖 on 2018/8/10.
//  Copyright © 2018年 ChrisYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //https://firebase.google.com/docs/cloud-messaging/http-server-ref
        if let url = URL(string: "https://fcm.googleapis.com/fcm/send") {
            var request = URLRequest(url: url)
            //[內容類型、授權]
            request.allHTTPHeaderFields = ["Content-Type":"application/json","Authorization":"key=AAAAgNQo6Dw:APA91bFJa319BpazfqsOLcMqLBIMDpGdCl2bcr6YwR9QlEbjQ77ncn85vOGFbRsERpTwHR7STmwlTwWLIU0yQ3ZmUAAy9OMWq8O594qMFIdAf-UVsxwsqCQ25rh9M47Hp8Nn8bQAAoMhzefkpPXMdCFgt0s3-ElC0A"]
            request.httpMethod = "POST" //向服務生點餐
            //The data sent as the message body of the request, such as for an HTTP POST request.
            //拿到的手機token就放在To:裡面 指說 目標是我的手機(token) 我們想發送給誰
            request.httpBody = "{\"to\":\"fdsf9zA8mVA:APA91bGpuSrmI9KhCcDJ1SGkYH51p4YgjyfjAySMoePK5Dqacp7KlxNj84xxIDcWv4HdeqxyfnOqHxEvdeJ1x3Jr8AcbxqoX1Mza7R1TtMorJzCsI8xk9XTP5CjCjUECSaqRK6d9IfQDByiHzbqVyuF-i3WXrTwK5Q\",\"notification\":{\"title\":\"THIS IS FROM HTTP!\"}}".data(using: .utf8)
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, urlresponse, error) in
                if error != nil {
                    print(error!)
                }
                print(String(data: data!, encoding: .utf8)!)
            }).resume()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

