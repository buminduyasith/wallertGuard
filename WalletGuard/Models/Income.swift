//
//  Income.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-30.
//

import Foundation


struct Income: Identifiable{
    
    var id : UUID
    var title : String
    var amount: Double
    var date: Date
    
    
    init(title: String, amount: Double, date: Date) {
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.date = date
    }
    
}
