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
    func validSensorsNodesDictionary() -> [String: Any] {
        let date = NSDate()
        let dateString = NSDate().SR_toString()
        
        var dictionary = Dictionary<String, Any>()
        dictionary[SRSensorsNodeDictionaryKeys.nodeID.rawValue] = 0
        dictionary[SRSensorsNodeDictionaryKeys.voltage.rawValue] = 220
        dictionary[SRSensorsNodeDictionaryKeys.secondsAgo.rawValue] = 1
        dictionary[SRSensorsNodeDictionaryKeys.date.rawValue] = dateString
        return dictionary
    }

    func validTemperatureSensorDictionary() -> [String: Any] {
        var dictionary = Dictionary<String, Any>()
        let rawTemperature: Int = 1010
        let temperature: Float = Float(rawTemperature) / 100.0 // 10.10 °C
        dictionary[SRSensorTemperatureKeys.value.rawValue] = rawTemperature
        dictionary[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        return dictionary
    }
}
