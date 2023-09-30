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

@MainActor
class BudgetViewModel: ObservableObject {
    
    @Published var totalIncome : Double = 0.0
    @Published var totalExpenses : Double = 0.0
    @Published var isLoading : Bool = false
    @Published var transactions : [TransactionDto] = []
    
    func getTransactions() async{
        
        isLoading = true;
        transactions.removeAll()
        
        guard var expenses = try? await ApplicationDataManger.shared.getAllExpenseByUserId() else{
            print("something happend wrong")
            isLoading = false
            return
        }
        
        for expense in expenses{
            
            transactions.append(TransactionDto(title: expense.subTitle, type: .expense, price: expense.amount, date: expense.date))
        }
        
        totalExpenses = expenses.reduce(0.0) { (result, expense) in
            return result + expense.amount
        }
        
        
        guard var incomes = try? await ApplicationDataManger.shared.getAllIncomeByUserId() else{
            print("something happend wrong")
            isLoading = false
            return
        }
        
        totalIncome = incomes.reduce(0.0){ (result, income) in
            return result + income.amount
        }
       
        for income in incomes{
            
            transactions.append(TransactionDto(title: income.title, type: .income, price: income.amount, date: income.date))
        }
        
        isLoading = false
    }
    
    
}
