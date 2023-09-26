//
//  Expense.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import Foundation


public struct Expense {
    
    var id : UUID
    var subTitle : String
    var amount: Double
    var date: Date
    
    init(subTitle: String, amount: Double, date: Date) {
        self.id = UUID()
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
    }
}
