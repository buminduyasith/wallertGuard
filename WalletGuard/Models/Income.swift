//
//  Income.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-30.
//

import Foundation


struct Income: Identifiable{
    
    var id : UUID
    var documentId : String
    var title : String
    var amount: Double
    var date: Date
    
    
    init(title: String, amount: Double, date: Date) {
        self.documentId = ""
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.date = date
    }
    
    
    init(documentId: String, title: String, amount: Double, date: Date) {
        self.documentId = documentId
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.date = date
    }
    
    
}
