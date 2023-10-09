//
//  CategeoryExpensesDto.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation

struct CategeoryExpensesDto: Identifiable {
    var id = UUID()
    let category: String
    var amount: Double
    let date: Date
}



struct SavingsDato: Identifiable {
    let date: Date
    let value: Double
    var id = UUID()
}

struct CategoryTotal: Identifiable {
    var id = UUID()
    var category: String
    var totalAmount: Double
}


