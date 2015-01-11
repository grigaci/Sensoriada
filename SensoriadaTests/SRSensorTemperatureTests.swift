//
//  SRSensorTemperatureTests.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import UIKit
import XCTest
import Sensoriada

class SRSensorTemperatureTests: XCTestCase {

    func testWithValidType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        let sensorTemperature = SRSensorTemperature(values: values)
        XCTAssertEqual(sensorTemperature.type, SRSensorType.Temperature)
        XCTAssert(sensorTemperature.temperature == nil)
    }

    func testWithWrongValueType() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        values[SRSensorTemperatureKeys.value.rawValue] = NSDate()
        let sensorTemperature = SRSensorTemperature(values: values)
        XCTAssert(sensorTemperature.temperature == nil)
    }

    func testWithRightValueType() {
        var values = Dictionary<String, Any>()
        let rawTemperature: Int = 1010
        let temperature: Float = Float(rawTemperature) / 100.0 // 10.10 °C
        values[SRSensorTemperatureKeys.value.rawValue] = rawTemperature
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        let sensorTemperature = SRSensorTemperature(values: values)
        XCTAssertEqual(sensorTemperature.temperature!, temperature)
    }

    func testHumanReadableValueWithoutValue() {
        var values = Dictionary<String, Any>()
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue
        let sensorTemperature = SRSensorTemperature(values: values)
        XCTAssertEqual(sensorTemperature.humanReadableValue(), SRSensorBaseErrorDescription.NotAvailable.rawValue)
    }
    
    func testHumanReadableValueWithValue() {
        var values = Dictionary<String, Any>()
        let rawTemperature: Int = -2000
        let temperature: Float = Float(rawTemperature) / 100.0  // -20 °C
        values[SRSensorTemperatureKeys.value.rawValue] = rawTemperature
        values[SRSensorBaseKeys.type.rawValue] = SRSensorType.Temperature.rawValue

        let sensorTemperature = SRSensorTemperature(values: values)
        let expectedTemperature = "\(temperature) °C"
        XCTAssertEqual(sensorTemperature.humanReadableValue(), expectedTemperature)
    }
}
