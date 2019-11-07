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
  
       //json構造体のグローバル変数
       struct JsonSample : Codable{
         let uuid : String?
         let key : String?
         let name : String?
         let profile : String?
  }

  
    override func viewDidLoad() {
        super.viewDidLoad()
      JsonGet()//Jsonデータを取ってくる関数

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

          let json = try? JSONDecoder().decode([JsonSample].self, from: data)//jsonのデコード
          let encoder = JSONEncoder()
          encoder.outputFormatting = .prettyPrinted//ここでOptional()を外す
          let encoded = try! encoder.encode(json)
          print(String(data: encoded, encoding: .utf8)!)
        }.resume()
  }
}



