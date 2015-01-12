//
//  String+SRHelpers.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import Foundation

extension String {
    public func SR_toDate() -> NSDate! {
        let dateFormatter = NSDateFormatter.SR_sharedInstance
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = NSLocale.systemLocale()
        let convertedDate = dateFormatter.dateFromString(self)
        return convertedDate
    }

}
