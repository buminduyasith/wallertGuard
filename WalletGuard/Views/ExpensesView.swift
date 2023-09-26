//
//  ExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct ExpensesView: View {
    @State private var isAddExpenseOpen: Bool = false
    var body: some View {
        NavigationStack{
            List{
                
            }.navigationTitle("Expenses")
            
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddExpenseOpen = true
                        }
                    label:{
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                        
                    }
                }
        }
        .sheet(isPresented: $isAddExpenseOpen){
            AddExpensesView()
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
