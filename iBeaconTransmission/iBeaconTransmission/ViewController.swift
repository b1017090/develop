//
//  ViewController.swift
//  iBeaconTransmission
//
//  Created by 熊谷峻 on 2019/11/01.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth



class ViewController: UIViewController, CBPeripheralManagerDelegate {
    // LocationManager.
    var myPheripheralManager:CBPeripheralManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // PeripheralManagerを定義.
        myPheripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }

    
  func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
    
        // iBeaconのUUID.
        let myProximityUUID = NSUUID(uuidString: "00000000-0000-0000-0000-000000000000")
        // iBeaconのIdentifier.
        let myIdentifier = "testbeacon"
        // Major.
        let myMajor : CLBeaconMajorValue = 1
        // Minor.
        let myMinor : CLBeaconMinorValue = 0
        // BeaconRegionを定義.
    let myBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID! as UUID, major: myMajor, minor: myMinor, identifier: myIdentifier)
        // Advertisingのフォーマットを作成.
    let myBeaconPeripheralData = NSDictionary(dictionary: myBeaconRegion.peripheralData(withMeasuredPower: nil))
        // Advertisingを発信.
    myPheripheralManager.startAdvertising(myBeaconPeripheralData as [NSObject : AnyObject] as [NSObject : AnyObject] as? [String : Any])
    }
}

