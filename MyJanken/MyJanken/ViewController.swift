//
//  ViewController.swift
//  MyJanken
//
//  Created by 熊谷峻 on 2019/08/13.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBOutlet weak var answerImageView: UIImageView!
  
  @IBOutlet weak var answerLabel: UILabel!
  
  @IBAction func shuffleAction(_ sender: Any) {
    answerLabel.text = "グー"
    answerImageView.image = UIImage(named: "gu")
  }
  
}

