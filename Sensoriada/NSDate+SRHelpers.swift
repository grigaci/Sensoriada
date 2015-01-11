//
//  NSDate+SRHelpers.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import Foundation

extension NSDate {

    public func SR_toString() -> String {
        let dateFormatter = NSDateFormatter.SR_sharedInstance
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        dateFormatter.locale = NSLocale.systemLocale()
        let convertedString = dateFormatter.stringFromDate(self)
        return convertedString
    }

}
