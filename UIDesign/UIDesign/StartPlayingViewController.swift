//
//  StartPlayingViewController.swift
//  UIDesign
//
//  Created by 熊谷峻 on 2019/11/19.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class startPlayingViewController: UIViewController {
  


  
  @IBOutlet weak var startPlaying: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    // An animated UIImage
  //  let jeremyGif = UIImage.gif(name: "29081")

    // A UIImageView with async loading
//    let imageView = UIImageView()
  //  imageView.loadGif(name: "29081")

    // A UIImageView with async loading from asset catalog(from iOS9)

    let playAnime = UIImage.gif(name: "PlayAnimation")

    startPlaying.image = playAnime
  //  sample3.image = image
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
