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
    let amount: Double
    let date: Date
}



struct SavingsDato: Identifiable {
    let date: Date
    let value: Double
    var id = UUID()
}

