import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var myLocationManager:CLLocationManager!
    var myBeaconRegion:CLBeaconRegion!
    var beaconUuids: NSMutableArray!
    var beaconDetails: NSMutableArray!

    let UUIDList = [
        "00000000-0000-0000-0000-000000000000",
        /*"01000000-0000-0000-0000-000000000000",*/
     /*   "4F215AA1-3904-47D5-AD5A-3B6AA89542AE"*/
    ]
  
    @IBOutlet weak var label1: UILabel!
    @IBAction func button1(_ sender: UIButton) {
        if (label1.text == "Immediate") {
            label3.text = "ちかすぎぃ"
        }else if(label1.text == "iBeaconSeaching" || label1.text == "Unknown"){
            label3.text = "近くにないよん"
        }else {
            label3.text = "近くにあるよん"
      }
    }
    @IBOutlet weak var label2: UILabel!
    @IBAction func button2(_ sender: UIButton) {
        label2.text = ""
    }

  @IBOutlet weak var label3: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        myLocationManager.distanceFilter = 1
        let status = CLLocationManager.authorizationStatus()
        print("CLAuthorizedStatus: \(status.rawValue)");
        if(status == .notDetermined) {
            myLocationManager.requestAlwaysAuthorization()
        }
        beaconUuids = NSMutableArray()
        beaconDetails = NSMutableArray()
    }

    private func startMyMonitoring() {
        for i in 0 ..< UUIDList.count {
            let uuid: NSUUID! = NSUUID(uuidString: "\(UUIDList[i].lowercased())")
            let identifierStr: String = "abcde\(i)"
            myBeaconRegion = CLBeaconRegion(proximityUUID: uuid as UUID, identifier: identifierStr)
            myBeaconRegion.notifyEntryStateOnDisplay = false
            myBeaconRegion.notifyOnEntry = true
            myBeaconRegion.notifyOnExit = true
            myLocationManager.startMonitoring(for: myBeaconRegion)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus");
        switch (status) {
        case .notDetermined:
            print("not determined")
            break
        case .restricted:
            print("restricted")
            break
        case .denied:
            print("denied")
            break
        case .authorizedAlways:
            print("authorizedAlways")
            startMyMonitoring()
            break
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            startMyMonitoring()
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        manager.requestState(for: region);
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        switch (state) {
        case .inside:
            label2.text = "iBeacon inside"
            print("iBeacon inside");
            manager.startRangingBeacons(in: region as! CLBeaconRegion)
            break;
        case .outside:
            label2.text = "iBeacon outside"
            print("iBeacon outside")
            break;
        case .unknown:
            label2.text = "iBeacon unknown"
            print("iBeacon unknown")
            break;
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        beaconUuids = NSMutableArray()
        beaconDetails = NSMutableArray()
        if(beacons.count > 0){
            for i in 0 ..< beacons.count {
                let beacon = beacons[i]
                let beaconUUID = beacon.proximityUUID;
                let minorID = beacon.minor;
                let majorID = beacon.major;
                let rssi = beacon.rssi;
                var proximity = ""
                var range = ""
                switch (beacon.proximity) {
                case CLProximity.unknown :
                    print("Proximity: Unknown");
                    proximity = "Unknown"
                    range = "iBeacon outside"
                    break;
                case CLProximity.far:
                    print("Proximity: Far");
                    range = "iBeacon inside Far"
                    proximity = "Far"
                    break;
                case CLProximity.near:
                    print("Proximity: Near");
                    range = "iBeacon inside Near"
                    proximity = "Near"
                    break;
                case CLProximity.immediate:
                    print("Proximity: Immediate");
                    range = "iBeacon outside Immediate"
                    proximity = "Immediate"
                    break;
                }
                beaconUuids.add(beaconUUID.uuidString)
                var myBeaconDetails = "Major: \(majorID) "
                myBeaconDetails += "Minor: \(minorID) "
                myBeaconDetails += "Proximity:\(proximity) "
                myBeaconDetails += "RSSI:\(rssi)"
                print(myBeaconDetails)
                beaconDetails.add(myBeaconDetails)
                label1.text = proximity
                label2.text = range
            }
        }
    }

  //Beacon感知したら距離の測定を開始
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion: iBeacon found");
        manager.startRangingBeacons(in: region as! CLBeaconRegion)
    }

    //Beaconから離れたら距離の測定を停止
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion: iBeacon lost");
        manager.stopRangingBeacons(in: region as! CLBeaconRegion)
    }
}
