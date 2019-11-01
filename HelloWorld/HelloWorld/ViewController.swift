//
//  ViewController.swift
//  HelloWorld
//
//  Created by 熊谷峻 on 2019/08/11.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = "Hello World!"
    }

  @IBOutlet weak var outputLabel: UILabel!
  
}


