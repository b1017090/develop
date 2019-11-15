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
  var users: [UserCell.User]=[]

   @IBOutlet weak var userTable: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      self.userTable.estimatedRowHeight = 100
      self.userTable.rowHeight = UITableView.automaticDimension
      
      guard let data = try? JsonGet() else {
        return
      }
      guard let tmp = try? JSONDecoder().decode([UserCell.User].self, from: data!)else{return}
      
      users = tmp
      print("\(users)")
      
    //  JsonGet()//Jsonデータを取ってくる関数
      //print();
  }
     
  
  
 func JsonGet(){
  let url = URL(string: "http://35.184.233.225:8080/sendtest")!
    return try Data(contentsOf:url)
  }
  /*
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
          let jsonuuid = json![1].uuid
       //   print(json![self.UserNumber].uuid as Any,json![self.UserNumber].key as Any,json![self.UserNumber].name as Any,json![self.UserNumber].profile as Any)
          print(jsonuuid as Any)
          

          //print(String(data: encoded, encoding: .utf8)!)
        }.resume()
  }*/
  
  func tableView(_ tableView: UITableView, numberOfRowInSection section: Int) -> Int{
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "users",for: indexPath) as! UserCell
    
    cell.name.text = users[indexPath.row].name
    cell.profile.text = users[indexPath.row].profile
    return cell
  }
  
}



