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

  @IBOutlet weak var play: UIImageView!
  @IBOutlet weak var listen: UIImageView!
  

  @IBOutlet weak var playing: UIImageView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    // An animated UIImage
  //  let jeremyGif = UIImage.gif(name: "29081")

    // A UIImageView with async loading
//    let imageView = UIImageView()
  //  imageView.loadGif(name: "29081")

    // A UIImageView with async loading from asset catalog(from iOS9)
        let playAnime = UIImage.gif(name: "PlayAnimation")
    let listenAnime = UIImage.gif(name: "ListenAnimation")
    let playingAnime = UIImage.gif(name: "PlayingAnimation")

    play.image = playAnime
    listen.image = listenAnime
  //  sample3.image = image
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

