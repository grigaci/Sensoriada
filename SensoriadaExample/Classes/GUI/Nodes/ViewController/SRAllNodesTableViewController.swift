//
//  SRAllNodesTableViewController.swift
//  SensoriadaExample
//
//  Created by bogdan on 09/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import Sensoriada

class SRAllNodesTableViewController: UITableViewController {

    var datasource: SRAllNodesDatasource!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = SRAllNodesDatasource(self.tableView)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.datasource.reload()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SRSensorViewControllerSegue" {
            let sensorViewController = segue.destinationViewController as SRSensorTableViewController
            if let cell = sender as? UITableViewCell {
                let indexPath = self.tableView.indexPathForCell(cell)
                let node = self.datasource!.allNodes[indexPath!.section] as SRSensorsNode
                let sensor = node.sensors[indexPath!.row]
                sensorViewController.sensor = sensor
            }
        }
    }
}
