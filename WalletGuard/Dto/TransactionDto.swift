//
//  Transaction.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation


struct TransactionDto : Identifiable{
    
    var id: String
    var title: String
    var type: TransactionType
    var price: Double
    var date: Date
}
