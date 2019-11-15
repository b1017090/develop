//
//  File.swift
//  jsonReceive
//
//  Created by 熊谷峻 on 2019/11/08.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell{
  
  @IBOutlet weak var name: UILabel!
   @IBOutlet weak var profile: UILabel!
  
  struct User: Codable {
    let uuid : String?
            let key : String?
            let name : String?
            let profile : String?
     }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
