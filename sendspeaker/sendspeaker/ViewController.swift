//
//  ViewController.swift
//  sendspeaker
//
//  Created by 熊谷峻 on 2019/12/03.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var engine = AVAudioEngine()
    
    private var reverb = AVAudioUnitReverb()
    private var delay = AVAudioUnitDelay()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bluetooth接続を許可
        try! AVAudioSession.sharedInstance()
          .setCategory(.record,
                       mode: .videoChat,
                         options: .defaultToSpeaker)
        
        let input = engine.inputNode
        let output = engine.mainMixerNode
        let format = engine.inputNode.inputFormat(forBus: 0)
        
        engine.attach(reverb)
        engine.attach(delay)
        
        reverb.wetDryMix = 0
        delay.delayTime = 0
        
        engine.connect(input, to: reverb, format: format)
        engine.connect(reverb, to: delay, format: format)
        engine.connect(delay, to: output, format: format)
        
        try! engine.start()

    }
    
    // マイクON/OFF用UISwitch
    @IBAction func changeMicState(sw: UISwitch){
        if sw.isOn {
            try! engine.start()
        }else{
            engine.stop()
        }
    }
    
    // マイクボリューム用UISlider
    @IBAction func micSlider(slider: UISlider){
        print(slider.value)
        engine.inputNode.volume = slider.value
    }
    
    // リバーブレベル用UISlider
    @IBAction func reverbSlider(slider: UISlider){
        reverb.wetDryMix = slider.value
    }
    
    // ディレイタイム用UISlider
    @IBAction func delaySlider(slider: UISlider){
        delay.delayTime = TimeInterval(slider.value)
    }

}
