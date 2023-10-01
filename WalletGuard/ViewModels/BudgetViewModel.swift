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
    @Published var budgetCompletePrecentage : CGFloat = 0.0
    @Published var isLoading : Bool = false
    @Published var transactions : [TransactionDto] = []
    @Published var budgetInfo : Budget = .init(title: "", amount: 0, year: 2023, month: 1)
    
    func getTransactions() async{
        
        isLoading = true;
        transactions.removeAll()
        
        guard let expenses = try? await ApplicationDataManger.shared.getAllExpenseByUserId() else{
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
        
        
        guard let incomes = try? await ApplicationDataManger.shared.getAllIncomeByUserId() else{
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
    
    func createBudget(budget : Budget) async throws{
        let db = Firestore.firestore()
        let currentUser = try AuthenticationManger.shared.getAuthenticatedUser()
        print(budget)
        try await db.collection("budget").document(currentUser.id).setData([
            "title": budget.title,
            "amount": budget.amount,
            "year": budget.year,
            "month": budget.month,
            "userId": currentUser.id,
        ])
        
        budgetInfo = budget
    }
    
    func getBudget() async {
        
        guard let budget = try? await ApplicationDataManger.shared.getBudgetDataByUserId() else{
            print("something happend wrong - budget")
            return
        }
        
        budgetInfo = budget
        
        budgetCompletePrecentage = (totalExpenses / budget.amount) * 100
        
        print(budgetCompletePrecentage)
        
    }
    
}
