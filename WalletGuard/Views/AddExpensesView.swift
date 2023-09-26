//
//  AddExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct AddExpensesView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            List{
                
            }
            .navigationTitle("Add Expense")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Cancel"){
                        dismiss()
                    }
                    .tint(.red)
                }
            }
        }
    }
}

struct AddExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpensesView()
    }
}
