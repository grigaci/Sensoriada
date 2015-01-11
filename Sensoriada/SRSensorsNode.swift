//
//  SRSensorsNode.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import Foundation

public enum SRSensorsNodeErrorCodes: Int {
    case MissingNodeID = -1
}

public enum SRSensorsNodeDictionaryKeys: String {
    case nodeID = "nodeID"
    case voltage = "voltage"
    case secondsAgo = "secondsAgo"
    case date = "date"
    case sensors = "sensors"
}


public class SRSensorsNode {
    public var nodeID: Int
    public var voltage: Float!
    public var secondsAgo: Int!
    public var date: NSDate!
    public var sensors: Array<SRSensorBase>

    public init(dictionary: [String : AnyObject]) {
        self.sensors = Array<SRSensorBase>()
        self.nodeID = SRSensorsNodeErrorCodes.MissingNodeID.rawValue
        self.loadFromDictionary(dictionary)
    }

    func loadFromDictionary(dictionary: [String : AnyObject]) {
        if let rawNodeID = dictionary[SRSensorsNodeDictionaryKeys.nodeID.rawValue] as? Int {
            self.nodeID = rawNodeID
        }
        
        if let rawVoltage = dictionary[SRSensorsNodeDictionaryKeys.voltage.rawValue] as? Int {
            self.voltage = Float(rawVoltage)
        }

        if let rawSecondsAgo = dictionary[SRSensorsNodeDictionaryKeys.secondsAgo.rawValue] as? Int {
            self.secondsAgo = rawSecondsAgo
        }

        if let rawDateString = dictionary[SRSensorsNodeDictionaryKeys.date.rawValue] as? String {
            if let rawDate = rawDateString.SR_toDate() {
                self.date = rawDate
            }
        }
        
        if let rawSensorsArray = dictionary[SRSensorsNodeDictionaryKeys.sensors.rawValue] as? [[String: AnyObject]] {
            for rawSensor in rawSensorsArray {
                let sensor = SRSensorFactoryCreateFromDictionary(rawSensor)
                self.sensors.append(sensor)
            }
        }
    }
}
