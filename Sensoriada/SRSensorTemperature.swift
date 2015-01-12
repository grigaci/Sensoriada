//
//  SRSensorTemperature.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

public enum SRSensorTemperatureDictionaryKeys: String {
    case value = "value"
}

let kSRSensorTemperatureNameDefault = "Temperature"

public class SRSensorTemperature: SRSensorBase {

    public var temperature: Float!

    public override init(values: [String : AnyObject]) {
        super.init(values: values)
        self.sensorName = kSRSensorTemperatureNameDefault
    }

    public override func parseRawValues(values: [String : AnyObject]) {
        super.parseRawValues(values)
        assert(self.type == SRSensorType.Temperature, "Invalid sensor type value for SRSensorTemperature.")

        if let rawValue = values[SRSensorTemperatureDictionaryKeys.value.rawValue] as? Int {
            self.temperature = Float(rawValue) / 100.0
        }
    }

    public override func humanReadableValue() -> String {
        if self.temperature != nil {
            return "\(self.temperature) °C"
        }

        return super.humanReadableValue()
    }

    public override func valuesToDisplay() -> [String : String] {
        var values = super.valuesToDisplay()
        values["Temperature"] = self.humanReadableValue()
        return values
    }
}
