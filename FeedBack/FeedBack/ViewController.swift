//
//  ViewController.swift
//  FeedBack
//
//  Created by 熊谷峻 on 2019/11/22.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func button(_ sender: Any) {
    // Do any additional setup after loading the view.
    let url = URL(string: "http://34.84.251.174:8080/live/good/add/54d218df-c60c-4aba-966d-6826ab7ba42e")
    let request = URLRequest(url: url!)
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        if error == nil, let data = data, let response = response as? HTTPURLResponse {
            // HTTPヘッダの取得
            print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
            // HTTPステータスコード
            print("statusCode: \(response.statusCode)")
            print(String(data: data, encoding: String.Encoding.utf8) ?? "")
        }
    }.resume()
  }
  

}

