//
//  DashboardView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct DashboardView: View {
    @State private var currentTab: String = "expenses"
    var body: some View {
        TabView(selection: $currentTab){
            ExpensesView()
                .tag("Expenses")
                .tabItem{
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }
            
            CategoriesView()
                .tag("Categories")
                .tabItem{
                    Image(systemName: "list.clipboard.fill")
                    Text("Categories")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
