//
//  SRSensorBaseTests.swift
//  SensoriadaTests
//
//  Created by bogdan on 10/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import XCTest
import Sensoriada

class SRSensorBaseTests: XCTestCase {

    func testWithEmptyDictionary() {
        let values = Dictionary<String, Any>()
        let sensorBase = SRSensorBase(values: values)
        XCTAssertEqual(sensorBase.type, SRSensorType.Unknown)
        XCTAssertEqual(sensorBase.version, kSRSensorBaseVersionDefault)
    }
    
    func testWithUnknownType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = Int(1000)
        let sensorBase = SRSensorBase(values: values)
        XCTAssertEqual(sensorBase.type, SRSensorType.Unknown)
        XCTAssertEqual(sensorBase.version, kSRSensorBaseVersionDefault)
    }
    
    func testWithVersion() {
        var values = Dictionary<String, Any>()
        let version = 1
        values[SRSensorBaseKeys.version.rawValue] = version
        let sensorBase = SRSensorBase(values: values)
        XCTAssertEqual(sensorBase.type, SRSensorType.Unknown)
        XCTAssertEqual(sensorBase.version, String(version))
    }
}
