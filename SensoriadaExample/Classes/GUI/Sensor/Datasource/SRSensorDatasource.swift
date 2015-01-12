//
//  SRSensorDatasource.swift
//  SensoriadaExample
//
//  Created by bogdan on 11/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import Sensoriada

public class SRSensorDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var sensor: SRSensorBase! {
        didSet {
            if let safeValue = self.sensor?.valuesToDisplay() {
                self.valuesToDisplay = safeValue
                self.reload()
            }
        }
    }

    let tableView: UITableView
    var valuesToDisplay: [String : String]

    init(_ aTableView: UITableView) {
        self.tableView = aTableView
        self.valuesToDisplay = [String : String]()
        super.init()
        self.tableView.dataSource = self
    }

    public func reload() {
        self.tableView.reloadData()
    }

    // UITableViewDataSource methods
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.valuesToDisplay.count
    }

    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndetifier: String = "SRSensorTableViewCellIdentifier"
        let cell: UITableViewCell = {
            if let dequed = tableView.dequeueReusableCellWithIdentifier(cellIndetifier) as? UITableViewCell {
                return dequed
            }

            return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIndetifier)
            }()

        let key = self.valuesToDisplay.keys.array[indexPath.row]
        let value = self.valuesToDisplay[key]
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = value

        return cell
    }
}
