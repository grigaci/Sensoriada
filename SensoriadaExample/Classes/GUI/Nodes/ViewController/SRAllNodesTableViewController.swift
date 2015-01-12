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

    @IBOutlet weak var syncBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = SRAllNodesDatasource(self.tableView)
        self.sync(nil)
    }

    @IBAction func sync(sender: AnyObject!) {
        self.syncBarButton.enabled = false
        self.datasource.reload({
            (error) in
            if error != nil {
                self.showError(error!)
            }
            self.syncBarButton.enabled = true
        })
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
    
    private func showError(error: NSError) {
        let message = "Could not fetch data! Error: \(error)"
        let alertView = UIAlertView(title: "Error", message: message, delegate: nil, cancelButtonTitle: nil)
        alertView.show()
    }

}
