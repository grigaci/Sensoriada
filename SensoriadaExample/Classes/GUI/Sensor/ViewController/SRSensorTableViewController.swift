//
//  SRSensorTableViewController.swift
//  SensoriadaExample
//
//  Created by bogdan on 11/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import Sensoriada

class SRSensorTableViewController: UITableViewController {
    
    var sensor: SRSensorBase!
    var datasource: SRSensorDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = SRSensorDatasource(self.tableView)
        self.datasource.sensor = self.sensor
        self.title = self.sensor.sensorName
    }
}
