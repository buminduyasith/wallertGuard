//
//  BudgetViewModel.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import Combine
import SwiftUI

class BudgetViewModel: ObservableObject {
    
    @Published var transactions : [TransactionDto] = []
    
    
    func getTransactions(){
        
        transactions = [
               TransactionDto(title: "Groceries", type: .expense, price: 50.0, date: Date()),
               TransactionDto(title: "Salary", type: .income, price: 2000.0, date: Date()),
               TransactionDto(title: "Rent", type: .expense, price: 1000.0, date: Date()),
               TransactionDto(title: "Stocks", type: .income, price: 500.0, date: Date()),
               TransactionDto(title: "Utilities", type: .expense, price: 150.0, date: Date())
           ]

    }
    
    
}
