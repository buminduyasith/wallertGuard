//
//  DateExtension.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation


extension Date{
    static func from(year: Int, month: Int, date: Int) ->Date{
        let components = DateComponents(year: year, month: month, day: date)
        return Calendar.current.date(from: components)!
    }
}
