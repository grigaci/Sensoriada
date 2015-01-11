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

    private let unknownSensorType: Int = 1000

    func testWithEmptyDictionary() {
        let values = Dictionary<String, Any>()
        let sensorBase = SRSensorBase(values: values)
        XCTAssertEqual(sensorBase.type, SRSensorType.Unknown)
        XCTAssertEqual(sensorBase.version, kSRSensorBaseVersionDefault)
    }
    
    func testWithUnknownType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = unknownSensorType
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
    
    func testHumanReadableValue() {
        var values = Dictionary<String, Any>()
        let sensorBase = SRSensorBase(values: values)
        XCTAssertEqual(sensorBase.humanReadableValue(), SRSensorBaseErrorDescription.NotAvailable.rawValue)
    }
    
    func testFactoryCreateFromDictionaryInvalidType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = unknownSensorType
        let sensor = SRSensorFactoryCreateFromDictionary(values)
        XCTAssert(sensor == nil)
    }
    
    func testFactoryCreateFromDictionarySensorType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        let sensorTemperature = SRSensorFactoryCreateFromDictionary(values) as SRSensorTemperature
        XCTAssertEqual(sensorTemperature.type, SRSensorType.Temperature)
    }

}
