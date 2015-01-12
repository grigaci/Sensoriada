//
//  SRSensorBase.swift
//  SensoriadaExample
//
//  Created by bogdan on 10/01/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import Foundation

public enum SRSensorType: Int {
    case Unknown = -1
    case Temperature = 10
}

public enum SRSensorBaseKeys: String {
    case type = "type"
    case version = "version"
}

public let kSRSensorBaseVersionDefault = "0.0.0"
public let kSRSensorBaseNameDefault = "Unknown"

public enum SRSensorBaseErrorDescription: String {
    case NotAvailable = "Not available"
}

private func _SRSensorGetType(values: [String : AnyObject]) -> SRSensorType {
    if let rawType = values[SRSensorBaseKeys.type.rawValue] as? Int {
        if let convertedType = SRSensorType(rawValue: rawType) {
            return convertedType
        }
    }

    return SRSensorType.Unknown
}

public class SRSensorBase {

    public var type: SRSensorType
    public var version: String
    public var sensorName: String

    public init(values: [String : AnyObject]) {
        self.type = .Unknown
        self.version = kSRSensorBaseVersionDefault
        self.sensorName = kSRSensorBaseNameDefault
        self.parseRawValues(values)
    }

    public func parseRawValues(values: [String : AnyObject]) {
        if let rawVersion = values[SRSensorBaseKeys.version.rawValue] as? Int {
            self.version = String(rawVersion)
        }

        self.type = _SRSensorGetType(values)
    }

    public func humanReadableValue() -> String {
        return SRSensorBaseErrorDescription.NotAvailable.rawValue
    }

    public func valuesToDisplay() -> [String : String] {
        var values = [String : String]()
        values["Type"] = String(self.type.rawValue)
        values["Version"] = self.version
        return values
    }
}

public func SRSensorFactoryCreateFromDictionary(values: [String : AnyObject]) -> SRSensorBase! {
    switch (_SRSensorGetType(values)) {
    case .Unknown:
        return nil
    case .Temperature:
        return SRSensorTemperature(values: values)
    }
}

