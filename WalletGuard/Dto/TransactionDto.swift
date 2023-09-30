//
//  Transaction.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation


struct TransactionDto : Identifiable{
    
    let id: UUID = UUID()
    var title: String
    var type: TransactionType
    var price: Double
    var date: Date
}
