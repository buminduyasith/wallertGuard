//
//  Expense.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import Foundation


struct Expense: Identifiable {
    
    let id : UUID = UUID()
    var documentId : String
    var subTitle : String
    var amount: Double
    var date: Date
    var category: String
    
    init(subTitle: String, amount: Double, date: Date, category: String) {
        self.documentId = ""
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.category = category
    }
    
    init(documentId: String, subTitle: String, amount: Double, date: Date, category: String) {
        self.documentId = documentId
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.category = category
    }
}
