//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Maybelline Rivas on 9/8/23.
//

import Foundation

extension Decimal { //converts a decimal value to a double value
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
