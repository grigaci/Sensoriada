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

public enum SRSensorBaseErrorDescription: String {
    case NotAvailable = "Not available"
}

public class SRSensorBase {

    public var type: SRSensorType
    public var version: String

    public init(values: Dictionary<String, Any>) {
        self.type = .Unknown
        self.version = kSRSensorBaseVersionDefault
        self.parseRawValues(values)
    }

    public func parseRawValues(values: Dictionary<String, Any>) {
        if let rawVersion = values[SRSensorBaseKeys.version.rawValue] as? Int {
            self.version = String(rawVersion)
        }
        
        if let rawType = values[SRSensorBaseKeys.type.rawValue] as? Int {
            if let convertedType = SRSensorType(rawValue: rawType) {
                self.type = convertedType
            }
        }
    }

    public func humanReadableValue() -> String {
        return SRSensorBaseErrorDescription.NotAvailable.rawValue
    }

}
