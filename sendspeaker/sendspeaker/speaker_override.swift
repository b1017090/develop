//
//  speaker_override.swift
//  sendspeaker
//
//  Created by 熊谷峻 on 2019/12/03.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import AVFoundation

func IsHeadSetConnected() -> Bool{
    let route  = AVAudioSession.sharedInstance().currentRoute;
    for desc   in route.outputs
    {
        let portType = desc.portType;
      if (portType == AVAudioSession.Port.headphones)
        {
            return true;
        }
    }

    return false;
}

// イヤホンが刺された、出された時に呼ばれる
func setAudioNotification(){
  NotificationCenter.default.addObserver(self,
                                         selector: #selector(self.didChangeAudioSessionRoute(notification:)),
                                         name: NSNotification.Name.AVAudioSessionRouteChange,
                                         object: nil)
}

func didChangeAudioSessionRoute(notification:Notification){
  for desc in AVAudioSession.sharedInstance().currentRoute.outputs{
    if desc.portType == AVAudioSession.Port.headphones{
          // イヤホン刺さった
      }else{
          // イヤホン抜けた
          if !self.isSetSpeeker{
              self.setupSpeeker()
          }
      }
  }
}

// 変える実装
DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
  do{
      let audioSession = AVAudioSession.sharedInstance()
    try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
    try audioSession.setMode(AVAudioSession.Mode.videoChat)
    try audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
      try audioSession.setActive(true)
  }catch let error as NSError{
      DDLogError("Lesson \(error)")
  }
}
