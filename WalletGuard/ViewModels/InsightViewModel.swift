//
//  InsightViewModel.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-10-01.
//

import Foundation


@MainActor
class InsightViewModel : ObservableObject {
    
   @Published var chartExpensesData: [CategeoryExpensesDto] = []
//    @Published var chartExpensesData: [CategeoryExpensesDto] =   [
//        CategeoryExpensesDto(category: "Food", amount: 3000.0, date: Date.from(year: 2023, month: 8, date: 20)),
//        CategeoryExpensesDto(category: "Food", amount: 4000.0, date: Date.from(year: 2023, month: 8, date: 21)),
//        CategeoryExpensesDto(category: "Food", amount: 1500.0, date:  Date.from(year: 2023, month: 9, date: 1)),
//        CategeoryExpensesDto(category: "Food", amount: 2000.0, date: Date.from(year: 2023, month: 9, date: 15)),
//        CategeoryExpensesDto(category: "Utilities", amount: 120.0, date: Date.from(year: 2023, month: 9, date: 21)),
//        CategeoryExpensesDto(category: "Healthcare", amount: 705.0, date: Date.from(year: 2023, month: 9, date: 22)),
//        CategeoryExpensesDto(category: "Shopping", amount: 2500.0, date: Date.from(year: 2023, month: 9, date: 23)),
//    ]
//
    @Published var categoryTotals = [CategoryTotal]()
    
    func getTransactions() async{
        
        chartExpensesData.removeAll()
        
        guard let expenses = try? await ApplicationDataManger.shared.getAllExpenseByUserId() else{
            print("something happend wrong")
            return
        }
        
        for expense in expenses{
            
            let calendar = Calendar.current

//            let year = calendar.component(.year, from: expense.date)
//            let month = calendar.component(.month, from: expense.date)
//            let day = calendar.component(.day, from: expense.date)
            
            print("title \(expense.subTitle) date \(expense.date)")
           // print("year \(year) month \(month) date \(day)")
            
            
            chartExpensesData.append(CategeoryExpensesDto(category: expense.category, amount: expense.amount, date: expense.date))
            
            if let existingIndex = categoryTotals.firstIndex(where: { $0.category == expense.category }) {
                   // Category already exists, update the total amount
                   categoryTotals[existingIndex].totalAmount += expense.amount
               } else {
                   // Category doesn't exist, create a new entry
                   categoryTotals.append(CategoryTotal(category: expense.category, totalAmount: expense.amount))
               }
        }
        
        
//        guard let incomes = try? await ApplicationDataManger.shared.getAllIncomeByUserId() else{
//            print("something happend wrong")
//            return
//        }
//
//
//        for income in incomes{
//
//            chartData.append(CategeoryExpensesDto(category: expense.category, amount: expense.amount, date: expense.date))
//        }

    }
    
}
