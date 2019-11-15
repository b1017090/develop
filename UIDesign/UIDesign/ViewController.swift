//
//  ViewController.swift
//  UIDesign
//
//  Created by 熊谷峻 on 2019/11/14.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class rootViewController: UIViewController {

  @IBOutlet weak var sample: UIImageView!
  @IBOutlet weak var sample2: UIImageView!
  
  //@IBOutlet weak var sample3: UIImageView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    // An animated UIImage
  //  let jeremyGif = UIImage.gif(name: "29081")

    // A UIImageView with async loading
//    let imageView = UIImageView()
  //  imageView.loadGif(name: "29081")

    // A UIImageView with async loading from asset catalog(from iOS9)
        let image = UIImage.gif(name: "29081")
    //let image2 = UIImage.gif(name: "1")
    sample.image = image
    sample2.image = image
  //  sample3.image = image
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

