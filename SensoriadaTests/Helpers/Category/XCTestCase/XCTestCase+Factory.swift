//
//  XCTestCase+Factory.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import XCTest
import Sensoriada

extension XCTestCase {
    func validSensorsNodesDictionary() -> [String : AnyObject] {
        let date = NSDate()
        let dateString = NSDate().SR_toString()

        var dictionary = [String : AnyObject]()
        dictionary[SRSensorsNodeDictionaryKeys.nodeID.rawValue] = 0
        dictionary[SRSensorsNodeDictionaryKeys.voltage.rawValue] = 220
        dictionary[SRSensorsNodeDictionaryKeys.secondsAgo.rawValue] = 1
        dictionary[SRSensorsNodeDictionaryKeys.date.rawValue] = dateString
        return dictionary
    }

    func validTemperatureSensorDictionary() -> [String : AnyObject] {
        var dictionary = [String : AnyObject]()
        let rawTemperature: Int = 1010
        let temperature: Float = Float(rawTemperature) / 100.0 // 10.10 °C
        dictionary[SRSensorTemperatureDictionaryKeys.value.rawValue] = rawTemperature
        dictionary[SRSensorBaseDictionaryKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        return dictionary
    }
}
