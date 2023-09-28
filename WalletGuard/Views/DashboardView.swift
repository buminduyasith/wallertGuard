//
//  DashboardView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI
import FirebaseAuth

struct DashboardView: View {
    @State private var currentTab: String = "expenses"
    @State var isLoggedIn = true
    @ObservedObject var vm = UserViewModel()
    
    init(){
        
      
        
    }
    var body: some View {
        
        if isLoggedIn == true{
            content
        }
        else{
            
            LoginView()
        }
    }
    
    var content: some View {
        TabView(selection: $currentTab){
            
            Home()
                .tag("Home")
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            BudgetView()
                .tag("Budget")
                .tabItem{
                    Image(systemName: "creditcard.fill")
                    Text("Budget")
                }
            
            InsightsView()
                .tag("Insights")
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Budget")
                }
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener{auth, user in
                
                if user == nil{
                    isLoggedIn = false
                }
                
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
