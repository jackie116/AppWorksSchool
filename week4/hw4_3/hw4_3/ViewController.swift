//
//  ViewController.swift
//  hw4_3
//
//  Created by 黃昱崴 on 2022/4/17.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    
    
    struct station: Codable {
        let stationID: String
        let stationName: String
        let stationAddress: String
    }
    
    func getStationData() {
        if let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(station.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.stationIDLabel.text = searchResponse.stationID
                        self.stationNameLabel.text = searchResponse.stationName
                        self.stationAddressLabel.text = searchResponse.stationAddress
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getStationData()
    }

}

