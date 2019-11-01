//
//  ViewController.swift
//  jsonReceive
//
//  Created by 熊谷峻 on 2019/11/01.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      struct JsonSample : Codable{
          let uuid : String
          let key : String
      }

      let listUrl = "http://35.184.233.225:8080/uuidtest"
      guard let url = URL(string: listUrl) else { return }

      URLSession.shared.dataTask(with: url) { (data, response, error) in
          if error != nil {
              print(error!.localizedDescription)
          
          }else {
            let sample = String(data: data!, encoding: .utf8)!
              
              let json = try? JSONDecoder().decode(JsonSample.self, from: sample.data(using: .utf8)!)
            print(json?.uuid as Any)
            
        }
}
}
}
          


