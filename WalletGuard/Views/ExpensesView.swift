//
//  ExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct ExpensesView: View {
    @State private var isAddExpenseOpen: Bool = false
    @State private var title: String = ""
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }

    var body: some View {
        NavigationStack{
            VStack{
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .navigationTitle("Expenses")
            
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
            AddExpenseSheetView()
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
