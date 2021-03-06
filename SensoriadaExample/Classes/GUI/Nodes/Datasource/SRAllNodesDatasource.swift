//
//  SRAllNodesDatasource.swift
//  SensoriadaExample
//
//  Created by bogdan on 11/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import Alamofire
import Sensoriada

public class SRAllNodesDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var allNodes: [SRSensorsNode] = [SRSensorsNode]()
    let tableView: UITableView
    let headerFooterIdentifier: String

    init(_ aTableView: UITableView) {
        self.tableView = aTableView
        self.headerFooterIdentifier = NSUUID().UUIDString

        super.init()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: self.headerFooterIdentifier)
    }

    public func reload(callback :(error: NSError!) -> Void) {
        self.allNodes.removeAll(keepCapacity: true)
        self.tableView.reloadData()

        Alamofire.request(.GET, kYourHubURLAddress)
            .responseJSON { (_, _, JSON, error) in
                if let dict = JSON as? [String : AnyObject] {
                    if let rawNodesJSONArray = dict["sensorNodes"] as? [[String: AnyObject]] {
                        for rawNodeJSON in rawNodesJSONArray {
                            let node = SRSensorsNode(dictionary: rawNodeJSON)
                                self.allNodes.append(node)
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                            callback(error: error)
                    })
                }
        }
    }

    // UITableViewDataSource methods
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.allNodes.count
    }

    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let node = self.allNodes[section]
        return node.sensors.count
    }

    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndetifier: String = "SRAllNodesTableViewCellIdentifier"
        let cell: UITableViewCell = {
            if let dequed = tableView.dequeueReusableCellWithIdentifier(cellIndetifier) as? UITableViewCell {
                return dequed
            }
            
            return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIndetifier)
        }()

        let node = self.allNodes[indexPath.section] as SRSensorsNode
        let sensor = node.sensors[indexPath.row]
        cell.textLabel?.text = sensor.sensorName

        return cell
    }
    
    // UITableViewDelegate methods
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let node = self.allNodes[section]
        if let view = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier(self.headerFooterIdentifier) as? UITableViewHeaderFooterView {
            view.textLabel.text = "Node \(node.nodeID)"
            return view
        }

        return nil
    }
}
