//
//  SRSendorsNodeTests.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import XCTest
import Sensoriada

class SRSendorsNodeTests: XCTestCase {

    func testWithEmptyDictionary() {
        let dictionary = [String : AnyObject]()
        let node = SRSensorsNode(dictionary: dictionary)
        XCTAssertEqual(node.nodeID, SRSensorsNodeErrorCodes.MissingNodeID.rawValue)
        XCTAssert(node.voltage == nil)
        XCTAssert(node.secondsAgo == nil)
        XCTAssert(node.date == nil)
        XCTAssert(node.sensors.count == 0)
    }

    func testWithValidDictionary() {
        var nodeDictionary = self.validSensorsNodesDictionary()
        let temperatureDictionary = self.validTemperatureSensorDictionary()
        let sensorsArray = [temperatureDictionary]
        nodeDictionary[SRSensorsNodeDictionaryKeys.sensors.rawValue] = sensorsArray

        let node = SRSensorsNode(dictionary: nodeDictionary)
        XCTAssertEqual(node.nodeID, nodeDictionary[SRSensorsNodeDictionaryKeys.nodeID.rawValue] as Int)
        
        let voltage = nodeDictionary[SRSensorsNodeDictionaryKeys.voltage.rawValue] as Int
        XCTAssertEqual(node.voltage!, Float(voltage))

        XCTAssertEqual(node.secondsAgo, nodeDictionary[SRSensorsNodeDictionaryKeys.secondsAgo.rawValue] as Int)

        let dateString = node.date!.SR_toString()
        XCTAssertEqual(dateString, nodeDictionary[SRSensorsNodeDictionaryKeys.date.rawValue] as String)
        
        XCTAssert(node.sensors.count == 1)
        let testSensor = node.sensors[0]
        XCTAssert(testSensor is SRSensorTemperature)
    }

}
