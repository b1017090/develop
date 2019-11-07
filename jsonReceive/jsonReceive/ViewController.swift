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
       var UserNumber = 1
       //json構造体のグローバル変数
       struct JsonSample : Codable{
         let uuid : String?
         let key : String?
         let name : String?
         let profile : String?
  }
// var Jsondata = JsonSample(uuid: "a", key: "a", name: "a", profile: "a")
  
    override func viewDidLoad() {
        super.viewDidLoad()
      JsonGet()//Jsonデータを取ってくる関数
      print();
  }
     
 func JsonGet(){
        let listUrl = "http://35.184.233.225:8080/sendtest"//jsonを取得するwebページのURL
        guard let url = URL(string: listUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        //errorが起きたとき
          if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }

          let json = try? JSONDecoder().decode([JsonSample].self, from:data)//jsonのデコード
          let encoder = JSONEncoder()
          encoder.outputFormatting = .prettyPrinted//ここでprint出力を整形する
        //  let encoded = try! encoder.encode(json)
          print(json![self.UserNumber].uuid as Any,json![self.UserNumber].key as Any,json![self.UserNumber].name as Any,json![self.UserNumber].profile as Any)

          //print(String(data: encoded, encoding: .utf8)!)
        }.resume()
  }
}



