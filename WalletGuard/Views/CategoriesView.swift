//
//  CategoriesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct CategoriesView: View {
    @State private var addExpense: Bool = false
    var body: some View {
        NavigationStack{
            List{
                
            }.navigationTitle("Categories")
                .overlay{
                    Label("No expenses", systemImage: "tray.fill")
                        .font(.title2)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            addExpense = true
                        }
                        label:{
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        }
                    }
                }
        }
        .sheet(isPresented: $addExpense){
            Label("No expenses", systemImage: "tray.fill")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
