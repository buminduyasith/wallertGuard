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

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var transactions : [TransactionDto] = []
    @Published var totalIncome : Double = 0.0
    @Published var totalExpenses : Double = 0.0

    
    func getTransactions() async{
        
        transactions.removeAll()
        
        guard let expenses = try? await ApplicationDataManger.shared.getAllExpenseByUserId() else{
            print("something happend wrong")
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
            return
        }
        
        totalIncome = incomes.reduce(0.0){ (result, income) in
            return result + income.amount
        }
       
        for income in incomes{
            
            transactions.append(TransactionDto(title: income.title, type: .income, price: income.amount, date: income.date))
        }
//        transactions = [
//               TransactionDto(id: "1", title: "Groceries", type: .expense, price: 50.0, date: Date()),
//               TransactionDto(id: "2", title: "Salary", type: .income, price: 2000.0, date: Date()),
//               TransactionDto(id: "3", title: "Rent", type: .expense, price: 1000.0, date: Date()),
//               TransactionDto(id: "4", title: "Stocks", type: .income, price: 500.0, date: Date()),
//               TransactionDto(id: "5", title: "Utilities", type: .expense, price: 150.0, date: Date())
//           ]

    }
   
    
    func AddExpense(expense : Expense) async throws{
        let db = Firestore.firestore()
        let currentUser = try AuthenticationManger.shared.getAuthenticatedUser()
        print(expense)
        try await db.collection("expenses").document().setData([
            "title": expense.subTitle,
            "amount": expense.amount,
            "date": expense.date,
            "category": expense.category,
            "userId": currentUser.id,
        ])
        
        transactions.append(TransactionDto(title: expense.subTitle, type: .expense, price: expense.amount, date: expense.date))
        
        totalExpenses = totalExpenses + expense.amount
        
        print("updated income")
        
    }
    
    func AddIncome(income : Income) async throws{
        let db = Firestore.firestore()
        let currentUser = try AuthenticationManger.shared.getAuthenticatedUser()
        print(income)
        try await db.collection("income").document().setData([
            "title": income.title,
            "amount": income.amount,
            "date": income.date,
            "userId": currentUser.id,
        ])
        
        transactions.append(TransactionDto(title: income.title, type: .income, price: income.amount, date: income.date))
        
        totalIncome = totalIncome + income.amount
        
        print("updated income")
        
    }
    
    func Test() async throws{
        guard let expenses = try? await ApplicationDataManger.shared.getAllExpenseByUserId() else{
            print("something happend wrong")
            return
        }
        
        totalIncome = totalIncome + 10
        transactions.append(TransactionDto(title: "testing", type: .expense, price: totalIncome, date: Date.now))
        print(totalIncome)
    }
    
    
}
