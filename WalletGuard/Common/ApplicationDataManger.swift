//
//  ApplicationData.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-26.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import Combine
import SwiftUI

class ApplicationDataManger {
    
    private var categories: [String] = []

    // MARK: - Properties

    static let shared = ApplicationDataManger()

    // MARK: -

    // Initialization

    private init() {
    }
    
    func getAllCategories() -> [String]  {
        categories = ["shopping", "education"]
        return categories
        
    }
    
    func getAllExpenseByUserId() async throws -> [Expense] {
        
        var expenses : [Expense] = []
        let db = Firestore.firestore()
        let currentUser = try AuthenticationManger.shared.getAuthenticatedUser()
        
        let snapshort =  try await db.collection("expenses").whereField("userId", isEqualTo: currentUser.id).getDocuments()
        
        if(snapshort.isEmpty){
            return expenses
        }
        for document in snapshort.documents {
            let documentData = document.data()
            
            let title = documentData["title"] as? String ?? ""
            let amount = documentData["amount"] as? Double ?? 0
            let date  = documentData["date"] as? Date ?? Date.now
            let category = documentData["category"] as? String ?? ""
            
            print("\(document.documentID) => \(document.data())")
            expenses.append(Expense(subTitle: title, amount: amount, date: date, category: category))
            
        }
        
        return expenses
        
    }
    
    func getAllIncomeByUserId() async throws -> [Income] {
        
        var incomes : [Income] = []
        let db = Firestore.firestore()
        let currentUser = try AuthenticationManger.shared.getAuthenticatedUser()
        
        let snapshort =  try await db.collection("income").whereField("userId", isEqualTo: currentUser.id).getDocuments()
        
        if(snapshort.isEmpty){
            return incomes
        }
        for document in snapshort.documents {
            let documentData = document.data()
            
            let title = documentData["title"] as? String ?? ""
            let amount = documentData["amount"] as? Double ?? 0
            let date  = documentData["date"] as? Date ?? Date.now
            
            print("\(document.documentID) => \(document.data())")
            incomes.append(Income(title: title, amount: amount, date: date))
            
        }
        
        return incomes
        
    }

}
