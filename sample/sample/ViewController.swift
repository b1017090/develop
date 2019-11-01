//
//  ViewController.swift
//  sample
//
//  Created by 熊谷峻 on 2019/09/19.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet var myTableView: UITableView!
   var actionInfo:[String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  func convertValue(value: Any?)->String{
    if let string = value as? String{
      return string
    }
    if let num = value as? Int{
      return num.description;
    }
    return value.debugDescription
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
    return actionInfo.count;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
    cell.textLabel!.text = actionInfo[indexPath.row]
    return cell
  }
  
  func reloadTable(info:[AnyHashable: Any]){
    actionInfo.removeAll()
    for key in info.keys{
      let value: String = convertValue(value: info[key])
      actionInfo.append(key as! String + ":" + value)
    }
    myTableView.reloadData()
  }
  
}

