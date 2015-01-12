//
//  NSDateFormatter+SRHelpers.swift
//  SensoriadaExample
//
//  Created by Bogdan Iusco on 1/11/15.
//  Copyright (c) 2015 Grigaci. All rights reserved.
//

import Foundation

private let _SRNSDateFormatterSharedInstance = NSDateFormatter()

extension NSDateFormatter {

    class var SR_sharedInstance: NSDateFormatter {
        return _SRNSDateFormatterSharedInstance
    }
}
