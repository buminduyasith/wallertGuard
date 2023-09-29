//
//  HomeViewModel.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var transactions : [TransactionDto] = []
    
    
    func getTransactions(){
        
        transactions = [
               TransactionDto(id: "1", title: "Groceries", type: .expense, price: 50.0, date: Date()),
               TransactionDto(id: "2", title: "Salary", type: .income, price: 2000.0, date: Date()),
               TransactionDto(id: "3", title: "Rent", type: .expense, price: 1000.0, date: Date()),
               TransactionDto(id: "4", title: "Stocks", type: .income, price: 500.0, date: Date()),
               TransactionDto(id: "5", title: "Utilities", type: .expense, price: 150.0, date: Date())
           ]

    }
    
    
}
