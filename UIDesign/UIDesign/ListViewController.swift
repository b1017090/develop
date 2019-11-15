//
//  ListViewController.swift
//  UIDesign
//
//  Created by 熊谷峻 on 2019/11/15.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

  @IBOutlet weak var candidate: UITableView!
  
  let dataList = ["テスト１","テスト２","テスト３","テスト４"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    candidate.dataSource = self    //追加
    candidate.delegate = self // 追加

  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Candidate", for: indexPath)
    cell.textLabel?.text = dataList[indexPath.row]
    return cell
  }
  
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
         // セルの選択を解除
         tableView.deselectRow(at: indexPath, animated: true)
  
         // 別の画面に遷移
         performSegue(withIdentifier: "演奏を再生", sender: nil)
     }
  
}
